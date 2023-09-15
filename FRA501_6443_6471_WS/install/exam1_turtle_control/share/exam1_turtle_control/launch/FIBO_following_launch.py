from launch import LaunchDescription,LaunchContext
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os
from launch.actions import DeclareLaunchArgument,ExecuteProcess,OpaqueFunction
from launch.substitutions import LaunchConfiguration
import yaml

def modify_config_namespace(path:str,new_path:str,nodename:str,namespace:str):
    with open(path,'r') as file:
        data = yaml.load(file,Loader=yaml.SafeLoader)
    nodename_data = {nodename: data}
    namespace_data = {namespace: nodename_data}
    with open(new_path,'w') as file:
        yaml.dump(namespace_data,file)

def generate_launch_description():

    kill_turtle = ExecuteProcess(cmd = ['ros2 service call /remove_turtle turtlesim/srv/Kill "name: turtle1"'], shell=True)
    spawn_Foxy = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Foxy','\'}"']], shell=True)
    spawn_Noetic = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Noetic','\'}"']], shell=True)
    spawn_Humble = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Humble','\'}"']], shell=True)
    spawn_Iron = ExecuteProcess(cmd = [['ros2 service call /spawn_turtle turtlesim/srv/Spawn "{x: ','1.0',', y: ','1.0',', theta: 0.0, name: \'','Iron','\'}"']], shell=True)

    turtlesim = Node(
        package='turtlesim_plus',
        executable='turtlesim_plus_node.py'
    )

    my_pkg = get_package_share_directory('exam1_turtle_control')
    config_path = os.path.join(my_pkg,'config','control_parameter.yaml')
    new_Foxy_config_path = os.path.join(my_pkg,'config','control_config_Foxy.yaml')
    new_Noetic_config_path = os.path.join(my_pkg,'config','control_config_Noetic.yaml')
    new_Humble_config_path = os.path.join(my_pkg,'config','control_config_Humble.yaml')
    new_Iron_config_path = os.path.join(my_pkg,'config','control_config_Iron.yaml')

    modify_config_namespace(config_path,new_Foxy_config_path,"Foxy_controller","Foxy")
    modify_config_namespace(config_path,new_Noetic_config_path,"Noetic_controller","Noetic")
    modify_config_namespace(config_path,new_Humble_config_path,"Humble_controller","Humble")
    modify_config_namespace(config_path,new_Iron_config_path,"Iron_controller","Iron")

    Foxy_controller = Node(
        package='exam1_turtle_control',
        executable='Foxy_controller.py',
        # namespace='Foxy',
        parameters=[new_Foxy_config_path]
    )

    Noetic_controller = Node(
        package='exam1_turtle_control',
        executable='Noetic_controller.py',
        # namespace='Noetic',
        parameters=[new_Noetic_config_path]
    )

    Humble_controller = Node(
        package='exam1_turtle_control',
        executable='Humble_controller.py',
        # namespace='Humble',
        parameters=[new_Humble_config_path]
    )

    Iron_controller = Node(
        package='exam1_turtle_control',
        executable='Iron_controller.py',
        # namespace='Iron',
        parameters=[new_Iron_config_path]
    )

    launch_description = LaunchDescription()
    launch_description.add_action(turtlesim)
    launch_description.add_action(kill_turtle)
    launch_description.add_action(spawn_Foxy)
    launch_description.add_action(spawn_Noetic)
    launch_description.add_action(spawn_Humble)
    launch_description.add_action(spawn_Iron)
    launch_description.add_action(Foxy_controller)
    launch_description.add_action(Noetic_controller)
    launch_description.add_action(Humble_controller)
    launch_description.add_action(Iron_controller)

    return launch_description