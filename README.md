# ROS Docker Workspace Example
This repo contains an example Docker-based ROS workspace.

## Dependencies
* [Docker](https://docker.com)
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) >= 2

## Usage
### Start the Container
```sh
./run # or ./run start [COMMAND]
```

### Exec into the Container
```sh
./run exec [COMMAND]
```

### Remove the Container
```sh
./run rm
```

### Remove the Image
```sh
./run rmi
```
