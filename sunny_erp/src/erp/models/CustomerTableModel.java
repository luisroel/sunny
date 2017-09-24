/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Address;
import erp.entities.Contact;
import erp.entities.Customer;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class CustomerTableModel extends AbstractTableModel {
    private final List<Customer> list;
    private final String columnNames[] = {"Id", "Code", "Name", "Phone 1", "Phone 2", "Contact", "Address", "Web", "Notes"};
    
    public CustomerTableModel(List<Customer> list){
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
        Customer data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setCode((String)aValue);
                break;
            case 2:
                data.setName((String)aValue);
                break;
            case 3:
                data.setPhone1((String)aValue);
                break;
            case 4:
                data.setPhone2((String)aValue);
                break;
            case 5:
                data.setContact((Contact)aValue);
                break;
            case 6:
                data.setAddress((Address)aValue);
                break;
            case 7:
                data.setWebsite((String)aValue);
                break;
            case 8:
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
                return list.get(rowIndex).getCode();
            case 2:
                return list.get(rowIndex).getName();
            case 3:
                return list.get(rowIndex).getPhone1();
            case 4:
                return list.get(rowIndex).getPhone2();
            case 5:
                return list.get(rowIndex).getContact();
            case 6:
                return list.get(rowIndex).getAddress();
            case 7:
                return list.get(rowIndex).getWebsite();
            case 8:
                return list.get(rowIndex).getNotes();
            default:
                return null;
        }
    }

    public Customer getValue(int rowIndex){
        return (Customer)list.get(rowIndex);
    }
}
