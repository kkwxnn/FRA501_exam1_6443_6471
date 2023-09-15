from launch import LaunchDescription,LaunchContext
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os
from launch.actions import DeclareLaunchArgument,ExecuteProcess,OpaqueFunction
from launch.substitutions import LaunchConfiguration
import yaml

def generate_launch_description():

    kill_turtle = ExecuteProcess(cmd = ['ros2 service call /remove_turtle turtlesim/srv/Kill "name: turtle1"'], shell=True)
    spawn_foxy = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Foxy','\'}"']], shell=True)
    spawn_noetic = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Noetic','\'}"']], shell=True)
    spawn_humble = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Humble','\'}"']], shell=True)
    spawn_iron = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Iron','\'}"']], shell=True)

    turtlesim = Node(
        package='turtlesim_plus',
        executable='turtlesim_plus_node.py'
    )

    launch_description = LaunchDescription()
    launch_description.add_action(turtlesim)
    launch_description.add_action(kill_turtle)
    launch_description.add_action(spawn_foxy)
    launch_description.add_action(spawn_noetic)
    launch_description.add_action(spawn_humble)
    launch_description.add_action(spawn_iron)
    return launch_description