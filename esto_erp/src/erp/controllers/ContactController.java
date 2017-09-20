/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Contact;
import erp.models.ContactModel;
import erp.models.ContactTableModel;
import erp.views.ContactView;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.User;
import security.entities.UserRight;
import utils.TableColumnAdjuster;

/**
 *
 * @author lespinoza
 */
public class ContactController implements ActionListener, ListSelectionListener{
    private final ContactView view;
    private final ContactModel model;
    private final UserRight right;
    private final User user;
    private int viewState;
    private Long keyItem;
    private final int type;       /*0 : Customer, 1: Provider*/    
    /**
     *
     * @param view
     * @param user
     * @param right
     * @param keyItem
     * @param type
     */
    public ContactController(ContactView view, User user, UserRight right, Long keyItem, int type){
        this.model = new ContactModel();
        this.view = view;
        this.user = user;
        this.right = right;
        this.keyItem = keyItem;
        this.type = type;
        this.viewState = 0;
    }
    
    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
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
        ContactTableModel tableModel;
        tableModel = new ContactTableModel(model.getList(type, keyItem));
        view.getTblContact().setModel(tableModel);
        TableColumnAdjuster ta = new TableColumnAdjuster(view.getTblContact());
        ta.setOnlyAdjustLarger(false);
        ta.adjustColumns();
        if (tableModel.getRowCount() > 0) {
            view.getTblContact().setRowSelectionInterval(0, 0);
            view.getBtnEdit().setEnabled(right.getIsUpdated());
            view.getBtnDelete().setEnabled(right.getIsDeleted());
        } else {
            view.clearFields();
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
                , "You are about to delete the object \"" + view.getContactId().toString() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg;
            msg = model.delete(type, view.getContactId(), keyItem);
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
        if (view.getFirstName().equals("")){
            msg = "First name field cannot be empty.";
        } else if (view.getLastName().equals("")){
            msg = "Last name field must be a numeric value.";
        } else if (view.getSurname().equals("")){
            msg = "Surname field cannot be empty.";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Contact obj;
        obj = new Contact(
                new Long(-1)
                , view.getSuffix()
                , view.getTitle()
                , view.getFirstName()
                , view.getMiddleName()
                , view.getLastName()
                , view.getSurname()
                , view.getEmail()
                , view.getWorkPhone()
                , view.getHomePhone()
                , view.getMobilPhone()
        );
        
        return model.insert(obj, type, keyItem, user.getUserId());
    }

    private String updateRecord() {
        Contact obj;
        obj = new Contact(
                  view.getContactId()
                , view.getSuffix()
                , view.getTitle()
                , view.getFirstName()
                , view.getMiddleName()
                , view.getLastName()
                , view.getSurname()
                , view.getEmail()
                , view.getWorkPhone()
                , view.getHomePhone()
                , view.getMobilPhone()
        );
        
        return model.update(obj, user.getUserId());
    }
    
    public void setItem(Long keyItem) {
        this.keyItem = keyItem;
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
}
