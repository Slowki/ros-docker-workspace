FROM osrf/ros:melodic-desktop-full

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ARG SHELL=bash
# download whichever SHELL the user uses
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y $SHELL && \
    apt-get clean

ARG USER
ARG UID
ARG GID

# setup the user
RUN groupadd -g $GID $USER && \
    useradd -r $USER -u $UID -g $GID -s $(which $SHELL) && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir -p /home/$USER/ && \
    echo "source /opt/ros/melodic/setup.$SHELL" >> /home/$USER/.${SHELL}rc && \
    echo "[ -e ~/workspace/devel/setup.$SHELL ] && source ~/workspace/devel/setup.$SHELL" >> /home/$USER/.${SHELL}rc && \
    chown -R $UID:$GID /home/$USER

USER $USER
WORKDIR /home/$USER/workspace

USER $USER
WORKDIR /home/$USER/workspace
