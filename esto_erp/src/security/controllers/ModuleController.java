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
import javax.swing.JComboBox;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.Item;
import security.entities.Menu;
import security.entities.Module;
import security.entities.Status;
import security.entities.TrackChange;
import security.entities.User;
import security.models.ModuleListModel;
import security.models.ModuleModel;
import security.models.StatusComboBoxModel;
import security.views.ModuleView;
import utils.Util;

/**
 *
 * @author lespinoza
 */
public class ModuleController implements ItemListener, ActionListener, ListSelectionListener{
    
    private final ModuleView view;
    private final ModuleModel model;
    private final User user;
    private int viewState;
    
    public ModuleController(ModuleModel model, ModuleView view, User user){
        this.view = view;
        this.model = model;
        this.user = user;
        viewState = 0;
    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getStateChange() == ItemEvent.SELECTED){
            loadModules();
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
                default:
                    JOptionPane.showMessageDialog(view, "Action not identified", "Unkown", JOptionPane.ERROR_MESSAGE);
                    break;
            }
        }
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {
        view.loadDetail();
    }

    public void loadStatus(){
        StatusComboBoxModel statusModel = new StatusComboBoxModel();
        JComboBox cmbStatus = view.getCmbStatus();
        cmbStatus.setModel(statusModel);
        cmbStatus.setSelectedIndex(1);
    }
    
    private void loadModules(){
        JComboBox cmbStatus = view.getCmbStatus();
        if (cmbStatus.getModel().getSize() > 0) {
            Status status = (Status)cmbStatus.getSelectedItem();
            JList lstModules = view.getModuleList();
            lstModules.setModel(new ModuleListModel(model.getList(status.getId())));
            if (lstModules.getModel().getSize() > 0){
                lstModules.setSelectedIndex(0);
            } else {
                // clear data fields
                view.clearFields();
            }
        } else {
            // clear list and data fields
        }
    }
    
    private void newRecord() {
        if (viewState == 0){
            view.setNewScenario();
        } else {
            String msg = validateData();
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Data Entry Error", JOptionPane.ERROR_MESSAGE);
            }else if (viewState == 1){                  // insert action
                msg = insertRecord();
                if (msg.isEmpty()){
                    view.setNormalScenario();
                    loadModules();
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
                , "You are about to delete the object \"" + view.getModuleName() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = model.delete(view.getModuleId());
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                loadModules();
                JOptionPane.showMessageDialog(view, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }

    private String validateData() {
        String msg;
        if (view.getModuleName().equals("")){
            msg = "Name field cannot be empty";
        } else if (view.getMenuBox().getSelectedIndex() < 0){
            msg = "Menu field has not being selected.";
        } else if (view.getOrder().equals("")){
            msg = "Order field cannot be empty";
        } else if (!Util.isNumeric(view.getOrder())){
            msg = "Order field must be a numeric value.";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Menu menu = (Menu)view.getMenuBox().getSelectedItem();
        Module obj = new Module(
              -1
            , view.getModuleName()
            , view.getModuleDescription()
            , new Item(menu.getId(), menu.getName())
            , Integer.parseInt(view.getOrder())
            , view.getIsActive()
            , new TrackChange(null, new Item(user.getUserId(), user.getUsername()), null, null)
        );
        
        return model.insert(obj);
    }
    
    private String updateRecord() {
        Menu menu = (Menu)view.getMenuBox().getSelectedItem();
        Module obj = new Module(
              view.getModuleId()
            , view.getModuleName()
            , view.getModuleDescription()
            , new Item(menu.getId(), menu.getName())
            , Integer.parseInt(view.getOrder())
            , view.getIsActive()
            , new TrackChange(null, null, null, new Item(user.getUserId(), user.getUsername()))
        );
        
        return model.update(obj);
    }

    public void setViewState(int viewState){
        this.viewState = viewState;
    }
}
