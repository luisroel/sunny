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
public class Range {
    private Long id;
    private Float from;
    private Float to;
    private Float amount;

    public Range(Long id, Float from, Float to, Float amount) {
        this.id = id;
        this.from = from;
        this.to = to;
        this.amount = amount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Float getFrom() {
        return from;
    }

    public void setFrom(Float from) {
        this.from = from;
    }

    public Float getTo() {
        return to;
    }

    public void setTo(Float to) {
        this.to = to;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }
    
}
