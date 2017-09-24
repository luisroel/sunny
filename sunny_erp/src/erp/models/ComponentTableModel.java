/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Component;
import erp.entities.Master;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class ComponentTableModel extends AbstractTableModel {
    private final List<Component> list;
    private final String columnNames[] = {"Category", "Component", "Description", "Quantity"};
    
    public ComponentTableModel(List<Component> list){
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
        Component data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setCategory((Master)aValue);
                break;
            case 1:
                data.setItem((Master)aValue);
                break;
            case 2:
                data.setItem((Master)aValue);
                break;
            case 3:
                data.setQuantity((Float)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex) {
            case 0:
                return list.get(rowIndex).getCategory();
            case 1:
                return list.get(rowIndex).getItem();
            case 2:
                return list.get(rowIndex).getItem().getDescription();
            case 3:
                return list.get(rowIndex).getQuantity();
            default:
                return null;
        }
    }
}
