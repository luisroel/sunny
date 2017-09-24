/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.entities.Range;
import erp.models.RangeModel;
import erp.models.RangeTableModel;
import erp.views.RangeView;
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
public class RangeController implements ActionListener, ListSelectionListener {
    private final RangeModel model;
    private final RangeView view;
    private final UserRight right;
    private final User user;
    private int viewState;
    private Long itemKey;
    private int type;
    
    /**
     *
     * @param view
     * @param user
     * @param right
     * @param type
     * @param itemKey
     */
    public RangeController(RangeView view, User user, UserRight right, int type, Long itemKey){
        this.view = view;
        this.model = new RangeModel();
        this.right = right;
        this.user = user;
        this.itemKey = itemKey;
        this.type = type;
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
    public void valueChanged(ListSelectionEvent e) {
        view.loadDetail();
    }
    
    public void loadData(){
        RangeTableModel tableModel; 
        tableModel = new RangeTableModel(model.getAll(type, itemKey));
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
                , "You are about to delete the object \"" + view.getDescription()+ "\".\nAre you sure?"
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
        if (!Util.isNumeric(view.getFrom())){
            msg = "From field must be a numeric value!";
        } else if (!Util.isNumeric(view.getTo())){
            msg = "To field must be a numeric value!";
        } else if (!Util.isNumeric(view.getAmount())){
            msg = "Amount field must be a numeric value!";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private String insertRecord() {
        Range obj = new Range(
              new Long(-1)
            , Float.parseFloat(view.getFrom())
            , Float.parseFloat(view.getTo())
            , Float.parseFloat(view.getAmount())
        );
        
        return model.insert(obj, type, itemKey, user.getUserId());
    }

    private String updateRecord() {
        Range obj = new Range(
              view.getId()
            , Float.parseFloat(view.getFrom())
            , Float.parseFloat(view.getTo())
            , Float.parseFloat(view.getAmount())
        );
        
        return model.update(obj, type, itemKey, user.getUserId());
    }
    
    public void setItem(Long itemKey){
        this.itemKey = itemKey;
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
    
}
