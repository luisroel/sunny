/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.entities;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

/**
 *
 * @author lespinoza
 */
public abstract class AbstractEntity {
    protected PropertyChangeSupport propertyChangeSupport;
    
    public AbstractEntity(){
        propertyChangeSupport = new PropertyChangeSupport(this);
    }
    
    public void addPropertyChangeListener(PropertyChangeListener listener){
        propertyChangeSupport.addPropertyChangeListener(listener);
    }
    
    public void removePropertyChangeListener(PropertyChangeListener listener){
        propertyChangeSupport.removePropertyChangeListener(listener);
    }
    
    public void firePropertyChange(String propertyName, Object oldValue, Object newValue){
        propertyChangeSupport.firePropertyChange(propertyName, oldValue, oldValue);
    }
}
