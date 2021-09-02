#!/bin/bash

echo "Container name: $1" 
echo "Copy location: $2" 

docker cp $1:/home/developer/moveit_ws/src/schunk_lwa4p_ros/schunk_lwa4p_control/scripts/servo_bag_0209.bag $2

# How to copy multiple docker files/e.g. multiple bags
#for f in data/*txt; do docker cp $f sandbox_web_1:/usr/src/app/data/; done
