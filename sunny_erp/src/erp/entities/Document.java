/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.entities;

import java.sql.Blob;

/**
 *
 * @author lespinoza
 */
public class Document {
    private Long id;
    private Master docto;
    private String notes;
    private Blob image;

    public Document(Long id, Master docto, String notes, Blob image) {
        this.id = id;
        this.docto = docto;
        this.notes = notes;
        this.image = image;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Master getDocto() {
        return docto;
    }

    public void setDocto(Master docto) {
        this.docto = docto;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }
}
