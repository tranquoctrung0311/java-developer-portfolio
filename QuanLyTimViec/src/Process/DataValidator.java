package Process;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author acer
 */
public class DataValidator {

    public static void validateEmpty(JTextField field, StringBuilder sb, String errorMessage) {
        if (field.getText().equals("")) {
            sb.append(errorMessage).append("\n");
            field.requestFocus();
        }
    }

    public static void validateEmpty(JPasswordField field, StringBuilder sb, String errorMessage) {
        String password = new String(field.getPassword());
        if (password.equals("")) {
            sb.append(errorMessage).append("\n");
            field.requestFocus();
        }
    }

    public static void validateEmpty(JTextArea field, StringBuilder sb, String errorMessage) {
        if (field.getText().equals("")) {
            sb.append(errorMessage).append("\n");
            field.requestFocus();
        }
    }
    
    public static void validateGmail(JTextField field, StringBuilder sb, String errorMessage) {
        String regex = "^[a-zA-Z]+[a-zA-Z0-9]*@{1}+gmail.com$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(field.getText());
        
        if (!matcher.find()) {
            sb.append(errorMessage).append("\n");
            field.requestFocus();
        }
    }
}
