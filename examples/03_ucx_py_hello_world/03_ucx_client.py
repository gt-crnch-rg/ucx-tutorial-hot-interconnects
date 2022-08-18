# example derived from test code in rapidsai/ucx-py

import os
from ucp._libs import ucx_api
from ucp._libs.arr import Array
import numpy as np

# Handler to pass to tag send. This handler is only run if the function was not complete in place
def blocking_handler(request, exception, finished):
    finished[0] = True

ctx = ucx_api.UCXContext(feature_flags=(ucx_api.Feature.RMA, ucx_api.Feature.TAG))
worker = ucx_api.UCXWorker(ctx)

self_address = worker.get_address()
ep = ucx_api.UCXEndpoint.create_from_worker_address(worker, self_address, endpoint_error_handling=False)

msg_size=1024
send = bytes(os.urandom(msg_size))

# Array class handles details of converting Python based buffers to C types for UCX. This can handle
# cuda objects as well as host memory
send_msg = Array(send)

recv = bytearray(msg_size)
finished_send = [False]
send_req = ucx_api.tag_send_nb(ep,send_msg,send_msg.nbytes,0,cb_func=blocking_handler,cb_args=(finished_send,),)

recv_msg = Array(recv)
finished_recv = [False]
recv_req = req = ucx_api.tag_recv_nb(worker,recv_msg,recv_msg.nbytes,0,cb_func=blocking_handler,cb_args=(finished_recv,),)

# if the req object is None than the request finished inline and nothing else is required. If there is a req object than the
# worker needs to be progressed until the callback was invoked. We do this for both the send and recv object.
print("Ensuring send finished")
if send_req is not None:
    while not finished_send[0]:
        worker.progress()

print("Ensuring recv finished")
if recv_req is not None:
    while not finished_recv[0]:
        worker.progress()

assert recv == send
print("Success")
