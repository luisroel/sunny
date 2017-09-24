/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.entities;

import java.sql.Timestamp;

/**
 *
 * @author lespinoza
 */
public class Quotation {
    private Long id;
    private Master category;
    private Master code;
    private String providerCode;
    private Integer leadTime;
    private Float additionalCost;
    private Timestamp from;
    private Timestamp to;
    private String notes;

    public Quotation(Long id, Master category, Master code, String providerCode, Integer leadTime, Float additionalCost, Timestamp from, Timestamp to, String notes) {
        this.id = id;
        this.category = category;
        this.code = code;
        this.providerCode = providerCode;
        this.leadTime = leadTime;
        this.additionalCost = additionalCost;
        this.from = from;
        this.to = to;
        this.notes = notes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Master getCategory() {
        return category;
    }

    public void setCategory(Master category) {
        this.category = category;
    }

    public Master getCode() {
        return code;
    }

    public void setCode(Master code) {
        this.code = code;
    }

    public String getProviderCode() {
        return providerCode;
    }

    public void setProviderCode(String providerCode) {
        this.providerCode = providerCode;
    }

    public int getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(Integer leadTime) {
        this.leadTime = leadTime;
    }

    public Float getAdditionalCost() {
        return additionalCost;
    }

    public void setAdditionalCost(Float additionalCost) {
        this.additionalCost = additionalCost;
    }

    public Timestamp getFrom() {
        return from;
    }

    public void setFrom(Timestamp from) {
        this.from = from;
    }

    public Timestamp getTo() {
        return to;
    }

    public void setTo(Timestamp to) {
        this.to = to;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
