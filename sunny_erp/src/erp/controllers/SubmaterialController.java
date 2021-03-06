/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Master;
import erp.entities.Submaterial;
import erp.models.SubmaterialModel;
import erp.models.SubmaterialTableModel;
import erp.views.SubmaterialView;
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
public class SubmaterialController implements ActionListener, ListSelectionListener {
    private final SubmaterialModel model;
    private final SubmaterialView view;
    private final UserRight right;
    private final User user;
    private int viewState;

    public SubmaterialController(SubmaterialView view, User user, UserRight right) {
        this.view = view;
        this.model = new SubmaterialModel();
        this.right = right;
        this.user = user;
        viewState = 0;
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
        SubmaterialTableModel tableModel; 
        tableModel = new SubmaterialTableModel(model.getAll());
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
            msg = "Code field cannot be empty";
        } else if (view.getDescription().equals("")){
            msg = "Description field cannot be empty";
        } else if (!Util.isNumeric(view.getWeight())){
            msg = "Weight field must be a numeric value";
        } else if (!Util.isNumeric(view.getMinStock())){
            msg = "Minimum stock field must be a numeric value";
        } else if (!Util.isNumeric(view.getMaxStock())){
            msg = "Maximum stock field must be a numeric value";
        } else if (view.getUOM().getSelectedIndex() == -1){
            msg = "A Unit Of Measure (UOM) must be selected";
        } else if (view.getCategory().getSelectedIndex() == -1){
            msg = "A category must be selected";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Submaterial obj;
        obj = new Submaterial(
                new Long(-1)
                , view.getIsActive()
                , view.getCode()
                , view.getDescription()
                , Float.parseFloat(view.getWeight())
                , Float.parseFloat(view.getMinStock())
                , Float.parseFloat(view.getMaxStock())
                , (Master)view.getUOM().getSelectedItem()
                , (Master)view.getCategory().getSelectedItem()
                , view.getNotes()
        );
        
        return model.insert(obj, user.getUserId());
    }

    private String updateRecord() {
        Submaterial obj;
        obj = new Submaterial(
                  view.getId()
                , view.getIsActive()
                , view.getCode()
                , view.getDescription()
                , Float.parseFloat(view.getWeight())
                , Float.parseFloat(view.getMinStock())
                , Float.parseFloat(view.getMaxStock())
                , (Master)view.getUOM().getSelectedItem()
                , (Master)view.getCategory().getSelectedItem()
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
