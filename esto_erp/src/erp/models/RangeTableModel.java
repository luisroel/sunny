/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Range;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class RangeTableModel extends AbstractTableModel {
    private final List<Range> list;
    private final String columnNames[] = {"Id", "From", "To", "Amount"};
    
    public RangeTableModel(List<Range> list){
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
        Range data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setFrom((Float)aValue);
                break;
            case 2:
                data.setTo((Float)aValue);
                break;
            case 3:
                data.setAmount((Float)aValue);
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
                return list.get(rowIndex).getFrom();
            case 2:
                return list.get(rowIndex).getTo();
            case 3:
                return list.get(rowIndex).getAmount();
            default:
                return null;
        }
    }
}
