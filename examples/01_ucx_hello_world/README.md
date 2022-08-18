# UCX Hello World

This example demonstrates a basic UCX "Hello World" with a client and server instance. 

As a first step make sure you have installed any dependencies and also that you have built and installed UCX. See [this page](https://github.com/gt-crnch-rg/ucx-tutorial-hoti-21/blob/main/examples/Installing_UCX_README.md) for more details on installation. 

## Compile this example
```
#Edit setenv_ucx.sh to point to your UCX installation: `export UCX_PATH=<path_to_UCX_INSTALL>`
source ../setenv_ucx.sh
make
```

## Run the example
```
# Start the server
./ucp_hello_world
# In a separate terminal window start the client 
./ucp_hello_world [server_name]
```

### UCP Server Sample Output
```
ucx-tutorial-hoti-21/examples/01_ucx_hello_world$ ./ucp_hello_world 
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
# Remember to point to the UCX libraries for the client terminal as well!
$ source ../setenv_ucx.sh
ucx-tutorial-hoti-21/examples/01_ucx_hello_world$ ./ucp_hello_world localhost

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


## UCT Example

Note that we don't cover the UCT Hello World example in detail in the tutorial, but we have included an example for interested users. Most users would not need to interact with UCT unless they are developing low-level support that interacts with specific networking hardware.

### UCT Server Sample Output
```
./uct_hello_world -d eth0 -t tcp
INFO: UCT_HELLO_WORLD AM function = uct_ep_am_short server = (null) port = 13337
Using tcp/eth0
Waiting for connection...
# Connect using the client in a separate terminal
...
----- UCT TEST SUCCESS ----

[callback] uct_ep_am_short sent ABCDEFGHIJKLMNO

---------------------------

----- UCT TEST SUCCESS ----

[main] uct_ep_am_short sent ABCDEFGHIJKLMNO

---------------------------
```

### UCT Client Sample Output
```
./uct_hello_world -d eth0 -t tcp -n localhost
INFO: UCT_HELLO_WORLD AM function = uct_ep_am_short server = localhost port = 13337
Using tcp/eth0
```
