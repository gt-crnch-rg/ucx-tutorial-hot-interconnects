#You can install UCX using Anaconda
#UCX_PATH=$(HOME)/local/anaconda3/envs/shmem-py/

#Set path to the base directory of your UCX installation
UCX_PATH=${UCX_ROOT}

CC=gcc
.c.o:
	$(CC) -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -c $<


ucp_hello_world: ucp_hello_world.o
	$(CC) $< -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -o $@

clean:
	rm -f *.o ucp_hello_world *~ 
