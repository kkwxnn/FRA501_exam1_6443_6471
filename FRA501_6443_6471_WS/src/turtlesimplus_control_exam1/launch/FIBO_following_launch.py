from launch import LaunchDescription,LaunchContext
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os
from launch.actions import DeclareLaunchArgument,ExecuteProcess,OpaqueFunction
from launch.substitutions import LaunchConfiguration
import yaml

def generate_launch_description():
    x_launch_arg = DeclareLaunchArgument('x', default_value='0.0')
    y_launch_arg = DeclareLaunchArgument('y', default_value='0.0')

    kill_turtle = ExecuteProcess(cmd = ["ros2 service call /kill turtlesim/srv/Kill \"name: 'turtle1'\""], shell=True)
    spawn_turtle = ExecuteProcess(cmd = ['ros2 service call /spawn turtlesim/srv/Spawn "{x: ',0,', y: ',0,', theta: 0.0, name: \'','Foxy','\'}"'], shell=True)
    spawn_turtle = ExecuteProcess(cmd = ['ros2 service call /spawn turtlesim/srv/Spawn "{x: ',0,', y: ',0,', theta: 0.0, name: \'','Neotic','\'}"'], shell=True)
    spawn_turtle = ExecuteProcess(cmd = ['ros2 service call /spawn turtlesim/srv/Spawn "{x: ',0,', y: ',0,', theta: 0.0, name: \'','Humble','\'}"'], shell=True)
    spawn_turtle = ExecuteProcess(cmd = ['ros2 service call /spawn turtlesim/srv/Spawn "{x: ',0,', y: ',0,', theta: 0.0, name: \'','Iron','\'}"'], shell=True)

    turtlesim = Node(
        package='turtlesim_plus',
        executable='turtlesim_plus_node.py'
    )

    launch_description = LaunchDescription()
    launch_description.add_action(turtlesim)
    launch_description.add_action(x_launch_arg)
    launch_description.add_action(y_launch_arg)
    launch_description.add_action(kill_turtle)
    launch_description.add_action(spawn_turtle)
    return launch_description

