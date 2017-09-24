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
public class Address {
    private Long id;
    private String line1;
    private String line2;
    private String line3;
    private String City;
    private String state;
    private String zipcode;
    private Country country;

    public Address(Long id, String line1, String line2, String line3, String zipcode, String City, String state, Country country) {
        this.id = id;
        this.line1 = line1;
        this.line2 = line2;
        this.line3 = line3;
        this.City = City;
        this.state = state;
        this.zipcode = zipcode;
        this.country = country;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLine1() {
        return line1;
    }

    public void setLine1(String line1) {
        this.line1 = line1;
    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public String getLine3() {
        return line3;
    }

    public void setLine3(String line3) {
        this.line3 = line3;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
 
    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return this.City;
    }
    
}
