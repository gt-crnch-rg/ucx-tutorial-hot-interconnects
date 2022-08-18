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
}

install_ucx_source()
{
	wget https://github.com/openucx/ucx/releases/download/v${UCX_VERSION}/ucx-${UCX_VERSION}.tar.gz
	tar xzf ucx-${UCX_VERSION}.tar.gz
	cd ucx-${UCX_VERSION}
	mkdir build && cd build
	../configure --prefix=$INSTALL_PATH
	make -j4 && make install
}

install_ucx_source
