/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import security.entities.RoleModule;

/**
 *
 * @author Administrator
 */
public class RoleModuleTableModel extends AbstractTableModel{
    private final List<RoleModule> list;
    private final String columnNames[] = {"Module", "Create" , "Update", "Delete"};
    
    public RoleModuleTableModel(List<RoleModule> list){
        this.list = list;
    }
            
    @Override
    public int getRowCount() {
        return list.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }
    
    @Override
    public String getColumnName(int column) {
        return this.columnNames[column]; 
    }

    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        RoleModule data = list.get(rowIndex);
        Boolean bnd;
        switch (columnIndex){
            case 0:
                data.setModule((Item)aValue);
                break;
            case 1:
                bnd = (Boolean)aValue;
                data.setIsCreated(bnd);
                break;
            case 2:
                bnd = (Boolean)aValue;
                data.setIsUpdated(bnd);
                break;
            case 3:
                bnd = (Boolean)aValue;
                data.setIsDeleted(bnd);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getModule();
            case 1:
                return list.get(rowIndex).getIsCreated();
            case 2:
                return list.get(rowIndex).getIsUpdated();
            case 3:
                return list.get(rowIndex).getIsDeleted();
            default:
                return null;
        }
    }
}
