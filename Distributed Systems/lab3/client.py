import socket
import threading

HOST = '127.0.0.1'
PORT = 12345

def receive_messages(sock):
    while True:
        message = sock.recv(1024).decode()
        if not message:
            print("\n[Server disconnected]")
            break
        print(f"\nServer: {message}")
        print("Client > ", end="", flush=True)

def send_messages(sock):
    while True:
        message = input("Client > ")
        if message.lower() == 'exit':
            sock.sendall("Client has left the chat.".encode())
            break
        sock.sendall(message.encode())

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))

print("Connected to server. Type 'exit' to quit.")

threading.Thread(target=receive_messages, args=(client_socket,), daemon=True).start()
threading.Thread(target=send_messages, args=(client_socket,), daemon=True).start()

while True:
    pass
