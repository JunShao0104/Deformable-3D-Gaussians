# # Original dockerfile
# FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

# RUN apt-get update && apt-get install wget -yq
# RUN apt-get install build-essential g++ gcc -y
# ENV DEBIAN_FRONTEND noninteractive
# RUN apt-get install libgl1-mesa-glx libglib2.0-0 -y
# RUN apt-get install openmpi-bin openmpi-common libopenmpi-dev libgtk2.0-dev git -y

# # Install miniconda
# ENV CONDA_DIR /opt/conda
# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#      /bin/bash ~/miniconda.sh -b -p /opt/conda
# # Put conda in path so we can use conda activate
# ENV PATH=$CONDA_DIR/bin:$PATH
# RUN conda install python=3.8
# RUN conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch
# RUN pip install Pillow==8.4.0
# RUN pip install tqdm
# RUN pip install torchpack
# RUN pip install mmcv==1.4.0 mmcv-full==1.4.0 mmdet==2.20.0
# RUN pip install nuscenes-devkit
# RUN pip install mpi4py==3.0.3
# RUN pip install numba==0.48.0


#############################################################################################3
# Lingjun version dockerfile
# check whether 11.6 cuda is compatible with 560 driver
FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/root/.local/lib/python3.10/site-packages:$PYTHONPATH
ENV NVIDIA_DRIVER_CAPABILITIES=all

# add libglvnd support (More info: https://hub.docker.com/r/nvidia/opengl)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        vim \
        git \ 
        unzip \
        ffmpeg \
        libsm6 \
        libxext6 \
        tmux \
        build-essential \
        ninja-build \
        # Dependencies for the SIBR interactive viewer
        libglew-dev \
        libassimp-dev \
        libboost-all-dev \
        libgtk-3-dev \
        libopencv-dev \
        libglfw3-dev \
        libavdevice-dev \
        libavcodec-dev \
        libeigen3-dev \
        libxxf86vm-dev \
        libembree-dev \
        libglm-dev

# python base
RUN apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
        python3


# # TODO: Check whether the server exists Miniconda already or not
# # Install miniconda
# ENV CONDA_DIR /opt/conda
# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#     /bin/bash ~/miniconda.sh -b -p /opt/conda

# # Put conda in path so we can use conda activate
# ENV PATH=$CONDA_DIR/bin:$PATH

# make python modules in /root/.local visible to non-root users
RUN find /root -type d -exec chmod 755 {} +

RUN rm -rf /tmp/* /var/lib/apt/lists/*