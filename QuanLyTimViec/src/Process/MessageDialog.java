package Process;

import java.awt.Component;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class MessageDialog {

    public static void showMessageDialog(Component parent, String conntent, String title) {
        JOptionPane.showMessageDialog(parent, conntent, title, JOptionPane.INFORMATION_MESSAGE);
    }

    public static void showErrorDialog(Component parent, String conntent, String title) {
        JOptionPane.showMessageDialog(parent, conntent, title, JOptionPane.ERROR_MESSAGE);
    }

    public static int showConfirmDialog(Component parent, String conntent, String title) {
        int choose = JOptionPane.showConfirmDialog(parent, conntent, title,
                JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
        return choose;
    }
}
