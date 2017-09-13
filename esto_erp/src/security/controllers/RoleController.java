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
import security.entities.Role;
import security.entities.RoleModule;
import security.entities.Status;
import security.entities.TrackChange;
import security.entities.User;
import security.models.RoleListModel;
import security.models.RoleModel;
import security.models.StatusComboBoxModel;
import security.views.RoleView;

/**
 *
 * @author lespinoza
 */
public class RoleController implements ActionListener, ItemListener, ListSelectionListener {

    private final RoleView view;
    private final RoleModel model;
    private final User user;
    private int viewState;
    
    public RoleController(RoleModel model, RoleView view, User user){
        this.view = view;
        this.model = model;
        this.user = user;
        viewState = 0;
    }
    
    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getStateChange() == ItemEvent.SELECTED){
            loadRoles();
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
                    JOptionPane.showMessageDialog(view, "Action not identified: (" + e.getActionCommand() + ")", "Unkown", JOptionPane.ERROR_MESSAGE);
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
    
    public void loadStatus() {
        StatusComboBoxModel statusModel = new StatusComboBoxModel();
        JComboBox cmbStatus = view.getCmbStatus();
        cmbStatus.setModel(statusModel);
        cmbStatus.setSelectedIndex(1);  
    }
    
    private void loadRoles(){
        JComboBox cmbStatus = view.getCmbStatus();
        if (cmbStatus.getModel().getSize() > 0) {
            Status status = (Status)cmbStatus.getSelectedItem();
            JList lstRoles = view.getRoleList();
            lstRoles.setModel(new RoleListModel(model.getList(status.getId())));
            if (lstRoles.getModel().getSize() > 0){
                lstRoles.setSelectedIndex(0);
            } else {
                // clear data fields
                view.clearFields();
            }
        } else {
            // clear data fields
            view.clearFields();
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
                    loadRoles();
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
                , "You are about to delete the object \"" + view.getRoleName() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = model.delete(view.getRoleId());
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                loadRoles();
                JOptionPane.showMessageDialog(view, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
  
    private String validateData() {
        String msg;
        if (view.getRoleName().equals("")){
            msg = "Name field cannot be empty";
        } else {
            msg = "";
        }
        return msg;
    }
   
     private String insertRecord() {
        Role obj = new Role(
              -1
            , view.getRoleName()
            , view.getRoleDescription()
            , view.getIsActive()
            , new TrackChange(null, new Item(user.getUserId(), user.getUsername()), null, null)
        );
        
        return model.insert(obj);
    }

    private String updateRecord() {
        Role obj = new Role(
              view.getRoleId()
            , view.getRoleName()
            , view.getRoleDescription()
            , view.getIsActive()
            , new TrackChange(null, null, null, new Item(user.getUserId(), user.getUsername()))
        );
        
        return model.update(obj);
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
     public RoleModel getModel(){
        return this.model;
    }
 /*************************** Modules Action  ************************************/
    
     private void newRecordD() {
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
                    view.loadTableDetail(view.getRoleId());
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
  
    private void editRecordD() {
        if (viewState==0){
            view.setEditScenarioD();
        } else {
            view.setNormalScenario();
            view.loadRoleDetail();
        }
    }
    
    private void deleteRecordD() {
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
            String msg = model.deleteModule(view.getRoleId(), item.getId());
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                Role role = (Role)view.getRoleList().getSelectedValue();
                view.loadTableDetail(role.getId());
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
        RoleModule obj = new RoleModule(
              view.getRoleId()
            , new Item(item.getId(),item.getName())
            , view.getIsCreate()
            , view.getIsUpdate()
            , view.getIsDelete()
        );
        
        return model.insertModule(obj, new TrackChange(null, new Item(user.getUserId(), user.getUsername()), null, null));
    }

    private String updateRecordD() {
        Module item = (Module)view.getCmbObject().getSelectedItem();
        RoleModule obj = new RoleModule(
              view.getRoleId()
            , new Item(item.getId(),item.getName())
            , view.getIsCreate()
            , view.getIsUpdate()
            , view.getIsDelete()
        );
        
        return model.updateModule(obj, new TrackChange(null, null, null, new Item(user.getUserId(), user.getUsername())));
    }
    
}
