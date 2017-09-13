/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.controllers;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import javax.swing.DefaultListSelectionModel;
import javax.swing.JComboBox;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.Item;
import security.entities.Module;
import security.entities.Status;
import security.entities.TrackChange;
import security.entities.User;
import security.entities.UserModule;
import security.models.ItemListModel;
import security.models.StatusComboBoxModel;
import security.models.UserListModel;
import security.models.UserModel;
import security.views.UserView;

/**
 *
 * @author lespinoza
 */
public class UserController implements ItemListener, ActionListener, ListSelectionListener{
    
    private final UserView view;
    private final UserModel model;
    private final User user;
    private int viewState;
    private boolean save;
    
    public UserController(UserModel model, UserView view, User user){
        this.view = view;
        this.model = model;
        this.user = user;
        viewState = 0;
        save = false;
    }
    
    @Override
    public void itemStateChanged(ItemEvent e) {
        // status has been changed
        if (e.getStateChange() == ItemEvent.SELECTED){
            loadUsers();
        }
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if (null != e.getActionCommand()){
            switch (e.getActionCommand()) {
                case "New":
                    newRecord();
                    break;
                case "Edit":
                    editRecord();
                    break;
                case "Delete":
                    deleteRecord();
                    break;
                case "Add":
                    addRole();
                    break;
                case "Remove":
                    removeRole();
                    break;
                case "Save":
                    saveRole();
                    break;
                case "NewD":
                    newRecordD();
                    break;
                case "EditD":
                    editRecordD();
                    break;
                case "DeleteD":
                    deleteRecordD();
                    break;
                default:
                    JOptionPane.showMessageDialog(view, "Action not identified (" 
                            + e.getActionCommand()
                            + ")", "Unkown", JOptionPane.ERROR_MESSAGE);
                    break;
            }
        }
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {
        if (!e.getValueIsAdjusting()){
            if (e.getSource() instanceof JList) {
                view.loadDetail();
            }
            
            if (e.getSource() instanceof DefaultListSelectionModel){
                view.loadRoleDetail();
            }
        }
    }
    
    public void loadStatus(){
        StatusComboBoxModel statusModel = new StatusComboBoxModel();
        JComboBox cmbStatus = view.getCmbStatus();
        cmbStatus.setModel(statusModel);
        cmbStatus.setSelectedIndex(1);       
    }

    private void loadUsers(){
        JComboBox cmbStatus = view.getCmbStatus();
        if (cmbStatus.getModel().getSize() > 0) {
            Status status = (Status)cmbStatus.getSelectedItem();
            JList lstUsers = view.getUserList();
            lstUsers.setModel(new UserListModel(model.getList(status.getId())));
            if (lstUsers.getModel().getSize() > 0){
                lstUsers.setSelectedIndex(0);
            } else {
                view.clearFields();             // clear data fields
            }
        } else {
            view.clearFields();            // clear data fields
        }    
    }

    private void newRecord() {
        if (viewState == 0){
            view.setNewScenario();
        }else{
            String msg = validateData();
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Data Entry Error", JOptionPane.ERROR_MESSAGE);
            }else if (viewState == 1){                  // insert action
                msg = insertRecord();
                if (msg.isEmpty()){
                    view.setNormalScenario();
                    loadUsers();
                    JOptionPane.showMessageDialog(view, "Record created succesfully!", "New", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(view, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }else{                                // update action
                msg = updateRecord();
                if (msg.isEmpty()){
                    view.setNormalScenario();
                    view.updateRow();
                    JOptionPane.showMessageDialog(view, "Record updated succesfully!", "Edit", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(view, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
    }
    
    private void editRecord() {
        if (viewState==0){
            view.setEditScenario();
        } else {
            view.setNormalScenario();
            view.loadDetail();
        }
    }
    
    private void deleteRecord() {
        int ans = JOptionPane.showOptionDialog(
                view
                , "You are about to delete the user \"" + view.getUsername() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = model.delete(view.getUserId());
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                loadUsers();
                JOptionPane.showMessageDialog(view, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
    
    private String validateData() {
        String msg;
        if (view.getUsername().equals("")){
            msg = "Name field cannot be empty";
        } 
        else if (view.getPassword().equals("")){
            msg = "Password field cannot be empty";
        } else {
            msg = "";
        }
        return msg;
    }
  
    private String insertRecord(){
        User obj = new User(
            -1
            , view.getUsername()
            , view.getPassword()
            , view.getIsActive()
            , new TrackChange(null, new Item(user.getUserId(), user.getUsername()), null, null)
        );
        
        return model.insert(obj);
    }
    
    private String updateRecord() {
        User obj = new User(
              view.getUserId()
            , view.getUsername()
            , view.getPassword()
            , view.getIsActive()
            , new TrackChange(null, null, null, new Item(user.getUserId(),user.getUsername()))
        );
        
        return model.update(obj);
    }
    
   
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public void setSave(boolean value){
        this.save = value;
    }
    
    public boolean getSave(){
        return this.save;
    }
 
    public UserModel getModel(){
        return this.model;
    }

    /*************************** Roles Action  ************************************/
    
   private void addRole(){
        JList availableRoles = view.getLstAvailableRoles();
        if (availableRoles.getSelectedIndex() > -1){
           if (availableRoles.getModel().getSize() > 0){
                Item role = (Item)availableRoles.getSelectedValue();
                ItemListModel modelA = (ItemListModel)view.getLstAssignedRoles().getModel();
                modelA.addElement(role);
                ItemListModel modelB = (ItemListModel)availableRoles.getModel();
                modelB.removeElement(availableRoles.getSelectedIndex());
                setSave(true);
                view.setRefreshRolesButtons();
            }
        }
    }
    private void removeRole(){
        JList assignedRoles = view.getLstAssignedRoles();
        if (assignedRoles.getSelectedIndex() > -1){
            if (assignedRoles.getModel().getSize()>0){
                Item role = (Item)assignedRoles.getSelectedValue();
                ItemListModel modelB = (ItemListModel)view.getLstAvailableRoles().getModel();
                modelB.addElement(role);
                ItemListModel modelA = (ItemListModel)view.getLstAssignedRoles().getModel();
                modelA.removeElement(assignedRoles.getSelectedIndex());
                setSave(true);
                view.setRefreshRolesButtons();
            }
        }
    }
    
    private void saveRole(){
        User selectedUser = (User)view.getUserList().getSelectedValue();
        Item item;
        ItemListModel modelB = (ItemListModel)view.getLstAvailableRoles().getModel();
        for (int i = 0; i < modelB.getSize(); i++){
            item = (Item)modelB.getElementAt(i);
            model.applyUserRole(selectedUser.getUserId(), item.getId(), 0, user.getUserId());
        }
        
        ItemListModel modelA = (ItemListModel)view.getLstAssignedRoles().getModel();
        for (int i = 0; i < modelA.getSize(); i++){
            item = (Item)modelA.getElementAt(i);
            model.applyUserRole(selectedUser.getUserId(), item.getId(), 1, user.getUserId());
        }
        setSave(false);
        view.setRefreshRolesButtons();
    }
    
    /*************************** Modules Action  ************************************/
    

    private void newRecordD(){
        if (viewState == 0){
            view.setNewScenarioD();
        }else{
            String msg = validateDataD();
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Data Entry Error", JOptionPane.ERROR_MESSAGE);
            }else if (viewState == 1){                  // insert action
                msg = insertRecordD();
                if (msg.isEmpty()){
                    view.setNormalScenario();
                    view.loadTableDetail(view.getUserId());
                    JOptionPane.showMessageDialog(view, "Record created succesfully!", "New", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(view, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }else{                                // update action
                msg = updateRecordD();
                if (msg.isEmpty()){
                    view.setNormalScenario();
                    view.updateRowD();
                    JOptionPane.showMessageDialog(view, "Record updated succesfully!", "Edit", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(view, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
    }
    
    private void editRecordD(){
        if (viewState==0){
            view.setEditScenarioD();
        } else {
            view.setNormalScenario();
            view.loadRoleDetail();
        }
    }
    
    private void deleteRecordD(){
        Module item = (Module)view.getCmbObject().getSelectedItem();
        int ans = JOptionPane.showOptionDialog(
                view
                , "You are about to delete the object \"" 
                        + item.getName()
                        + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = model.deleteUserModule(view.getUserId(), item.getId());
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                User userSeleted = (User)view.getUserList().getSelectedValue();
                view.loadTableDetail(userSeleted.getUserId());
                JOptionPane.showMessageDialog(view, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
   
    private String validateDataD() {
        String msg;
        if (view.getCmbObject().getSelectedIndex() == -1){
            msg = "Object field cannot be empty";
        } else {
            msg = "";
        }
        return msg;
    }
   
    private String insertRecordD() {
        Module item = (Module)view.getCmbObject().getSelectedItem();
        UserModule obj = new UserModule(
              view.getUserId()
            , new Item(item.getId(),item.getName())
            , view.getIsCreate()
            , view.getIsUpdate()
            , view.getIsDelete()
        );
        
        return model.insertUserModule(obj, new TrackChange(null, new Item(user.getUserId(),user.getUsername()), null, null));
    }

    private String updateRecordD() {
        Module item = (Module)view.getCmbObject().getSelectedItem();
        UserModule obj = new UserModule(
              view.getUserId()
            , new Item(item.getId(),item.getName())
            , view.getIsCreate()
            , view.getIsUpdate()
            , view.getIsDelete()
        );
        
        return model.updateUserModule(obj, new TrackChange(null, null, null, new Item(user.getUserId(),user.getUsername())));
    }
    

}
