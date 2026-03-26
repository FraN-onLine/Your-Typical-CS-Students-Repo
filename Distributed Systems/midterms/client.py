import socket

HOST = '127.0.0.1'
PORT = 5000

def start_client():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((HOST, PORT))

    message = input("Enter message: ")
    client.send(message.encode())

    response = client.recv(1024).decode()
    print(f"Server says: {response}")

    #client.close()


start_client()

