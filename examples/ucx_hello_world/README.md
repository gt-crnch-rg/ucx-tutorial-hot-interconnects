# UCX Hello World

## Install dependencies

### Installing UCX via anaconda

### Installing UCX via source

### Installing UCX via Spack

```
<your_linux_box>:~/git clone https://github.com/spack/spack.git
#Optional - tell spack to put all of its files under /opt/spack - this is useful for global installation
spack clone /opt/spack
#Use spack to install and wait a while for it to build all the dependencies for you. It should install UCX 10.1.
spack install ucx
```

## Compile this example
```
source setenv.sh
make
```

## Run the example
`./ucp_hello_world`
`./ucp_hello_world [server_name]`

### UCP Server Sample Output
```
ucx-tutorial-hoti-21/examples/ucx_hello_world$ ./ucp_hello_world 
...
UCX_LISTENER_BACKLOG=auto
UCX_PROTO_ENABLE=n
UCX_KEEPALIVE_INTERVAL=0.00us
UCX_KEEPALIVE_NUM_EPS=0
UCX_PROTO_INDIRECT_ID=auto
[1628286068.019413] [localmachine:25780:0]         parser.c:1689 UCX  WARN  unused env variable: UCX_ROOT (set UCX_WARN_UNUSED_ENV_VARS=n to suppress this warning)
[0xd3b91b80] local address length: 175
Waiting for connection...
[0xd3b91b80] receive handler called with status 0 (Success), length 183
UCX address message was received
flush_ep completed with status 0 (Success)
```

### UCP Client Sample Output
```
ucx-tutorial-hoti-21/examples/ucx_hello_world$ ./ucp_hello_world localhost

...
UCX_FLUSH_WORKER_EPS=y
UCX_UNIFIED_MODE=n
UCX_SOCKADDR_CM_ENABLE=y
UCX_CM_USE_ALL_DEVICES=y
UCX_LISTENER_BACKLOG=auto
UCX_PROTO_ENABLE=n
UCX_KEEPALIVE_INTERVAL=0.00us
UCX_KEEPALIVE_NUM_EPS=0
UCX_PROTO_INDIRECT_ID=auto
[1628286097.787074] [localmachine:25841:0]         parser.c:1689 UCX  WARN  unused env variable: UCX_ROOT (set UCX_WARN_UNUSED_ENV_VARS=n to suppress this warning)
[0xd0d01740] local address length: 175
[0xd0d01740] receive handler called with status 0 (Success), length 24
UCX data message was received


----- UCP TEST SUCCESS ----

ABCDEFGHIJKLMNO

---------------------------
```
