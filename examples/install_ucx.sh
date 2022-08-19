#!/bin/bash
# This script shows how to install UCX from source
# This script was tested on Ubuntu 18 and RHEL7
# Usage: ./install_ucx_source.sh

#Specify which version to install
UCX_VERSION=1.13.0
#Change this string to point to a different path
INSTALL_PATH=/opt/ucx-$UCX_VERSION

install_dependencies()
{
	printf "Installing dependencies"
	#You can use this function to add and install dependencies like CUDA
	#sudo apt install nvidia-cuda-toolkit
}

#Build from source without CUDA support
install_ucx_source()
{
	wget https://github.com/openucx/ucx/releases/download/v${UCX_VERSION}/ucx-${UCX_VERSION}.tar.gz
	tar xzf ucx-${UCX_VERSION}.tar.gz
	cd ucx-${UCX_VERSION}
	
	#Configure and build UCX from source
	mkdir build && cd build
	./configure --prefix=$INSTALL_PATH
	make -j4 && make install

	#Clean up the build directory and tarball
	cd .. && rm -rf ucx-${UCX_VERSION}
}

install_ucx_conda_gpu()
{
	printf "Installing and activating the latest Conda UCX GPU instance"
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	#Note you will need to follow and answer the prompts
	chmod a+x Miniconda3*.sh&& ./Miniconda3-latest-Linux-x86_64.sh
	#Clean up the Miniconda install
	rm Miniconda3-latest-Linux-x86_64.sh
	
	#Initialize Conda 
	eval "$(${HOME}/miniconda3/bin/conda shell.bash hook)"
	#Install the packages used for this tutorial
	conda create -n ucx_gpu -c conda-forge -c rapidsai nvidia cuda-nvcc ucx-proc=*=gpu ucx ucx-py python=3.9
	#Activate this new environment; remember to use conda deactivate to leave the environment
	conda activate ucx_gpu
}


#Check option specified by a user and run one of the functions
shopt -s nocasematch

echo "Specify which install option you would like to try - 'ucxsource' or 'ucxconda'"
read option
case $option in
	ucxsource)
	  #Use this to install UCX from source without CUDA support 
	  install_ucx_source
	;;
	ucxconda)
	  #Use this to install UCX with miniConda and GPU support
	  install_ucx_conda_gpu
	;;
	*)
	echo "No option selected - exiting"
	;;
esac
