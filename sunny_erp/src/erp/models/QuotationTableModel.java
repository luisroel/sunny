/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import erp.entities.Product;
import erp.entities.Quotation;
import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author lespinoza
 */
public class QuotationTableModel extends AbstractTableModel {
    private final List<Quotation> list;
    private final String columnNames[] = {"Id", "Category", "Code", "Vendor Code", "Lead Time", "Addl. Cost", "From", "To", "Notes"};
    
    public QuotationTableModel(List<Quotation> list){
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
        Quotation data = list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setCategory((Master)aValue);
                break;
            case 2:
                data.setCode((Master)aValue);
                break;
            case 3:
                data.setProviderCode((String)aValue);
                break;
            case 4:
                data.setLeadTime((Integer)aValue);
                break;
            case 5:
                data.setAdditionalCost((Float)aValue);
                break;
            case 6:
                data.setFrom((Timestamp)aValue);
                break;
            case 7:
                data.setTo((Timestamp)aValue);
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
                return list.get(rowIndex).getCategory();
            case 2:
                return list.get(rowIndex).getCode();
            case 3:
                return list.get(rowIndex).getProviderCode();
            case 4:
                return list.get(rowIndex).getLeadTime();
            case 5:
                return list.get(rowIndex).getAdditionalCost();
            case 6:
                return list.get(rowIndex).getFrom();
            case 7:
                return list.get(rowIndex).getTo();
            case 8:
                return list.get(rowIndex).getNotes();
            default:
                return null;
        }
    }
    
    public Quotation getValue(int rowIndex){
        return (Quotation)list.get(rowIndex);
    }
}
