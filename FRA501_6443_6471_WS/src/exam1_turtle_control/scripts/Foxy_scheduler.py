#!/usr/bin/python3

from typing import List
import rclpy
from rclpy.context import Context
from rclpy.node import Node
from rclpy.parameter import Parameter
from turtlesim_interfaces.srv import SendPosition
from std_srvs.srv import Empty
import yaml, argparse

class Foxy_scheduler(Node):
    def __init__(self, file_path:str):
        super().__init__('Foxy_scheduler')
        self.idx = 0
        self.goal_point_client = self.create_client(SendPosition,'GoalPoint')
        self.create_service(Empty,'noti_arrival',self.noti_arrival_callback)

        with open(file=file_path, mode= 'r') as file:
            data = yaml.load(file, Loader=yaml.SafeLoader)
        self.via_point = data['via_point']
        self.num_via_point = len(self.via_point)
        self.send_goal()

    def update(self):
        if self.idx < self.num_via_point -1:
            self.idx += 1
            self.send_goal()
        else :
            self.complete()

    def send_goal(self):
        x,y = self.via_point[self.idx]
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
    node = Foxy_scheduler()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
