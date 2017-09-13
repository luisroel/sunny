/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.controllers;

import erp.view.CustomerView;
import erp.view.ProviderView;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import javax.swing.JOptionPane;
import security.entities.Module;
import security.entities.User;
import security.entities.UserRight;
import security.models.ModuleModel;
import security.views.AboutView;
import security.views.AppSecurity;
import security.views.MenuView;
import security.views.ModuleView;
import security.views.RoleView;
import security.views.UserView;

/**
 *
 * @author lespinoza
 */
public class AppController implements ActionListener {
    
    private final ModuleModel model;
    private final AppSecurity view;
    private final User user;
    private final List<UserRight> rights;
    
    public AppController(AppSecurity view, ModuleModel model, User user, List<UserRight> rights){
        this.view = view;
        this.model = model;
        this.user = user;
        this.rights = rights;
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        if (model != null){
            List<Module> moduleList = model.getList(1);
            moduleList.stream().forEach((Module module) -> {
                Long moduleId = module.getId();
                String actionCommand = "Action_" + Long.toString(moduleId);
                if (ae.getActionCommand().equals(actionCommand)) {
                    executeModule(moduleId);
                }
            });
        }
    }
 
   private UserRight getModuleRights(Long moduleId){
        UserRight right = null;
        for (UserRight r: rights){
            if (r.getModule().getId() == moduleId){
                right = r;
                break;
            }
        }
        return right;
    }
    
    public void executeModule(Long moduleId){
        UserRight moduleRights = getModuleRights(moduleId);
        if (moduleId == 1){
            menuAction(moduleRights, user);
        } else if (moduleId == 2){
            moduleAction(moduleRights, user);
        } else if (moduleId == 3){
            roleAction(moduleRights, user);
        } else if (moduleId == 4){
            userAction(moduleRights, user);
        } else if (moduleId == 5){
            exitAction();
        } else if (moduleId == 6){
            aboutAction();
        } else if (moduleId == 7){
            customerAction(moduleRights, user);
        } else if (moduleId == 8){
            providerAction(moduleRights, user);
        } else {
            JOptionPane.showMessageDialog(view, "Module not identified", "Unkown", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    private void menuAction(UserRight rights, User user) {
        MenuView frm = new MenuView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
    
    private void moduleAction(UserRight rights, User user) {
        ModuleView frm = new ModuleView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
    
    private void roleAction(UserRight rights, User user) {
        RoleView frm = new RoleView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
    
    private void userAction(UserRight rights, User user) {
        UserView frm = new UserView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
    
    private void exitAction(){
        System.exit(0);
    }
    
    private void aboutAction() {
        AboutView frm = new AboutView();
        view.addFrame(frm);
        
        /**
         * Centers the about child windows
         */
        Dimension desktopSize = view.getSize();
        Dimension windowSize = frm.getSize();
        int width = (desktopSize.width - windowSize.width) / 2;
        int height = (desktopSize.height - windowSize.height) / 2;
        frm.setLocation(width, height);
        frm.setVisible(true);
    }

    private void customerAction(UserRight rights, User user) {
        CustomerView frm = new CustomerView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
    
    private void providerAction(UserRight rights, User user) {
        ProviderView frm = new ProviderView(user, rights);
        view.addFrame(frm);
        frm.setVisible(true);
    }
}
