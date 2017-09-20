/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Master;
import erp.entities.Quotation;
import erp.models.ComponentComboBoxModel;
import erp.models.QuotationModel;
import erp.models.QuotationTableModel;
import erp.views.QuotationView;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Timestamp;
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
public class QuotationController implements ActionListener, ListSelectionListener {
    private final QuotationModel model;
    private final QuotationView view;
    private final UserRight right;
    private final User user;
    private int viewState;
    private Long itemKey;
    private Long subItemKey;
    
    /**
     *
     * @param view
     * @param user
     * @param right
     * @param itemKey
     * @param subItemKey
     */
    public QuotationController(QuotationView view, User user, UserRight right, Long itemKey, Long subItemKey){
        this.view = view;
        this.model = new QuotationModel();
        this.right = right;
        this.user = user;
        this.itemKey = itemKey;
        this.subItemKey = subItemKey;
        viewState = 0;
    }
    
    public void addSelectionListener(ListSelectionListener ll){
        view.getTable().getSelectionModel().addListSelectionListener(ll);
    }
    
    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
            case "Category":
                Master selectedCategory;
                selectedCategory = (Master)view.getCategory().getSelectedItem();
                if (selectedCategory == null){
                    view.getCode().setModel(new ComponentComboBoxModel(1, new Long(-1)));                // list of possible components
                } else {
                    view.getCode().setModel(new ComponentComboBoxModel(1, selectedCategory.getId()));    // list of possible components
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
    public void valueChanged(ListSelectionEvent e) {
        view.loadDetail();
    }
    
    public void loadData(){
        QuotationTableModel tableModel; 
        tableModel = new QuotationTableModel(model.getAll(itemKey, subItemKey));
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
                , "You are about to delete the object \"" + view.getId()+ "\".\nAre you sure?"
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
        if (view.getCode().getSelectedIndex() == -1){
            msg = "Internal code field is mandatory!";
        } else if (view.getVendorCode().isEmpty()){
            msg = "Vendor code field is mandatory!";
        } else if (!Util.isNumeric(view.getLeadTime())){
            msg = "From field must be a numeric value!";
        } else if (!Util.isNumeric(view.getAdditionalCost())){
            msg = "To field must be a numeric value!";
        } else if (view.getFrom().getTime() > view.getTo().getTime()){
            msg = "\"From\" date must be greater than \"To\" date!";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Quotation obj;
        obj = new Quotation(
              new Long(-1)
            , (Master)view.getCategory().getSelectedItem()
            , (Master)view.getCode().getSelectedItem()
            , view.getVendorCode()
            , Integer.parseInt(view.getLeadTime())
            , Float.parseFloat(view.getAdditionalCost())
            , new Timestamp(view.getFrom().getTime())
            , new Timestamp(view.getTo().getTime())
            , view.getNotes()
        );

        return model.insert(obj, itemKey, user.getUserId());
    }

    private String updateRecord() {
        Quotation obj;
        obj = new Quotation(
            view.getId()
            , (Master)view.getCategory().getSelectedItem()
            , (Master)view.getCode().getSelectedItem()
            , view.getVendorCode()
            , Integer.parseInt(view.getLeadTime())
            , Float.parseFloat(view.getAdditionalCost())
            , new Timestamp(view.getFrom().getTime())
            , new Timestamp(view.getTo().getTime())
            , view.getNotes()
        );
        
        return model.update(obj, itemKey, user.getUserId());
    }
    
    public void setItem(Long itemKey){
        this.itemKey = itemKey;
    }
    
    public void setSubItem(Long subItemKey){
        this.subItemKey = subItemKey;
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
    
}
