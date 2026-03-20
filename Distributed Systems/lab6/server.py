import socket
import threading
import time

HOST = '127.0.0.1'
PORT = 5000
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("[SERVER STARTED] Waiting for connections...")

def handle_client(conn, addr):
    print(f"[NEW CONNECTION] {addr} connected.")

    start_time = time.time()

    client_message = conn.recv(1024).decode()
    print(f"[RECEIVED] {addr}: {client_message}")

    time.sleep(2)

    response = f"Server received: {client_message}"
    conn.send(response.encode())

    end_time = time.time()
    print(f"[RESPONSE TIME] {addr}: {end_time - start_time:.2f}s")

    conn.close()
    print(f"[DISCONNECTED] {addr} disconnected.")

while True:
    conn, addr = server.accept()
    thread = threading.Thread(target=handle_client, args=(conn, addr))
    thread.start()

    print(f"[ACTIVE THREADS] {threading.active_count() - 1}")