FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# set working directory 
RUN mkdir -p /workspace
WORKDIR /workspace

# set userinfo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy files from current folder
COPY ./DualCross /workspace/DualCross

# install denpendies
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update && apt-get install -y fish curl wget
RUN apt-key del 7fa2af80 && curl -L -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb && dpkg -i cuda-keyring_1.0-1_all.deb

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
#     bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
# ENV PATH /opt/conda/bin:$PATH
# RUN conda create -n myenv python=3.6.10 --file /workspace/DualCross/requirements.txt
# RUN pip install nuscenes-devkit tensorboardX efficientnet_pytorch==0.7.0

# RUN dpkg -i /workspace/sapeon/sapeon-sdk_1.3.2.deb

# # install sapeon_env
# RUN cd /workspace/sapeon_env && \
#     bash ./_build.sh
