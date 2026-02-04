import socket
import threading

HOST = '127.0.0.1'
PORT = 12345

def receive_messages(conn):
    while True:
        message = conn.recv(1024).decode()
        if not message:
            print("\n[Client disconnected]")
            break
        print(f"\nClient: {message}")
        print("Server > ", end="", flush=True)

def send_messages(conn):
    while True:
        message = input("Server > ")
        if message.lower() == 'exit':
            conn.sendall("Server has left the chat.".encode())
            break
        conn.sendall(message.encode())

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((HOST, PORT))
server_socket.listen(1)

print("Server is waiting for connection...")
conn, addr = server_socket.accept()
print(f"Connected to client: {addr}")

threading.Thread(target=receive_messages, args=(conn,), daemon=True).start()
threading.Thread(target=send_messages, args=(conn,), daemon=True).start()

while True:
    pass

