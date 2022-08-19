#!/bin/bash
# This script shows how to install UCX from source
# Usage: ./install_ucx_source.sh

#Specify which version to install
UCX_VERSION=1.13.0
#Change this string to point to a different path
INSTALL_PATH=/opt/ucx-$UCX_VERSION

install_dependencies()
{
	printf "Installing dependencies"
	sudo apt install nvidia-cuda-toolkit
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

}

#Use this to install UCX from source without CUDA support 
install_ucx_source

#Use this to install UCX with miniConda and GPU support
install_ucx_conda_gpu
