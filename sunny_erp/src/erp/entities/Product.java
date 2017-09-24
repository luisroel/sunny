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
public class Product {
    private Long id;
    private Boolean isActive;
    private String code;
    private String description;
    private Master category;
    private Float weight;
    private String color;
    private Float width;
    private Float height;
    private Float large;
    private Float minStock;
    private Float maxStock;
    private String notes;

    public Product(Long id, Boolean isActive, String code, String description, Master category, Float weight, String color, Float width, Float height, Float large, Float minStock, Float maxStock, String notes) {
        this.id = id;
        this.isActive = isActive;
        this.code = code;
        this.description = description;
        this.category = category;
        this.weight = weight;
        this.color = color;
        this.width = width;
        this.height = height;
        this.large = large;
        this.minStock = minStock;
        this.maxStock = maxStock;
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

    public Master getCategory() {
        return category;
    }

    public void setCategory(Master category) {
        this.category = category;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Float getWidth() {
        return width;
    }

    public void setWidth(Float width) {
        this.width = width;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public Float getLarge() {
        return large;
    }

    public void setLarge(Float large) {
        this.large = large;
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

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return code; //To change body of generated methods, choose Tools | Templates.
    }
}
