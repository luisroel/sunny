/*
 *
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *
 */
package erp.entities;

/**
 *
 * @author lespinoza
 */
public class Customer {
    private Long id;
    private String code;
    private String name;
    private String phone1;
    private String phone2;
    private Address address;
    private Contact contact;
    private String web;
    private String notes;

    public Customer(Long id, String code, String name, String phone1, String phone2, Address address, Contact contact, String web, String notes) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.phone1 = phone1;
        this.phone2 = phone2;
        this.contact = contact;
        this.address = address;
        this.web = web;
        this.notes = notes;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getWebsite() {
        return web;
    }

    public void setWebsite(String web) {
        this.web = web;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return this.name;
    }
    
}
