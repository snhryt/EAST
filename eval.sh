#!/usr/bin/env bash
set -eu

# Below commands does not seem to work, so you should download 2 objects manually from the URLs in README.md

# if [ ! -e "east_icdar2015_resnet_v1_50_rbox" ]; then
#   wget "https://drive.google.com/uc?export=download&id=0B3APw5BZJ67ETHNPaU9xUkVoV0U" -O "east_icdar2015_resnet_v1_50_rbox.zip"
#   unzip "east_icdar2015_resnet_v1_50_rbox.zip"
# fi

# if [ ! -e "resnet_v1_50.ckpt" ]; then
#   wget "http://download.tensorflow.org/models/resnet_v1_50_2016_08_28.tar.gz"
#   tar -xzvf "resnet_v1_50_2016_08_28.tar.gz"
# fi

pip3 install -U Shapely \
                Flask \
                matplotlib \
                scipy \
                plumbum \
                numpy \
                ipython \
                Pillow

apt install -qqy python3-tk

python3 eval.py \
        --test_data_path=/workdir/datasets/AmazonBookCoverImages/random100 \
        --gpu_list=0,1 \
        --checkpoint_path=./east_icdar2015_resnet_v1_50_rbox \
        --output_dir=/workdir/results/SegmentedTextRegionImages_EAST/random100