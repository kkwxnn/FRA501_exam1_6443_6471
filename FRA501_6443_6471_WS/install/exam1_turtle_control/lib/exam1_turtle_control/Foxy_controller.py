from typing import List
import rclpy
from rclpy.context import Context
from rclpy.node import Node
from rclpy.parameter import Parameter
from turtlesim.msg import Pose
from geometry_msgs.msg import Point,Twist
import math

class Foxy_Controller(Node):
    def __init__(self):
        super().__init__('Foxy_controller')
        # self.create_timer(0.01,self.timer_callback)
        self.pub_cmd_vel = self.create_publisher(Twist, "Foxy/cmd_vel",10)

        self.create_subscription(Pose, "Foxy/pose", self.turtle_pose_callback, 10)
        self.create_subscription(Point, "mouse_position", self.target_pose_callback,10)

        self.turtle_target_pose = [0.0, 0.0]
        self.turtle_current_pose = [0.0, 0.0, 0.0]
        self.isControllerEna = False

        self.declare_parameter('Linear_gain')
        self.declare_parameter('Angular_gain')
        self.L_gain = self.get_parameter('Linear_gain').value
        self.A_gain = self.get_parameter('Angular_gain').value
        
    def target_pose_callback(self, msg):
        self.turtle_target_pose = [msg.x, msg.y]
        self.isControllerEna = True

    def turtle_pose_callback(self,msg):
        self.turtle_current_pose =[msg.x, msg.y, msg.theta]
        print(self.turtle_current_pose)

    def cmd_vel_pub(self, vx,w):
        cmd_vel = Twist()
        cmd_vel.linear.x = vx
        cmd_vel.angular.z = w
        self.pub_cmd_vel.publish(cmd_vel)
    
    def controller(self):
        dx = self.turtle_target_pose[0]-self.turtle_current_pose[0]
        dy = self.turtle_target_pose[1]-self.turtle_current_pose[1]
        alpha = math.atan2(dy,dx)
        dis_err = math.hypot(dx,dy)
        ori_err = alpha - self.turtle_current_pose[2]
        pass
    
    def main(args=None):
        rclpy.init(args=args)
        node = Foxy_Controller()
        rclpy.spin(node)
        node.destroy_node()
        rclpy.shutdown()

    if __name__ == '__main__':
        main()