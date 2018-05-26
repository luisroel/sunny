/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.views;

import erp.controllers.DocumentController;
import erp.models.MasterComboBoxModel;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.ListSelectionModel;
import security.entities.User;
import security.entities.UserRight;
import utils.ImageComponent;

/**
 *
 * @author lespinoza
 */
public class DocumentView extends javax.swing.JPanel {
    private DocumentController controller;
    private ImageComponent imageComponent;
    
    /**
     * Creates new form DocumentView
     * @param user
     * @param right
     */
    public DocumentView(User user, UserRight right, Long keyItem, int type) {
        initComponents();
        initLocal(user, right, keyItem, type);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        lstDoctos = new javax.swing.JList<>();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtNotes = new javax.swing.JTextArea();
        cmbDoctoName = new javax.swing.JComboBox<>();
        btnNew = new javax.swing.JButton();
        btnEdit = new javax.swing.JButton();
        btnDelete = new javax.swing.JButton();
        txtId = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtDescription = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        pnlPreview = new javax.swing.JPanel();
        pnlImage = new javax.swing.JPanel();
        btnLoad = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JSeparator();

        lstDoctos.setModel(new javax.swing.AbstractListModel<String>() {
            String[] strings = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" };
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        jScrollPane1.setViewportView(lstDoctos);

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel1.setText("Code:");

        txtNotes.setColumns(20);
        txtNotes.setRows(5);
        jScrollPane2.setViewportView(txtNotes);

        cmbDoctoName.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        btnNew.setText("New");

        btnEdit.setText("Edit");

        btnDelete.setText("Delete");

        txtId.setEditable(false);
        txtId.setEnabled(false);

        jLabel3.setText("Id:");

        txtDescription.setEditable(false);

        jLabel2.setText("Document:");

        pnlPreview.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        javax.swing.GroupLayout pnlImageLayout = new javax.swing.GroupLayout(pnlImage);
        pnlImage.setLayout(pnlImageLayout);
        pnlImageLayout.setHorizontalGroup(
            pnlImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 335, Short.MAX_VALUE)
        );
        pnlImageLayout.setVerticalGroup(
            pnlImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout pnlPreviewLayout = new javax.swing.GroupLayout(pnlPreview);
        pnlPreview.setLayout(pnlPreviewLayout);
        pnlPreviewLayout.setHorizontalGroup(
            pnlPreviewLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnlPreviewLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(pnlImage, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(125, 125, 125))
        );
        pnlPreviewLayout.setVerticalGroup(
            pnlPreviewLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlPreviewLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(pnlImage, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        btnLoad.setText("Load Image");

        jSeparator1.setOrientation(javax.swing.SwingConstants.VERTICAL);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(pnlPreview, javax.swing.GroupLayout.PREFERRED_SIZE, 361, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnLoad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(jLabel1)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(cmbDoctoName, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addComponent(txtDescription, javax.swing.GroupLayout.PREFERRED_SIZE, 304, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 392, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(8, 8, 8)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnDelete, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btnEdit, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btnNew, javax.swing.GroupLayout.Alignment.TRAILING))))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {btnDelete, btnEdit, btnNew});

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {jLabel2, jLabel3});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cmbDoctoName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnNew)
                            .addComponent(jLabel1)
                            .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3))
                        .addGap(12, 12, 12)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtDescription, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2)
                            .addComponent(btnEdit))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnDelete, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 62, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jSeparator1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(pnlPreview, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnLoad))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 434, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {cmbDoctoName, jLabel1, jLabel2, jLabel3, txtDescription, txtId});

        layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {btnDelete, btnEdit, btnNew});

    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnEdit;
    private javax.swing.JButton btnLoad;
    private javax.swing.JButton btnNew;
    private javax.swing.JComboBox<String> cmbDoctoName;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JList<String> lstDoctos;
    private javax.swing.JPanel pnlImage;
    private javax.swing.JPanel pnlPreview;
    private javax.swing.JTextField txtDescription;
    private javax.swing.JTextField txtId;
    private javax.swing.JTextArea txtNotes;
    // End of variables declaration//GEN-END:variables

    private void initLocal(User user, UserRight right, Long keyItem, int type){
        controller = new DocumentController(this, user, right, keyItem, type);
        
        btnNew.setActionCommand("New");
        btnNew.addActionListener(this.controller);
        btnEdit.setActionCommand("Edit");
        btnEdit.addActionListener(this.controller);
        btnDelete.setActionCommand("Delete");
        btnDelete.addActionListener(this.controller);

        btnLoad.setActionCommand("Load");
        btnLoad.addActionListener(controller);
        
        lstDoctos.getSelectionModel().addListSelectionListener(controller);
        lstDoctos.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        cmbDoctoName.setModel(new MasterComboBoxModel(3));
        txtNotes.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtNotes.getText().length() >= 255 ) // limit to 20 characters
                    e.consume();
            }
        });
        
        imageComponent = new ImageComponent(controller.getImagePath());
        pnlImage.setLayout(new java.awt.BorderLayout());
        pnlImage.add(imageComponent);
        pnlImage.revalidate();
        
        setNormalScenario();
        controller.loadData();
    }

    public void setNormalScenario(){       
        lstDoctos.setEnabled(true);
        cmbDoctoName.setEnabled(false);
        txtNotes.setEnabled(false);
        // btnLoad.setEnabled(false);
        
        btnNew.setEnabled(controller.getRight().getIsCreated());
        if (lstDoctos.getModel().getSize() > 0){
            btnEdit.setEnabled(controller.getRight().getIsUpdated());
            btnDelete.setEnabled(controller.getRight().getIsDeleted());
        } else {
            btnEdit.setEnabled(false);
            btnDelete.setEnabled(false);
        }
        
        btnNew.setText("New");
        btnEdit.setText("Edit");
        
        controller.setViewState(0);
    }
    
    public void setNewScenario(){
        lstDoctos.setEnabled(false);
        cmbDoctoName.setEnabled(true);
        txtNotes.setEnabled(true);
        
        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        clearFields();
        
        controller.setViewState(1);
    }
    
    private void setEditScenario(){
        lstDoctos.setEnabled(false);
        cmbDoctoName.setEnabled(true);
        txtNotes.setEnabled(true);

        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        controller.setViewState(2);
    }
    
    public void clearFields(){
        cmbDoctoName.setSelectedIndex(-1);
        txtNotes.setText("");
    }
    
    public void loadDetail(){
        if (lstDoctos.getSelectedIndex() != -1){
            
        }
    }
    
    public void updateRow(){
        
    }
    
    public void setCmbDoctoName(){
        
    }
    
    public JList getList(){
        return this.lstDoctos;
    }
    
    public Long getId(){
        return Long.parseLong(txtId.getText());
    }
    
    public JComboBox getDoctoName(){
        return cmbDoctoName;
    }
    
    public String getNotes(){
        return txtNotes.getText();
    }

    public ImageComponent getImage(){
        return imageComponent;
    }
    
    public JPanel getImagePanel(){
        return pnlImage;
    }
    
    public JButton getBtnEdit(){
        return btnEdit;
    }
    
    public JButton getBtnDelete(){
        return btnDelete;
    }

    public DocumentController getController(){
        return this.controller;
    }
}