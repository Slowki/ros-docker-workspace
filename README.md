# ROS Docker Workspace Example
This repo contains an example Docker-based ROS workspace.

## Dependencies
* [Docker](https://docker.com)
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) >= 2

## Usage
The `run` script will build the image, start it, and mount `workspace` to `/home/<YOUR USERNAME>/workspace`. Inside the container you should be able to use any GUI-based tools you want.
