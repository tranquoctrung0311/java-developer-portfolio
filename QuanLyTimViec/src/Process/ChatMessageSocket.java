package Process;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import javax.swing.JTextPane;

/**
 *
 * @author acer
 */
public class ChatMessageSocket {

    private Socket socket;
    private JTextPane txpMessageBoard;
    private PrintWriter out;
    private BufferedReader reader;

    public ChatMessageSocket() {
    }

    public ChatMessageSocket(Socket socket, JTextPane txpMessageBoard) throws IOException {
        this.socket = socket;
        this.txpMessageBoard = txpMessageBoard;

        out = new PrintWriter(socket.getOutputStream());
        reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

        receive();
    }

    private void receive() {
        Thread th = new Thread() {
            @Override
            public void run() {
                while (true) {
                    try {
                        String line = reader.readLine();
                        if (line != null) {
                            txpMessageBoard.setText(txpMessageBoard.getText() + "\n" + line);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        };
        th.start();
    }

    public void send(String msg) {
        String current = txpMessageBoard.getText();
        txpMessageBoard.setText(current + "\nYou sent: " + msg);
        out.println(msg);
        out.flush();
    }

    public void close() {
        try {
            out.close();
            reader.close();
            socket.close();
        } catch (Exception e) {
        }
    }
}
