/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Master;
import erp.entities.Component;
import erp.models.ComponentComboBoxModel;
import erp.models.ComponentModel;
import erp.models.ComponentTableModel;
import erp.views.ComponentView;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.User;
import security.entities.UserRight;
import utils.TableColumnAdjuster;
import utils.Util;

/**
 *
 * @author lespinoza
 */
public class ComponentController implements ActionListener, ListSelectionListener {
    private final ComponentModel model;
    private final ComponentView view;
    private final UserRight right;
    private final User user;
    private int viewState;
    private Long itemKey;
    private final int type; // 0: product component, 1: subamterial component

    public ComponentController(ComponentView view, User user, UserRight right, int type, Long itemKey) {
        this.view = view;
        this.model = new ComponentModel();
        this.right = right;
        this.user = user;
        this.itemKey = itemKey;
        this.type = type;
        viewState = 0;
    }
    
    public void setItem(Long itemKey){
        this.itemKey = itemKey;
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
            case "Category":
                Master selectedCategory;
                selectedCategory = (Master)view.getCategory().getSelectedItem();
                if (selectedCategory == null){
                    view.getCode().setModel(new ComponentComboBoxModel(type, new Long(-1)));                // list of possible components
                } else {
                    view.getCode().setModel(new ComponentComboBoxModel(type, selectedCategory.getId()));    // list of possible components
                }
                
                if (view.getCode().getModel().getSize() > 0){
                    view.getCode().setSelectedIndex(0);
                }
                break;
            case "Component":
                Master selectedComponent;
                selectedComponent = (Master)view.getCode().getSelectedItem();
                if (selectedComponent == null){
                    view.setDescription("");
                } else {
                    view.setDescription(selectedComponent.getDescription());
                }
                break;
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

    @Override
    public void valueChanged(ListSelectionEvent lse) {
        view.loadDetail();
    }
    
   public void loadData(){
        ComponentTableModel tableModel; 
        tableModel = new ComponentTableModel(model.getAll(type, itemKey));
        view.getTable().setModel(tableModel);
        TableColumnAdjuster ta = new TableColumnAdjuster(view.getTable());
        ta.setOnlyAdjustLarger(false);
        ta.adjustColumns();
        if (tableModel.getRowCount() > 0) {
            view.getTable().setRowSelectionInterval(0, 0);
            view.getBtnEdit().setEnabled(right.getIsUpdated());
            view.getBtnDelete().setEnabled(right.getIsDeleted());
        } else {
            view.getBtnEdit().setEnabled(false);
            view.getBtnDelete().setEnabled(false);
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
                    loadData();
                    JOptionPane.showMessageDialog(view, "Record created succesfully!", "New", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(view, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {                                // update action
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
        if (viewState == 0){
            view.setEditScenario();
        } else {
            view.setNormalScenario();
            view.loadDetail();
        }
    }
    
    private void deleteRecord() {
        int ans = JOptionPane.showOptionDialog(
                view
                , "You are about to delete the object \"" + ((Master)view.getCode().getSelectedItem()).getCode() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg;
            msg = model.delete(type, ((Master)view.getCode().getSelectedItem()).getId(), itemKey);
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(view, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                loadData();
                JOptionPane.showMessageDialog(view, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
    
    private String validateData() {
        String msg;
        if (view.getCode().getSelectedIndex() == -1){
            msg = "A code component must be selected";
        } else if (!Util.isNumeric(view.getQuantity())){
            msg = "Quantity field must be a numeric value";
        } else {
            msg = "";
        }
        return msg;
    }

    private String insertRecord() {
        Component obj;
        obj = new Component(
                  (Master)view.getCategory().getSelectedItem()
                , (Master)view.getCode().getSelectedItem()
                , Float.parseFloat(view.getQuantity())
        );
        
        return model.insert(obj, type, itemKey, user.getUserId());
    }

    private String updateRecord() {
        Component obj;
        obj = new Component(
                  (Master)view.getCategory().getSelectedItem()
                , (Master)view.getCode().getSelectedItem()
                , Float.parseFloat(view.getQuantity())
        );
        
        return model.update(obj, type, itemKey, user.getUserId());
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
}
