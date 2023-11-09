docker build -t donghe/mtms_${1} .

docker run -itd \
        --gpus all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /data:/data \
        -v ~/0_mtms/:/workspace/0_mtms \
        --privileged \
        --network=host \
        donghe/mtms_${1}
