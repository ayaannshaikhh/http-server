all:
	gcc main.c Server.c libeom/DataStructures/Lists/LinkedList.c libeom/DataStructures/Lists/Queue.c libeom/DataStructures/Common/Node.c -o http_server