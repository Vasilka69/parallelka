# Лабараторная работа №6

В ходе работы была рассмотрено клиент-серверное приложение примитивного чата через socket.

### Результат работы сервера
```
$ java Server.java
Try to run server on 8080 port
Server is running and waiting for connections...
New client connected: Socket[addr=/127.0.0.1,port=36642,localport=8080]
User User 1 connected.
New client connected: Socket[addr=/127.0.0.1,port=56068,localport=8080]
User User 2 connected.
Hello from server!
[Server]: Hello from server!
[User 1]: Hello from user 1
[User 2]: Hello from user 2
```

### Результат работы клиента User 1
```
$ java Client.java
Connected to the chat server!
Enter your username:
User 1
Welcome to the chat, User 1!
Type Your Message
[Server]: Hello from server!
Hello from user 1
[User 1]: Hello from user 1
[User 2]: Hello from user 2
```

### Результат работы клиента User 1
```
$ java Client.java
Connected to the chat server!
Enter your username:
User 2
Welcome to the chat, User 2!
Type Your Message
[Server]: Hello from server!
[User 1]: Hello from user 1
Hello from user 2
[User 2]: Hello from user 2
```

Как можно заметить, приложение работает корректно, передавая сообщения всем участникам чата.
