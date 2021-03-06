#!/bin/bash
cd 
python3 -m venv .venv_pytorch_15
echo "alias PYTORCH='source ~/.venv_pytorch_15/bin/activate'" >> ~/.bashrc
source ~/.venv_pytorch_15/bin/activate
wget https://nvidia.box.com/shared/static/3ibazbiwtkl181n95n9em3wtrca7tdzp.whl -O torch-1.5.0-cp36-cp36m-linux_aarch64.whl
pip3 install --upgrade pip
pip3 install Cython wheel
pip3 install numpy torch-1.5.0-cp36-cp36m-linux_aarch64.whl
ln -s /usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-aarch64-linux-gnu.so ~/.venv_pytorch_15/lib/python3.6/site-packages/cv2.so

git clone --branch v0.6.0 https://github.com/pytorch/vision torchvision   # see below for version of torchvision to download
cd torchvision
python3 setup.py install
cd ../  # attempting to load torchvision from build dir will result in import error
