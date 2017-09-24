/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import erp.entities.Product;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class ProductTableModel extends AbstractTableModel {
    private final List<Product> list;
    private final String columnNames[] = {"Id", "IsActive", "Code", "Description", "Category", "Weight", "Color", "Width", "Height", "Large", "Min", "Max", "Notes"};
    
    public ProductTableModel(List<Product> list){
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
        Product data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setIsActive((Boolean)aValue);
                break;
            case 2:
                data.setCode((String)aValue);
                break;
            case 3:
                data.setDescription((String)aValue);
                break;
            case 4:
                data.setCategory((Master)aValue);
                break;
            case 5:
                data.setWeight((Float)aValue);
                break;
            case 6:
                data.setColor((String)aValue);
                break;
            case 7:
                data.setWidth((Float)aValue);
                break;
            case 8:
                data.setHeight((Float)aValue);
                break;
            case 9:
                data.setLarge((Float)aValue);
                break;
            case 10:
                data.setMinStock((Float)aValue);
                break;
            case 11:
                data.setMaxStock((Float)aValue);
                break;
            case 12:
                data.setNotes((String)aValue);
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
                return list.get(rowIndex).getIsActive();
            case 2:
                return list.get(rowIndex).getCode();
            case 3:
                return list.get(rowIndex).getDescription();
            case 4:
                return list.get(rowIndex).getCategory();
            case 5:
                return list.get(rowIndex).getWeight();
            case 6:
                return list.get(rowIndex).getColor();
            case 7:
                return list.get(rowIndex).getWidth();
            case 8:
                return list.get(rowIndex).getHeight();
            case 9:
                return list.get(rowIndex).getLarge();
            case 10:
                return list.get(rowIndex).getMinStock();
            case 11:
                return list.get(rowIndex).getMaxStock();
            case 12:
                return list.get(rowIndex).getNotes();
            default:
                return null;
        }
    }
    
    public Product getValue(int rowIndex){
        return (Product)list.get(rowIndex);
    }
}
