from typing import List
import rclpy
from rclpy.context import Context
from rclpy.node import Node
from rclpy.parameter import Parameter
from turtlesim.msg import Pose

class Foxy_Controller(Node):
    def __init__(self):
        super().__init__('Foxy_controller')
        # self.create_timer(0.01,self.timer_callback)
        self.create_subscription(Pose, "Foxy/pose", self.turtle_pose_callback, 10)

        self.turtle_current_pose = [0.0, 0.0, 0.0]
        self.kp_dis = 0.5
        self.kp_ori = 1.0
        
    def turtle_pose_callback(self,msg):
        self.turtle_current_pose =[msg.x, msg.y, msg.theta]
        print(self.turtle_current_pose)
    
    def controller(self):
        pass