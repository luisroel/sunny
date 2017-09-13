/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.model;

import erp.entities.Address;
import erp.entities.Country;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class AddressTableModel extends AbstractTableModel {
    private final List<Address> list;
    private final String columnNames[] = {"Id", "Line 1", "Line 2", "Line 3", "Zip Code:", "City", "State", "Country"};
    
    public AddressTableModel(List<Address> list){
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
        Address data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setAddressId((Long)aValue);
                break;
            case 1:
                data.setLine1((String)aValue);
                break;
            case 2:
                data.setLine2((String)aValue);
                break;
            case 3:
                data.setLine3((String)aValue);
                break;
            case 4:
                data.setZipcode((String)aValue);
                break;
            case 5:
                data.setCity((String)aValue);
                break;
            case 6:
                data.setState((String)aValue);
                break;
            case 7:
                data.setCountry((Country)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex) {
            case 0:
                return list.get(rowIndex).getAddressId();
            case 1:
                return list.get(rowIndex).getLine1();
            case 2:
                return list.get(rowIndex).getLine2();
            case 3:
                return list.get(rowIndex).getLine3();
            case 4:
                return list.get(rowIndex).getZipcode();
            case 5:
                return list.get(rowIndex).getCity();
            case 6:
                return list.get(rowIndex).getState();
            case 7:
                return list.get(rowIndex).getCountry();
            default:
                return null;
        }
    }
    
}
