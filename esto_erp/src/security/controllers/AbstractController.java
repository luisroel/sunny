/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.controllers;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import security.models.AbstractModel;
import security.views.AbstractView;

/**
 *
 * @author lespinoza
 */
public abstract class AbstractController implements PropertyChangeListener, ActionListener {

    private final ArrayList<AbstractView> registeredViews;
    private final ArrayList<AbstractModel> registeredModels;

    public AbstractController() {
        this.registeredViews = new ArrayList<>();
        this.registeredModels = new ArrayList<>();
    }

    public void addModel(AbstractModel model){
        registeredModels.add(model);
        model.addPropertyChangeListener(this);
    }
    
    public void removeModel(AbstractModel model){
        registeredModels.remove(model);
        model.removePropertyChangeListener(this);
    }
    
    public void addView(AbstractView view){
        registeredViews.add(view);
    }
    
    public void removeView(AbstractView view){
        registeredViews.remove(view);
    }
    
    /**
     *  Use this to observe property changes from registered models
     * and propagate them on to all the views
     * @param pce 
     */
    @Override
    public void propertyChange(PropertyChangeEvent pce) {
        for (AbstractView view: registeredViews){
//            view.modelPropertyChange(pce);
        }
    }
    
    /**
     * This is a convenience method that subclasses can call upon
     * to fire property changes back to the models. This method
     * uses reflection to inspect each of the model classes
     * to determine whether it is the owner of the property
     * in question. If it isn't, a NoSuchMethodException is thrown,
     * which the method ignores.
     * @param propertyName
     * @param newValue
     */
    protected void setModelProperty(String propertyName, Object newValue){
        registeredModels.stream().forEach((AbstractModel model) -> {
            try {
                
                Method method = model.getClass().
                        getMethod("set"+propertyName, new Class[] {
                            newValue.getClass()
                        }
                        );
                method.invoke(model, newValue);
            } catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
                //  Handle exception.
            }
        });
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
            case "Add":
                    
                break;
            case "Update":
                break;
            case "Delete":
                break;
            default:
                break;
        }
    }
}
