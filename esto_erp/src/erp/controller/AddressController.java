/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controller;


import erp.entities.Address;
import erp.entities.Country;
import erp.model.AddressModel;
import erp.model.AddressTableModel;
import erp.view.AddressView;
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
public class AddressController implements ActionListener, ListSelectionListener{
    private final AddressView view;
    private final AddressModel model;
    private final int parentType;       /*0 : Customer, 1: Provider*/
    private final UserRight right;
    private final User user;
    private int viewState;
    
    public AddressController(AddressView view, User user, UserRight right, int parentType){
        this.model = new AddressModel();
        this.view = view;
        this.right = right;
        this.user = user;
        this.parentType = parentType;
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
        AddressTableModel tableModel;
        if (parentType == 0) {
            tableModel = new AddressTableModel(model.getCustomerAddresses());
        } else {
            tableModel = new AddressTableModel(model.getProviderAddresses());
        }
        view.getTblAddress().setModel(tableModel);
        TableColumnAdjuster ta = new TableColumnAdjuster(view.getTblAddress());
        ta.setOnlyAdjustLarger(false);
        ta.adjustColumns();
        if (tableModel.getRowCount() > 0) {
            view.getTblAddress().setRowSelectionInterval(0, 0);
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
                , "You are about to delete the object \"" + view.getAddressId().toString() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg;
            if (parentType == 0) {
                msg = model.deleteCustomerAddress(view.getAddressId());
            } else {
                msg = model.deleteProviderAddress(view.getAddressId());
            }
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
        if (view.getLine1().equals("")){
            msg = "Address line 1 field cannot be empty.";
        } else if (view.getLine2().equals("")){
            msg = "Address line 2 field cannot be empty.";
        } else if (view.getCity().equals("")){
            msg = "City field cannot be empty.";
        } else if (view.getState().equals("")){
            msg = "State field cannot be empty.";
        } else if (view.getCountry().getSelectedIndex() == -1){
            msg = "Country field can not be empty.";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Address obj;
        obj = new Address(
                new Long(-1)
                , view.getLine1()
                , view.getLine2()
                , view.getLine3()
                , view.getZipcode()
                , view.getCity()
                , view.getState()
                , (Country)view.getCountry().getSelectedItem()
        );
        if (parentType == 0) {
            return model.insertCustomerAddress(obj, user.getUserId());
        } else {
            return model.insertProviderAddress(obj, user.getUserId());
        }
    }

    private String updateRecord() {
        Address obj;
        obj = new Address(
                  view.getAddressId()
                , view.getLine1()
                , view.getLine2()
                , view.getLine3()
                , view.getZipcode()
                , view.getCity()
                , view.getState()
                , (Country)view.getCountry().getSelectedItem()
        );
        
        return model.updateAddress(obj, user.getUserId());
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public AddressModel getModel(){
        return model;
    }
    
    public UserRight getRight(){
        return right;
    }
}
