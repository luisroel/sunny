/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;

/**
 *
 * @author Administrator
 */
public class ComponentComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<Master> list;
    private Master selectedItem;
    
    public ComponentComboBoxModel(int type, Long id){
        list = new ComponentModel().getComponentList(type, id);
    }
    
    @Override
    public int getSize() {
        return list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return list.get(index);
    }

    @Override
    public void setSelectedItem(Object anItem) {
        selectedItem = (Master)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
