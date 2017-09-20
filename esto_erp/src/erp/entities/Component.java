/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.entities;

/**
 *
 * @author lespinoza
 */
public class Component {
    private Master category;
    private Master item;
    private float quantity;

    public Component(Master category, Master item, float quantity) {
        this.category = category;
        this.item = item;
        this.quantity = quantity;
    }

    public Master getCategory() {
        return category;
    }

    public void setCategory(Master category) {
        this.category = category;
    }

    public Master getItem() {
        return item;
    }

    public String getItemDescription() {
        return item.getDescription();
    }

    public void setItem(Master item) {
        this.item = item;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return item.getCode(); //To change body of generated methods, choose Tools | Templates.
    }
}
