FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel
# FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# set working directory 
RUN mkdir -p /workspace
WORKDIR /workspace

# set userinfo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy files from current folder
COPY ./ /workspace/DualCross

# install denpendies
# RUN rm /etc/apt/sources.list.d/cuda.list
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list

# RUN apt-key del 7fa2af80 && curl -L -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb && dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update && apt-get install -y fish curl wget
RUN apt-get -y install libgl1-mesa-glx libglib2.0-dev 


# install pip
RUN pip install --upgrade pip
RUN pip install -r /workspace/DualCross/requirements.txt