import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Client {
    private static final String SERVER_ADDRESS = "localhost";
    private static final int SERVER_PORT = 8080;

    public static void main(String[] args) {
        try (Socket socket = tryGetSocket(SERVER_ADDRESS, SERVER_PORT)) {
            System.out.println("Connected to the chat server!");

            // Setting up input and output streams
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            // Start a thread to handle incoming messages
            new Thread(() -> {
                try {
                    String serverResponse;
                    while ((serverResponse = in.readLine()) != null) {
                        System.out.println(serverResponse);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }).start();

            // Read messages from the console and send to the server
            Scanner scanner = new Scanner(System.in);
            String userInput;
            while (true) {
                userInput = scanner.nextLine();
                out.println(userInput);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static Socket tryGetSocket(String serverAddress, int serverPort) throws InterruptedException {
        while (true) {
            try {
                return new Socket(serverAddress, serverPort);
            } catch (IOException e) {
                System.out.println("Ошибка во время попытки создать сокет: %s".formatted(e.getMessage()));
            }
            Thread.sleep(5 * 1000);
        }
    }
}