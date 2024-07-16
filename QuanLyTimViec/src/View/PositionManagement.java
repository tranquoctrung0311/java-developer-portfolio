package View;

import Process.MessageDialog;
import Process.Position;
import Process.SecondPair;
import Process.SecondPairDao;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class PositionManagement extends javax.swing.JFrame {

    /**
     * Creates new form PositionManagement
     */
    private DefaultTableModel model;
    private int mavt, mapban;

    public PositionManagement(int maPhong) {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        mapban = maPhong;
        model = (DefaultTableModel) tblPOSITION.getModel();
        LoadData(mapban);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPOSITION = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        txtPOSITIONNAME = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtNUMBEROFPERSONNEL = new javax.swing.JTextField();
        btnAdd = new javax.swing.JButton();
        btnAlt = new javax.swing.JButton();
        btnDlt = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Dubai", 1, 30)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Positions List");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 10, -1, -1));

        tblPOSITION.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblPOSITION.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Name", "Numbers Of Vacancies"
            }
        ));
        tblPOSITION.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblPOSITIONMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblPOSITION);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 70, 650, 251));

        jLabel2.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Name");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 350, -1, -1));

        txtPOSITIONNAME.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        getContentPane().add(txtPOSITIONNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 350, 200, -1));

        jLabel3.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Numbers Of Vacancies");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 350, -1, -1));

        txtNUMBEROFPERSONNEL.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        getContentPane().add(txtNUMBEROFPERSONNEL, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 350, 170, -1));

        btnAdd.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnAdd.setText("Add Position");
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });
        getContentPane().add(btnAdd, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 410, -1, -1));

        btnAlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnAlt.setText("Change Position");
        btnAlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAltActionPerformed(evt);
            }
        });
        getContentPane().add(btnAlt, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 410, -1, -1));

        btnDlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnDlt.setText("Delete Position");
        btnDlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltActionPerformed(evt);
            }
        });
        getContentPane().add(btnDlt, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 410, -1, -1));

        jButton4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton4.setText("Back");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 410, -1, -1));

        jButton1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton1.setText("Refresh");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 410, -1, -1));

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/profilebg2.png"))); // NOI18N
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 730, 480));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        DepartmentManagement dm = new DepartmentManagement();
        dm.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton4ActionPerformed

    private void tblPOSITIONMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblPOSITIONMouseClicked
        // TODO add your handling code here:
        int row = tblPOSITION.getSelectedRow();

        if (row >= 0) {
            int id = (int) tblPOSITION.getValueAt(row, 0);
            mavt = id;

            SecondPairDao dao = new SecondPairDao();
            SecondPair sp = new SecondPair();

            try {
                sp = dao.findByID(mapban, mavt);
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
            }

            if (sp != null) {
                txtPOSITIONNAME.setText(sp.getPos().getPOSITIONNAME());
                txtNUMBEROFPERSONNEL.setText(String.valueOf(sp.getNUMBEROFPERSONNEL()));
            }
        }
    }//GEN-LAST:event_tblPOSITIONMouseClicked

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        // TODO add your handling code here:
        if (txtPOSITIONNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Position name cannot be blank!", "Error");
            return;
        } else if (txtNUMBEROFPERSONNEL.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies cannot be blank!", "Error");
            return;
        } else if (!txtNUMBEROFPERSONNEL.getText().matches("\\d+")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies are numberous only!", "Error");
            return;
        }

        try {
            SecondPair sp = new SecondPair();
            Position p = new Position();

            p.setPOSITIONNAME(txtPOSITIONNAME.getText());

            sp.setPos(p);
            sp.setNUMBEROFPERSONNEL(Integer.parseInt(txtNUMBEROFPERSONNEL.getText()));

            SecondPairDao dao = new SecondPairDao();
            if (dao.insert(sp, mapban)) {
                MessageDialog.showMessageDialog(this, "Added successfully!", "Notification");
                LoadData(mapban);
            } else {
                MessageDialog.showConfirmDialog(this, "Add unsuccessfully!", "Notification");
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnAltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAltActionPerformed
        // TODO add your handling code here:
        if (txtPOSITIONNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Position name cannot be blank!", "Error");
            return;
        } else if (txtNUMBEROFPERSONNEL.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies cannot be blank!", "Error");
            return;
        } else if (!txtNUMBEROFPERSONNEL.getText().matches("\\d+")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies are numberous only!", "Error");
            return;
        }

        try {
            SecondPair sp = new SecondPair();
            Position p = new Position();

            p.setPOSITIONNAME(txtPOSITIONNAME.getText());

            sp.setPos(p);
            sp.setNUMBEROFPERSONNEL(Integer.parseInt(txtNUMBEROFPERSONNEL.getText()));

            SecondPairDao dao = new SecondPairDao();
            int choose = MessageDialog.showConfirmDialog(this, "Do you sure want to change position?", "Confirm");
            if (choose == JOptionPane.YES_OPTION) {
                if (dao.update(sp, mapban)) {
                    MessageDialog.showMessageDialog(this, "Changed successfully!", "Notification");
                    LoadData(mapban);
                } else {
                    MessageDialog.showConfirmDialog(this, "Change unsuccessfully!", "Notification");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }//GEN-LAST:event_btnAltActionPerformed

    private void btnDltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltActionPerformed
        // TODO add your handling code here:
        if (txtPOSITIONNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Position name cannot be blank!", "Error");
            return;
        } else if (txtNUMBEROFPERSONNEL.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies cannot be blank!", "Error");
            return;
        } else if (!txtNUMBEROFPERSONNEL.getText().matches("\\d+")) {
            MessageDialog.showErrorDialog(this, "Numbers of vacancies are numberous only!", "Error");
            return;
        }

        try {
            SecondPair sp = new SecondPair();
            Position p = new Position();

            p.setPOSITIONNAME(txtPOSITIONNAME.getText());

            sp.setPos(p);
            sp.setNUMBEROFPERSONNEL(Integer.parseInt(txtNUMBEROFPERSONNEL.getText()));

            SecondPairDao dao = new SecondPairDao();
            int choose = MessageDialog.showConfirmDialog(this, "Do you sure want to delete position?", "Confirm");
            if (choose == JOptionPane.YES_OPTION) {
                if (dao.delete(sp, mapban)) {
                    MessageDialog.showMessageDialog(this, "Deleted successfully!", "Notification");
                    LoadData(mapban);
                } else {
                    MessageDialog.showConfirmDialog(this, "Delete unsuccessfully!", "Notification");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }//GEN-LAST:event_btnDltActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        txtPOSITIONNAME.setText("");
        txtNUMBEROFPERSONNEL.setText("");
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnAlt;
    private javax.swing.JButton btnDlt;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblPOSITION;
    private javax.swing.JTextField txtNUMBEROFPERSONNEL;
    private javax.swing.JTextField txtPOSITIONNAME;
    // End of variables declaration//GEN-END:variables

    private void LoadData(int maPhong) {
        try {
            SecondPairDao dao = new SecondPairDao();
            List<SecondPair> list = dao.findSecondPair(maPhong);
            model.setRowCount(0);
            for (SecondPair x : list) {
                model.addRow(new Object[]{
                    x.getPos().getPOSITIONNO(), x.getPos().getPOSITIONNAME(), x.getNUMBEROFPERSONNEL()});
            }
            model.fireTableDataChanged();
            tblPOSITION.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }
}
