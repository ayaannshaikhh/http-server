# HTTP Server Project

This project is an implementation of a basic HTTP server written in C. It demonstrates how to use sockets to handle HTTP requests and send HTTP responses, forming the backbone of web server functionality.

## Features
- Handles basic HTTP requests (e.g., GET requests).
- Sends static responses with HTTP headers and HTML content.
- Uses modular code structure with `Server.c` and `Server.h`.

## How It Works
### Server Structure
The server is implemented using a `struct Server` defined in `Server.h`. This structure encapsulates the key components of the server:
- **Domain, Service, and Protocol**: These define the socket type (e.g., `AF_INET` for IPv4, `SOCK_STREAM` for TCP).
- **Interface and Port**: Specify the network interface (`INADDR_ANY` for all available interfaces) and the port to listen on.
- **Backlog**: Defines the maximum number of pending connections.
- **Address**: A `struct sockaddr_in` that stores the server's address configuration.
- **Socket**: The file descriptor for the server's socket.
- **Launch Function Pointer**: A function pointer to handle the server's main execution logic.

### Server Initialization
The `server_constructor` function in `Server.c` initializes the server structure and sets up the socket. Key steps include:
1. **Socket Creation**: The `socket` system call creates a new socket. If this fails, the program exits with an error message.
2. **Address Binding**: The `bind` system call associates the socket with the specified address and port. Errors here are also fatal.
3. **Listening**: The `listen` system call starts the server, allowing it to accept incoming connections.

### Handling Client Connections
The `launch` function implements the main server loop. Key operations include:
1. **Waiting for Connections**: The `accept` system call blocks until a client connects. It returns a new socket descriptor for the client.
2. **Reading Client Requests**: The `read` system call reads the HTTP request from the client.
3. **Sending Responses**: The `write` system call sends a predefined HTTP response with a "Hello, World!" HTML body.
4. **Closing Connections**: After handling the request, the server closes the client socket.

### Main Function
The `main.c` file sets up the server and starts it:
- A `Server` instance is created using the `server_constructor`.
- The `launch` function is invoked to start handling client requests.

### Using the `libeom` Library
This project integrates the `libeom` library to handle data structures and networking functionalities. The library provides:
- **Networking Utilities**: Simplifies server socket creation and management.
- **Data Structures**: Includes implementations like queues and linked lists that can be extended for request handling or future features.

## Getting Started
### Prerequisites
To compile and run the project, you need:

- GCC or Clang compiler

- Basic knowledge of C programming

- A terminal or command-line interface

### Setup
1. Clone the repository:
```git clone https://github.com/ayaannshaikhh/http-server.git && cd http-server```
2. Clone the `libeom` library:
```git clone https://github.com/ericomeehan/libeom.git```
3. Run `make` and the executable:
```./http_server```
4. Search for `127.0.0.1` on your browser

## Acknowledgments

This project is based on guidance from the video tutorial:

- [Build an HTTP Server in C - YouTube](https://www.youtube.com/watch?v=gk6NL1pZi1M) by Eric Meehan.

Special thanks to [Eric Meehan](https://github.com/ericomeehan) for the `libeom` library, which powers the networking and data structure functionalities.

## License

This project is open-source and can be freely modified or distributed.