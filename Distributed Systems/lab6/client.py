import socket
import threading
import time

def connect_to_server(i):
    HOST = '127.0.0.1'
    PORT = 5000

    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    start = time.time()
    client.connect((HOST, PORT))

    message = f"Hello from client {i}"
    client.send(message.encode())

    response = client.recv(1024).decode()
    end = time.time()

    print(f"[CLIENT {i}] {response}")
    print(f"[CLIENT {i}] Response time: {end - start:.2f}s")

    client.close()

for i in range(5):
    threading.Thread(target=connect_to_server, args=(i,)).start()