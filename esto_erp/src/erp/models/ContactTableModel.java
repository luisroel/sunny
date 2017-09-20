/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Contact;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class ContactTableModel extends AbstractTableModel {
    private final List<Contact> list;
    private final String columnNames[] = {"Id", "Suffix", "Title", "First Name", "Middle Name", "Last Name", "Surname", "Email", "Work Phone", "Home Phone", "Mobil Phone"};
    
    public ContactTableModel(List<Contact> list){
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
        Contact data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setSuffix((String)aValue);
                break;
            case 2:
                data.setTitle((String)aValue);
                break;
            case 3:
                data.setFirstName((String)aValue);
                break;
            case 4:
                data.setMiddleName((String)aValue);
                break;
            case 5:
                data.setLastName((String)aValue);
                break;
            case 6:
                data.setSurname((String)aValue);
                break;
            case 7:
                data.setEmail((String)aValue);
                break;
            case 8:
                data.setWorkPhone((String)aValue);
                break;
            case 9:
                data.setHomePhone((String)aValue);
                break;
            case 10:
                data.setMobilPhone((String)aValue);
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
                return list.get(rowIndex).getSuffix();
            case 2:
                return list.get(rowIndex).getTitle();
            case 3:
                return list.get(rowIndex).getFirstName();
            case 4:
                return list.get(rowIndex).getMiddleName();
            case 5:
                return list.get(rowIndex).getLastName();
            case 6:
                return list.get(rowIndex).getSurname();
            case 7:
                return list.get(rowIndex).getEmail();
            case 8:
                return list.get(rowIndex).getWorkPhone();
            case 9:
                return list.get(rowIndex).getHomePhone();
            case 10:
                return list.get(rowIndex).getMobilPhone();
            default:
                return null;
        }
    }
}
