# Example code derived from rapidsio/ucxpy test code

import numpy as np
import asyncio
import ucp


def make_echo_server(create_empty_data):
    """
    Returns an echo server that calls the function `create_empty_data(nbytes)`
    to create the data container.`
    """

    async def echo_server(ep):
        """
        Basic echo server for sized messages.
        We expect the other endpoint to follow the pattern::
        # size of the real message (in bytes)
        >>> await ep.send(msg_size)
        >>> await ep.send(msg)       # send the real message
        >>> await ep.recv(responds)  # receive the echo
        """
        msg_size = np.empty(1, dtype=np.uint64)
        await ep.recv(msg_size)
        msg = create_empty_data(msg_size[0])
        await ep.recv(msg)
        await ep.send(msg)
        await ep.close()

    return echo_server


async def send_recv(size=1024, dtype="f8"):
    msg = np.arange(size, dtype=dtype)
    msg_size = np.array([msg.nbytes], dtype=np.uint64)

    listener = ucp.create_listener(
        make_echo_server(lambda n: np.empty(n, dtype=np.uint8))
    )
    client = await ucp.create_endpoint(ucp.get_address(), listener.port)
    print("Sending array")
    await client.send(msg_size)
    await client.send(msg)
    resp = np.empty_like(msg)
    await client.recv(resp)
    print("Recieved array")
    np.testing.assert_array_equal(resp, msg)
    print("Messages are equal")

ucp.init()
asyncio.run(send_recv())
