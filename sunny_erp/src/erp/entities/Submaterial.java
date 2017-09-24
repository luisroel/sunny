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
public class Submaterial {
    private Long id;
    private Boolean isActive;
    private String code;
    private String description;
    private Float weight;
    private Float minStock;
    private Float maxStock;
    private Master UOM;
    private Master category;
    private String notes;

    public Submaterial(Long id, Boolean isActive, String code, String description, Float weight, Float minStock, Float maxStock, Master UOM, Master category, String notes) {
        this.id = id;
        this.isActive = isActive;
        this.code = code;
        this.description = description;
        this.weight = weight;
        this.minStock = minStock;
        this.maxStock = maxStock;
        this.UOM = UOM;
        this.category = category;
        this.notes = notes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Float getMinStock() {
        return minStock;
    }

    public void setMinStock(Float minStock) {
        this.minStock = minStock;
    }

    public Float getMaxStock() {
        return maxStock;
    }

    public void setMaxStock(Float maxStock) {
        this.maxStock = maxStock;
    }

    public Master getUOM() {
        return UOM;
    }

    public void setUOM(Master UOM) {
        this.UOM = UOM;
    }

    public Master getCategory() {
        return category;
    }

    public void setCategory(Master category) {
        this.category = category;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return this.code; //To change body of generated methods, choose Tools | Templates.
    }
}
