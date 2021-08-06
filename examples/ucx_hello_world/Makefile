UCX_PATH=$(HOME)/local/anaconda3/envs/shmem-py/
CC=gcc
.c.o:
	$(CC) -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -c $<


ucp_hello_world: ucp_hello_world.o
	$(CC) $< -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -o $@

clean:
	rm *.o ucp_hello_world *~
