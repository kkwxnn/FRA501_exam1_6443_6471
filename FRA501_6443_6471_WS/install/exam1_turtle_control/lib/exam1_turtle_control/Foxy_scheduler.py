#!/usr/bin/python3

from typing import List
import rclpy
from rclpy.context import Context
from rclpy.node import Node
from rclpy.parameter import Parameter
import yaml

class Foxy_scheduler(Node):
    def __init__(self, file_path:str):
        super().__init__('Foxy_scheduler')

        with open(file=file_path, mode= 'r') as file:
            data = yaml.load(file, Loader=yaml.SafeLoader)
        via_point = data['via_point']
        self.num_via_point = len(via_point)