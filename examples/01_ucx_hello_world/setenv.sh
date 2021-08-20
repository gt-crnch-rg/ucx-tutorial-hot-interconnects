#!/bin/bash
# This script helps to set up your path to compile and run UCX examples
# Usage: source setenv.sh

#You can install UCX using Anaconda, Spack, or from source
#For example with Anaconda: 
#export UCX_PATH=$(HOME)/local/anaconda3/envs/shmem-py/

#Here we assume that you have set your path from a source build - this needs to be changed for your local installation
export UCX_PATH=/opt/ucx-1.10.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${UCX_PATH}/lib
