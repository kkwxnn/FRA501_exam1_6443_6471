#!/usr/bin/python3

from typing import List
import rclpy
from rclpy.context import Context
from rclpy.node import Node
from rclpy.parameter import Parameter
from turtlesim_interfaces.srv import SendPosition
from std_srvs.srv import Empty
import yaml, argparse

class Humble_scheduler(Node):
    def __init__(self):
        super().__init__('Humble_scheduler')
        name = 'Humble'
        self.idx = 0
        self.goal_point_client = self.create_client(SendPosition,name+'/GoalPoint')
        self.create_service(Empty,name+'/noti_arrival',self.noti_arrival_callback)

        self.declare_parameter('x_point')
        self.declare_parameter('y_point')
        self.x_point = self.get_parameter('x_point').value
        self.y_point = self.get_parameter('y_point').value
        self.num_via_point = len(self.x_point)
        self.send_goal()

    def update(self):
        if self.idx < self.num_via_point - 1:
            self.idx += 1
            self.send_goal()
        else :
            self.complete()

    def send_goal(self):
        x = self.x_point[self.idx]
        y = self.y_point[self.idx]
        request = SendPosition.Request()
        request.position.x = x
        request.position.y = y
        self.goal_point_client.call_async(request)
    
    def noti_arrival_callback(self, request: Empty.Request, response: Empty.Response):
        self.update()
        return response

    def complete(self):
        pass

def main(args=None):
    rclpy.init(args=args)
    node = Humble_scheduler()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()