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
public class Master {
    private Long categoryId;
    private String code;
    private String description;

    /**
     *
     * @param categoryId
     * @param code
     * @param description
     */
    public Master(Long categoryId, String code, String description) {
        this.categoryId = categoryId;
        this.code = code;
        this.description = description;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
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

    @Override
    public String toString() {
        return description; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
