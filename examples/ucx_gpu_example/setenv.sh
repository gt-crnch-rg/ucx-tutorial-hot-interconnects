#!/bin/bash
# This script helps to set up your path to compile and run UCX examples
# Usage: source setenv.sh

export UCX_ROOT=/opt/ucx-1.10.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${UCX_ROOT}/lib
