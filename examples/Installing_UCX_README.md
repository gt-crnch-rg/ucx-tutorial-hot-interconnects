## Install dependencies

### Installing UCX via anaconda

### Installing UCX via source

The main [UCX ReadTheDocs](https://openucx.readthedocs.io/en/master/running.html#ucx-build-and-install) has instructions on building from source that we repeat here for convenience.

```
https://openucx.readthedocs.io/en/master/running.html#ucx-build-and-install
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

Please check the instructions from the [UCX-Py ReadTheDocs](https://ucx-py.readthedocs.io/en/latest/install.html) and follow either the conda or source installation builds.
