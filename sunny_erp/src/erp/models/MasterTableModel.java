/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class MasterTableModel extends AbstractTableModel {
    private final List<Master> list;
    private final String columnNames[] = {"Id", "Code", "Description"};
    
    public MasterTableModel(List<Master> list){
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
        Master data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setCode((String)aValue);
                break;
            case 2:
                data.setDescription((String)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex) {
            case 0:
                return list.get(rowIndex).getId();
            case 1:
                return list.get(rowIndex).getCode();
            case 2:
                return list.get(rowIndex).getDescription();
            default:
                return null;
        }
    }
}
