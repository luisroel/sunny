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
public class Country {
    private Long id;
    private String code;
    private String countryName;

    /**
     *
     * @param id
     * @param code
     * @param countryName
     */
    public Country(Long id, String code, String countryName) {
        this.id = id;
        this.code = code;
        this.countryName = countryName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long countryId) {
        this.id = countryId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    @Override
    public String toString() {
        return countryName; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
