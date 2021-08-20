### Overview

We provide some information and links to install UCX, noting that there are several paths to a working installation. The source build is relatively low overhead and likely will work the best with the provided examples. We recommend running at least UCX 1.10 for most examples and use cases.

* Conda currently supports UCX 1.9 and UCX-Py 0.21.0
* Spack installs UCX 1.10.1 by default on many systems but may default to 1.9 for certain architectures.
* As of August 2021, [UCX 1.11.0](https://github.com/openucx/ucx/releases/tag/v1.11.0) is the latest stable release for source builds. 

### Installing UCX via anaconda

** NOTE ** The UCX conda package does not support IB/RDMA (OFED) builds by default. See [this guide](https://ucx-py.readthedocs.io/en/latest/install.html#ucx-ofed) if you need to build OFED support and want to use conda.

Set up your initial conda environment - we recommend using miniconda as it provides a minimal base environment.
```
$ wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
$ chmod a+x Miniconda3-py39_4.10.3-Linux-x86_64.sh && ./Miniconda3-py39_4.10.3-Linux-x86_64.sh
#Initialize your environment if you didn't run conda init
$ eval "$(<yourhome>/miniconda3/bin/conda shell.bash hook)" 

#Install the CPU version of UCX and also UCX-Py
(base) $ conda create -n ucx -c conda-forge -c rapidsai ucx-proc=*=cpu ucx ucx-py python=3.7
conda activate ucx
(<user_dir>/conda/%userprofile%.condaenvs/ucx) $ which ucx_info
<user_dir>/conda/%userprofile%.condaenvs/ucx/bin/ucx_info
```
In this case, the root of your UCX directory, UCX_ROOT would be this conda environment directory, so to run examples you would set the UCX path variable to this location: `export UCX_PATH=<user_dir>/conda/%userprofile%.condaenvs/ucx`

### Installing UCX via source

The main [UCX ReadTheDocs](https://openucx.readthedocs.io/en/master/running.html#ucx-build-and-install) has instructions on building from source that we repeat here for convenience.

```
$ wget https://github.com/openucx/ucx/releases/download/v1.11.0/ucx-1.11.0.tar.gz
$ tar xzf ucx-1.11.0.tar.gz
$ cd ucx-1.11.0

#Configure the project
$ mkdir build
$ cd build
$ ../configure --prefix=<ucx-install-path>

$ make -j4 && make install
```

To add CUDA support add the following flags to point to a valid CUDA installation ([from directions here](https://ucx-py.readthedocs.io/en/latest/install.html))
```
# Performance build
../contrib/configure-release --prefix=$CONDA_PREFIX --with-cuda=$CUDA_HOME --enable-mt CPPFLAGS="-I$CUDA_HOME/include"
# Debug build
../contrib/configure-devel --prefix=$CONDA_PREFIX --with-cuda=$CUDA_HOME --enable-mt CPPFLAGS="-I$CUDA_HOME/include"
```

### Installing UCX via Spack

```
<your_linux_box>:~/git clone https://github.com/spack/spack.git
#Optional - tell spack to put all of its files under /opt/spack - this is useful for global installation
spack clone /opt/spack
#Use spack to install and wait a while for it to build all the dependencies for you. Currently it should install UCX 1.10.1.
spack install ucx
#Alternatively, if you want to pick a specific version pass this as a parameter
spack install ucx@1.10.1
```

### Installing UCX with CUDA and Python support (Needed for CUDA Example)

Please check the instructions from the [UCX-Py ReadTheDocs](https://ucx-py.readthedocs.io/en/latest/install.html) and follow either the conda or source installation builds. Note that for source builds you need to specify the path of your working CUDA installation. 

With conda builds, you can use the ucx-proc metapackage to install GPU instead of CPU support:
```
#Install the GPU version of UCX and also UCX-Py
conda create -n ucx_gpu -c conda-forge -c rapidsai cudatoolkit=11.0 ucx-proc=*=gpu ucx ucx-py python=3.7
conda activate ucx_gpu
```
