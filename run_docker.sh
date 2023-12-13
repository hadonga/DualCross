docker build -t dualcross_${1} .

docker run -itd \
        --gpus all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /data:/data \
        -v ~/DualCross/:/workspace/DualCross \
        --privileged \
        --network=host \
        dualcross_${1}
