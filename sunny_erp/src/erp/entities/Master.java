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
    private Long id;
    private String code;
    private String description;

    /**
     *
     * @param id
     * @param code
     * @param description
     */
    public Master(Long id, String code, String description) {
        this.id = id;
        this.code = code;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        return this.code; //To change body of generated methods, choose Tools | Templates.
    }
}
