#!/usr/bin/python3

from typing import List
import rclpy
from rclpy.node import Node
from rclpy.parameter import Parameter
from turtlesim.msg import Pose
from geometry_msgs.msg import Point,Twist
from turtlesim_interfaces.srv import SendPosition
from turtlesim_plus_interfaces.srv import GivePosition
from std_srvs.srv import Empty
import math

class Noetic_Controller(Node):
    def __init__(self):
        super().__init__('Noetic_controller')
        name = 'Noetic'
        self.create_timer(0.01,self.timer_callback)
        self.pub_cmd_vel = self.create_publisher(Twist, name+"/cmd_vel",10)

        self.create_subscription(Pose, name+"/pose", self.turtle_pose_callback, 10)
        self.create_service(SendPosition,name+'/GoalPoint',self.set_goal_point_callback)
        self.noti_arrival_client = self.create_client(Empty,name+'/noti_arrival')
        self.spawn_pizza_client = self.create_client(GivePosition,"spawn_pizza")

        self.turtle_target_pose = [0.0, 0.0]
        self.turtle_current_pose = [0.0, 0.0, 0.0]
        self.isControllerEna = False

        self.declare_parameter('Linear_gain',5.0)
        self.declare_parameter('Angular_gain',20.0)
        self.declare_parameter('tolerance',0.1)
        self.L_gain = self.get_parameter('Linear_gain').value
        self.A_gain = self.get_parameter('Angular_gain').value
        self.Tol = self.get_parameter('tolerance').value


    def set_goal_point_callback(self, request: SendPosition.Request, response: SendPosition.Response):
        self.turtle_target_pose = [request.position.x, request.position.y]
        print(self.turtle_target_pose)
        self.isControllerEna = True
        return response

    def turtle_pose_callback(self,msg):
        self.turtle_current_pose =[msg.x, msg.y, msg.theta]

    def cmd_vel_pub(self, vx,w):
        cmd_vel = Twist()
        cmd_vel.linear.x = vx
        cmd_vel.angular.z = w
        self.pub_cmd_vel.publish(cmd_vel)

    def spawn_pizza(self,position):
        pizza_pos = GivePosition.Request()
        pizza_pos.x = position[0]
        pizza_pos.y = position[1]
        self.spawn_pizza_client.call_async(pizza_pos)

    def timer_callback(self):
        if self.isControllerEna:
            self.controller()
    
    def controller(self):
        dx = self.turtle_target_pose[0]-self.turtle_current_pose[0]
        dy = self.turtle_target_pose[1]-self.turtle_current_pose[1]
        alpha = math.atan2(dy,dx)
        dis_err = math.hypot(dx,dy)
        ori_err = alpha - self.turtle_current_pose[2]
        ori_err = math.atan2(math.sin(ori_err),math.cos(ori_err))
        dis_u = dis_err*self.L_gain
        ori_u = ori_err*self.A_gain
        if dis_err <= self.Tol:
            self.cmd_vel_pub(0.0,0.0)
            self.spawn_pizza(self.turtle_target_pose)
            self.noti_arrival_client.call_async(Empty.Request())
            self.isControllerEna = False
        else:
            self.cmd_vel_pub(dis_u,ori_u)

def main(args=None):
    rclpy.init(args=args)
    node = Noetic_Controller()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()