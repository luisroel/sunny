/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.controllers;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import security.entities.User;
import security.entities.UserRight;
import security.models.UserModel;
import security.views.LoginView;
import utils.Util;

/**
 *
 * @author lespinoza
 */
public class LoginController implements ActionListener {
    
    public final static String ELEMENT_USERNAME_PROPERTY = "Username";
    public final static String ELEMENT_PASSWORD_PROPERTY = "Password";
    
    private final LoginView view;
    private final UserModel model;
    private User user;
    private List<UserRight> rights;
    
    public LoginController(LoginView view, UserModel model){
        this.view = view;
        this.model = model;
    }
            
    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
            case "Login":
                loginAction(ae);
                break;
            case "Cancel":
                cancelAction();
                break;
        }
    }
    
    public void loginAction(ActionEvent ae){
        String passwordMD5 = Util.getPasswordMD5(view.getPassword());
        user = this.model.authenticate(view.getUsername(), passwordMD5);
        if (user != null) {
            rights = this.model.getRights(user.getUserId());
            view.getParent().setVisible(true);
            view.setVisible(false);
        } else {
            view.showError("Invalid username or password !");
        }
    }
            
    public void cancelAction(){
        view.setVisible(false);
        System.exit(0);
    }
    
    public User getAuthenticatedUser(){
        return user;
    }
    
    public List<UserRight> getUserRights(){
        return rights;
    }
}
