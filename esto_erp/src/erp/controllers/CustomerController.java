/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Address;
import erp.entities.Contact;
import erp.entities.Country;
import erp.entities.Customer;
import erp.models.CustomerModel;
import erp.models.CustomerTableModel;
import erp.views.CustomerView;
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
public class CustomerController implements ActionListener, ListSelectionListener {
    private final CustomerModel model;
    private final CustomerView view;
    private final UserRight right;
    private final User user;
    private int viewState;
    
    public CustomerController(CustomerView view, User user, UserRight right){
        this.view = view;
        this.model = new CustomerModel();
        this.right = right;
        this.user = user;
        viewState = 0;
    }
    
    public void addSelectionListener(ListSelectionListener ll){
        view.getTable().getSelectionModel().addListSelectionListener(ll);
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
    public void valueChanged(ListSelectionEvent e) {
        view.loadDetail();
    }
    
    public void loadData(){
        CustomerTableModel tableModel; 
        tableModel = new CustomerTableModel(model.getAll());
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
                , "You are about to delete the object \"" + view.getCode()+ "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = model.delete(view.getId());
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
        if (view.getCode().equals("")){
            msg = "Name field cannot be empty";
        } else if (view.getFullName().equals("")){
            msg = "Name field cannot be empty";
        } else if (view.getLine1().equals("")){
            msg = "Address line 1 field cannot be empty";
        } else if (view.getLine2().equals("")){
            msg = "Address line 2 field cannot be empty";
        } else if (view.getCity().equals("")){
            msg = "City field cannot be empty";
        } else if (view.getState().equals("")){
            msg = "State field cannot be empty";
        } else if (view.getCountry().getSelectedIndex() == -1){
            msg = "Country field cannot be empty";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Customer obj = new Customer(
              new Long(-1)
            , view.getCode()
            , view.getFullName()
            , view.getPhone1()
            , view.getPhone1()
            , new Address(new Long(-1), view.getLine1(), view.getLine2(), view.getLine3(), view.getZipcode(), view.getCity(), view.getState(), (Country)view.getCountry().getSelectedItem())
            , new Contact(new Long(-1), view.getSuffix(), view.getContactTitle(), view.getFirstName(), view.getMiddleName(), view.getLastName(), view.getSurname(), view.getEmail(), view.getWorkPhone(), view.getHomePhone(), view.getMobilPhone())
            , view.getWebsite()
            , view.getNotes()
        );
        
        return model.insert(obj, user.getUserId());
    }

    private String updateRecord() {
        Customer obj = new Customer(
              view.getId()
            , view.getCode()
            , view.getFullName()
            , view.getPhone1()
            , view.getPhone1()
            , new Address(view.getAddressId(), view.getLine1(), view.getLine2(), view.getLine3(), view.getZipcode(), view.getCity(), view.getState(), (Country)view.getCountry().getSelectedItem())
            , new Contact(view.getCountactId(), view.getSuffix(), view.getContactTitle(), view.getFirstName(), view.getMiddleName(), view.getLastName(), view.getSurname(), view.getEmail(), view.getWorkPhone(), view.getHomePhone(), view.getMobilPhone())
            , view.getWebsite()
            , view.getNotes()
        );
        
        return model.update(obj, user.getUserId());
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
}
