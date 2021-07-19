#!/bin/bash

# Copyright (c) Facebook, Inc. and its affiliates.

set -ex

mkdir -p extra_data/body_module
mkdir -p extra_data/body_module/data_from_spin
mkdir -p extra_data/body_module/pretrained_weights

cd extra_data/body_module

echo "Downloading extra data from SPIN"
curl.exe -o ./data.tar.gz  http://visiondata.cis.upenn.edu/spin/data.tar.gz && tar -xvf data.tar.gz && rm data.tar.gz
mv ./data/* data_from_spin

echo "Downloading pretrained model"
mkdir -p pretrained_weights
cd pretrained_weights
curl.exe -o ./2020_05_31-00_50_43-best-51.749683916568756.pt https://dl.fbaipublicfiles.com/eft/2020_05_31-00_50_43-best-51.749683916568756.pt
curl.exe -o ./smplx-03-28-46060-w_spin_mlc3d_46582-2089_2020_03_28-21_56_16.pt https://dl.fbaipublicfiles.com/eft/fairmocap_data/body_module/smplx-03-28-46060-w_spin_mlc3d_46582-2089_2020_03_28-21_56_16.pt
cd ../data_from_spin

echo "Downloading other data"
curl.exe -o ./J_regressor_extra_smplx.npy https://dl.fbaipublicfiles.com/eft/fairmocap_data/body_module/J_regressor_extra_smplx.npy


# if [ ! -d "sample_data" ] 
# then
#     echo "Downloading sample videos"
#     wget https://dl.fbaipublicfiles.com/eft/sampledata_frank.tar && tar -xvf sampledata_frank.tar && rm sampledata_frank.tar && mv sampledata sample_data
# else
#     echo "There exists sample_data already"
# fi

echo "Done"
