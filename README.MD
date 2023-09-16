# exam1_turtle_control
## Installation
Step 1: Clone the repo to the src directory of your workspace. You must unzip and put each folder in the src directory.
```
Step 2: Build "exam1_turtle_control" in your workspace.
```
cd ~/[your_workspace]
colcon build --packages-select exam1_turtle_control
source install/setup.bash
```
## Testing out exam1_turtle_control
Terminal1: run launch file
```
cd ~/[your_workspace]
ros2 launch exam1_turtle_control FIBO_following_launch.py 
```
