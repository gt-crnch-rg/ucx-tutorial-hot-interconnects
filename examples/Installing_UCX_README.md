### Install dependencies

### Installing UCX via anaconda

** NOTE ** The UCX conda package does not support IB/RDMA (OFED) builds by default. See [this guide](https://ucx-py.readthedocs.io/en/latest/install.html#ucx-ofed) if you need to build OFED support and want to use conda.

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


### Installing UCX via Spack

```
<your_linux_box>:~/git clone https://github.com/spack/spack.git
#Optional - tell spack to put all of its files under /opt/spack - this is useful for global installation
spack clone /opt/spack
#Use spack to install and wait a while for it to build all the dependencies for you. Currently it should install UCX 1.10.1.
spack install ucx
```

### Installing UCX with CUDA and Python support (Needed for CUDA Example)

Please check the instructions from the [UCX-Py ReadTheDocs](https://ucx-py.readthedocs.io/en/latest/install.html) and follow either the conda or source installation builds. Note that for source builds you need to specify the path of your working CUDA installation. 
