#Set path to the base directory of your UCX installation using setenv.sh

CC=gcc

.c.o:
	$(CC) -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -c $<

all: ucp_hello_world uct_hello_world

#Compile the high-level UCP example
ucp_hello_world: ucp_hello_world.o
	$(CC) $< -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -o $@

#Compile the low-level UCT example
uct_hello_world: uct_hello_world.o
	$(CC) $< -L$(UCX_PATH)/lib -I$(UCX_PATH)/include -lucp -lucs -luct -o $@

clean:
	rm -f *.o ucp_hello_world uct_hello_world *~ 
