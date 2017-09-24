/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.views;

import security.controllers.LoginController;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import security.entities.User;
import security.entities.UserRight;
import security.models.UserModel;

/**
 *
 * @author lespinoza
 */
public final class LoginView extends JDialog {

    private final LoginController controller;
    
    private final JLabel lblUsername;
    private final JLabel lblPassword;
    private final JLabel lblStatus;

    private final JTextField txtUsername;
    private final JPasswordField txtPassword;

    private final JButton btnOk;
    private final JButton btnCancel;
    
    /**
     * Creates new form LoginView
     * @param parent
     * @param modal
     */
    public LoginView(final JFrame parent, boolean modal) {
        super(parent, modal);
        UserModel model = new UserModel();
        this.controller = new LoginController(this, model);
        
        this.lblUsername = new JLabel("Username");
        this.lblPassword = new JLabel("Password");
        this.lblStatus = new JLabel(" ");
        this.txtUsername = new JTextField(35);
        this.txtPassword = new JPasswordField();
        this.btnOk = new JButton("Login");
        this.btnCancel = new JButton("Cancel");
        
        initComponents();
        
        addWindowListener(new WindowAdapter() {  
            @Override
            public void windowClosing(WindowEvent e) {  
                System.exit(0);  
            }  
        });
    }
    
    public void initComponents() {
        this.setTitle("Login");
        this.lblStatus.setForeground(Color.RED);
        this.btnOk.setActionCommand("Login");
        this.btnOk.addActionListener(controller);
        this.btnCancel.setActionCommand("Cancel");
        this.btnCancel.addActionListener(controller);

        JPanel topPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        
        gbc.insets = new Insets(4, 4, 4, 4);
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weightx = 0;
        topPanel.add(lblUsername, gbc);
        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1;
        topPanel.add(txtUsername, gbc);
        
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.fill = GridBagConstraints.NONE;
        gbc.weightx = 0;
        topPanel.add(lblPassword, gbc);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 1;
        gbc.weightx = 1;
        topPanel.add(txtPassword, gbc);
        
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 0;
        topPanel.add(lblStatus, gbc);
        
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));        
        buttonPanel.add(btnOk);
        buttonPanel.add(btnCancel);

        this.add(topPanel);
        this.add(buttonPanel, BorderLayout.SOUTH);
        this.getRootPane().setDefaultButton(btnOk);
        
        pack();
        setSize(400, 200);
        setResizable(false);
        setLocationRelativeTo(null);
    }
    
    public String getUsername(){
        return txtUsername.getText();
    }
    
    public char[] getPassword(){
        return txtPassword.getPassword();
    }
    
    public void showError(String message){
        lblStatus.setText(message);
    }
    
    public User getAuthenticatedUser(){
        return controller.getAuthenticatedUser();
    }
    
    public List<UserRight> getUserRights(){
        return controller.getUserRights();
    }
}
