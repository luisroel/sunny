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
    private Long countryId;
    private String code;
    private String countryName;

    /**
     *
     * @param countryId
     * @param code
     * @param countryName
     */
    public Country(Long countryId, String code, String countryName) {
        this.countryId = countryId;
        this.code = code;
        this.countryName = countryName;
    }

    public Long getCountryId() {
        return countryId;
    }

    public void setCountryId(Long countryId) {
        this.countryId = countryId;
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
