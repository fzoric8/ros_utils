#!/bin/bash

echo "Container name: $1" 
echo "Copy location: $2" 

docker cp $1:/home/developer/catkin_ws/src/med_uav_control/experiments/exp_2022-01-31-17-23-43.bag $2

# How to copy multiple docker files/e.g. multiple bags
#for f in data/*txt; do docker cp $f sandbox_web_1:/usr/src/app/data/; done
