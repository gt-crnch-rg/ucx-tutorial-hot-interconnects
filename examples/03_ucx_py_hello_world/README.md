# UCX-Py Hello World

This example will demonstrate how to use UCX Python bindings. For more information please see the [UCX-Py ReadTheDocs site](https://ucx-py.readthedocs.io/en/latest/index.html) and [related repos](https://github.com/rapidsai/ucx-py). These examples were derived from the [RAPIDSAI test suite](https://github.com/rapidsai).

We recommend that you try this example using the UCX Conda environment detailed in the Installation Guide.

## RAPIDS UCX-Py Example

This example demonstrates a single file example of a client and server using NVIDIA's RAPIDS syntax and asynchronous IO. Note the dependency in the codebase on the use of the `asyncio` package.

### RAPIDS Sample Output
```
#This example assumes you have installed UCX with miniconda
$ cd ucx-tutorial-hot-interconnects/examples/03_ucx_py_hello_world
$ conda activate ucx_gpu
(ucx_gpu) $ python3 ./03_rapidsai_binding.py 
Sending array
Recieved array
Messages are equal
```

## UCX-Py Standard Binding Example
This example demonstrates the usage of a more "standardized" UCX-Py implementation that will likely be upstreamed in a future UCX release. It has similar syntax to the earlier C based client-server examples but simplifies some of the setup for end users. 

### UCX Binding Sample Output
```
#This example assumes you have installed UCX with miniconda
$ cd ucx-tutorial-hot-interconnects/examples/03_ucx_py_hello_world
$ conda activate ucx_gpu
(ucx_gpu) $ python3 ./03_ucx_binding.py
Ensuring send finished
Ensuring recv finished
Success
```
