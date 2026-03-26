import socket
import threading
import time

HOST = '127.0.0.1'
PORT = 5000

def handle_client(conn, addr):
    print(f"[NEW CONNECTION] {addr}")

    try:
        message = conn.recv(1024).decode()
        if message:
            print(f"Client message: {message}")

            #for bonus
            processed_message = message.upper()

            response = f"Server received: {processed_message}"
            conn.send(response.encode())

    except Exception as e:
        print(f"[ERROR] {e}")

    finally:
        conn.close()
        print(f"[DISCONNECTED] {addr}")


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("[SERVER STARTED] Waiting for connections...")

while True:
    conn, addr = server.accept()

    thread = threading.Thread(target=handle_client, args=(conn, addr))
    thread.start()

    print(f"[ACTIVE THREADS] {threading.active_count() - 1}")
