/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.views;

import erp.controllers.ProductController;
import erp.entities.Master;
import erp.entities.Product;
import erp.models.MasterComboBoxModel;
import erp.models.ProductTableModel;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.TableModel;
import security.entities.User;
import security.entities.UserRight;

/**
 *
 * @author lespinoza
 */
public class ProductView extends javax.swing.JPanel {
    private ProductController controller;
    
    /**
     * Creates new form ProductView
     * @param user
     * @param right
     */
    public ProductView(User user, UserRight right) {
        initComponents();
        initLocal(user, right);
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
        tblTable = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        btnNew = new javax.swing.JButton();
        btnEdit = new javax.swing.JButton();
        btnDelete = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        txtId = new javax.swing.JTextField();
        txtCode = new javax.swing.JTextField();
        txtDescription = new javax.swing.JTextField();
        txtMinStock = new javax.swing.JTextField();
        txtWeight = new javax.swing.JTextField();
        txtMaxStock = new javax.swing.JTextField();
        cmbCategory = new javax.swing.JComboBox();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtNotes = new javax.swing.JTextArea();
        chkIsActive = new javax.swing.JCheckBox();
        jLabel2 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txtWidth = new javax.swing.JTextField();
        txtHeight = new javax.swing.JTextField();
        txtLarge = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txtColor = new javax.swing.JTextField();

        jScrollPane1.setAutoscrolls(true);

        tblTable.setBorder(javax.swing.BorderFactory.createTitledBorder(""));
        tblTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tblTable.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_OFF);
        jScrollPane1.setViewportView(tblTable);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        btnNew.setText("New");

        btnEdit.setText("Edit");

        btnDelete.setText("Delete");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnNew)
                    .addComponent(btnEdit)
                    .addComponent(btnDelete))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {btnDelete, btnEdit, btnNew});

        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnNew)
                .addGap(18, 18, 18)
                .addComponent(btnEdit)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnDelete)
                .addContainerGap())
        );

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel1.setText("Id:");

        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel3.setText("Code:");

        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel4.setText("Description:");

        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel5.setText("Weight:");

        jLabel6.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel6.setText("Min. Stock:");

        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel7.setText("Max. Stock:");

        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel9.setText("Category:");

        jLabel10.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel10.setText("Notes:");

        txtId.setEnabled(false);

        cmbCategory.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        txtNotes.setColumns(20);
        txtNotes.setRows(5);
        jScrollPane2.setViewportView(txtNotes);

        chkIsActive.setText("Is Active");

        jLabel2.setText("grms");

        jLabel8.setText("W/H/L:");

        jLabel11.setText("Color:");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtWeight, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cmbCategory, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtDescription))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(txtMaxStock, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtMinStock, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel8)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtWidth, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtHeight, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtLarge, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel11)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtColor))))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtCode, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 25, Short.MAX_VALUE)
                        .addComponent(chkIsActive, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        jPanel3Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {jLabel1, jLabel3, jLabel4, jLabel5, jLabel6});

        jPanel3Layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {txtHeight, txtLarge, txtWidth});

        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(chkIsActive)
                    .addComponent(jLabel3)
                    .addComponent(txtCode, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtDescription, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel6)
                        .addComponent(txtMinStock, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel11)
                        .addComponent(txtColor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(txtMaxStock, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8)
                    .addComponent(txtWidth, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtHeight, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtLarge, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel9)
                        .addComponent(cmbCategory, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel5)
                        .addComponent(txtWeight, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel2)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel10)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        jPanel3Layout.linkSize(javax.swing.SwingConstants.VERTICAL, new java.awt.Component[] {chkIsActive, cmbCategory, jLabel1, jLabel11, jLabel2, jLabel3, jLabel4, jLabel5, jLabel6, jLabel7, jLabel8, jLabel9, txtCode, txtColor, txtDescription, txtHeight, txtId, txtLarge, txtMaxStock, txtMinStock, txtWeight, txtWidth});

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnEdit;
    private javax.swing.JButton btnNew;
    private javax.swing.JCheckBox chkIsActive;
    private javax.swing.JComboBox cmbCategory;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblTable;
    private javax.swing.JTextField txtCode;
    private javax.swing.JTextField txtColor;
    private javax.swing.JTextField txtDescription;
    private javax.swing.JTextField txtHeight;
    private javax.swing.JTextField txtId;
    private javax.swing.JTextField txtLarge;
    private javax.swing.JTextField txtMaxStock;
    private javax.swing.JTextField txtMinStock;
    private javax.swing.JTextArea txtNotes;
    private javax.swing.JTextField txtWeight;
    private javax.swing.JTextField txtWidth;
    // End of variables declaration//GEN-END:variables

    private void initLocal(User user, UserRight right){
        controller = new ProductController(this, user, right);

        btnNew.setActionCommand("New");
        btnNew.addActionListener(this.controller);
        btnEdit.setActionCommand("Edit");
        btnEdit.addActionListener(this.controller);
        btnDelete.setActionCommand("Delete");
        btnDelete.addActionListener(this.controller);
        
        tblTable.getSelectionModel().addListSelectionListener(this.controller);
        tblTable.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        cmbCategory.setModel(new MasterComboBoxModel(0));
        
        txtCode.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtCode.getText().length() >= 20 ) // limit to 20 characters
                    e.consume();
            }
        });
        txtDescription.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtDescription.getText().length() >= 100 ) // limit to 100 characters
                    e.consume();
            }
        });
        txtWeight.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtWeight.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtColor.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtColor.getText().length() >= 20 ) // limit to 20 characters
                    e.consume();
            }
        });
        txtWidth.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtWidth.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtHeight.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtHeight.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtLarge.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtLarge.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtMaxStock.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtMaxStock.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtMinStock.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtMinStock.getText().length() >= 7 ) // limit to 7 characters
                    e.consume();
            }
        });
        txtNotes.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (txtNotes.getText().length() >= 255 ) // limit to 255 characters
                    e.consume();
            }
        });

        setNormalScenario();
        controller.loadData();
    }
        
    public void setNormalScenario(){
        tblTable.setEnabled(true);
        chkIsActive.setEnabled(false);
        txtCode.setEnabled(false);
        txtDescription.setEnabled(false);
        txtWeight.setEnabled(false);
        txtColor.setEnabled(false);
        txtWidth.setEnabled(false);
        txtHeight.setEnabled(false);
        txtLarge.setEnabled(false);
        txtMinStock.setEnabled(false);
        txtMaxStock.setEnabled(false);
        cmbCategory.setEnabled(false);
        txtNotes.setEnabled(false);
        
        btnNew.setEnabled(controller.getRight().getIsCreated());
        if (tblTable.getModel().getRowCount() > 0) {
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
        tblTable.setEnabled(false);
        chkIsActive.setEnabled(true);
        txtCode.setEnabled(true);
        txtDescription.setEnabled(true);
        txtWeight.setEnabled(true);
        txtColor.setEnabled(true);
        txtWidth.setEnabled(true);
        txtHeight.setEnabled(true);
        txtLarge.setEnabled(true);
        txtMinStock.setEnabled(true);
        txtMaxStock.setEnabled(true);
        cmbCategory.setEnabled(true);
        txtNotes.setEnabled(true);

        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        
        clearFields();
        
        controller.setViewState(1);
    }
    
    public void setEditScenario(){
        tblTable.setEnabled(false);
        chkIsActive.setEnabled(true);
        txtCode.setEnabled(true);
        txtDescription.setEnabled(true);
        txtWeight.setEnabled(true);
        txtColor.setEnabled(true);
        txtWidth.setEnabled(true);
        txtHeight.setEnabled(true);
        txtLarge.setEnabled(true);
        txtMinStock.setEnabled(true);
        txtMaxStock.setEnabled(true);
        cmbCategory.setEnabled(true);
        txtNotes.setEnabled(true);
        
        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        
        controller.setViewState(2);
    }

    public void clearFields() {
        txtId.setText("");
        chkIsActive.setSelected(true);
        txtCode.setText("");
        txtDescription.setText("");
        txtWeight.setText("");
        txtColor.setText("");
        txtWidth.setText("1");
        txtHeight.setText("1");
        txtLarge.setText("1");
        txtMinStock.setText("1");
        txtMaxStock.setText("1");
        cmbCategory.setSelectedIndex(-1);
        txtNotes.setText("");
    }

    public void loadDetail(){
        if (tblTable.getSelectedRow() != -1){
            int row = tblTable.getSelectedRow();
            TableModel model = tblTable.getModel();
            txtId.setText(((Long)model.getValueAt(row, 0)).toString());
            chkIsActive.setSelected((Boolean)model.getValueAt(row, 1));
            txtCode.setText((String)model.getValueAt(row, 2));
            txtDescription.setText((String)model.getValueAt(row, 3));
            setCmbCategory(((Master)model.getValueAt(row, 4)).getId());
            txtWeight.setText(((Float)model.getValueAt(row, 5)).toString());
            txtColor.setText(((String)model.getValueAt(row, 6)));
            txtWidth.setText(((Float)model.getValueAt(row, 7)).toString());
            txtHeight.setText(((Float)model.getValueAt(row, 8)).toString());
            txtLarge.setText(((Float)model.getValueAt(row, 9)).toString());
            txtMinStock.setText(((Float)model.getValueAt(row, 10)).toString());
            txtMaxStock.setText(((Float)model.getValueAt(row, 11)).toString());
            txtNotes.setText((String)model.getValueAt(row, 12));
        }
    }
    
    public void updateRow(){
        int row = tblTable.getSelectedRow();
        tblTable.setValueAt(new Long(txtId.getText()), row, 0);
        tblTable.setValueAt(chkIsActive.isSelected(), row, 1);
        tblTable.setValueAt(txtCode.getText(), row, 2);
        tblTable.setValueAt(txtDescription.getText(), row, 3);
        tblTable.setValueAt((Master)cmbCategory.getSelectedItem(), row, 4);
        tblTable.setValueAt(new Float(txtWeight.getText()), row, 5);
        tblTable.setValueAt(txtColor.getText(), row, 6);
        tblTable.setValueAt(new Float(txtWidth.getText()), row, 7);
        tblTable.setValueAt(new Float(txtHeight.getText()), row, 8);
        tblTable.setValueAt(new Float(txtLarge.getText()), row, 9);
        tblTable.setValueAt(new Float(txtMinStock.getText()), row, 10);
        tblTable.setValueAt(new Float(txtMaxStock.getText()), row, 11);
        tblTable.setValueAt(txtNotes.getText(), row, 12);
    }

    private void setCmbCategory(Long roleId){
        int index = -1;
        Master obj;
        for (int i=0;i<cmbCategory.getItemCount() && index == -1;i++){
            obj = (Master)cmbCategory.getItemAt(i);
            if (obj.getId().longValue() == roleId){
                index = i;
            }
        }
        cmbCategory.setSelectedIndex(index);
        cmbCategory.repaint();
    }
    
    public JTable getTable(){
        return tblTable;
    }
    
    public Long getId(){
        return Long.parseLong(txtId.getText());
    }
    
    public boolean getIsActive(){
        return chkIsActive.isSelected();
    }
    
    public String getCode(){
        return txtCode.getText();
    }
    
    public String getDescription(){
        return txtDescription.getText();
    }
    
    public String getWeight(){
        return txtWeight.getText();
    }
    
    public String getColor(){
        return txtColor.getText();
    }
    
    public String getWidthP(){
        return txtWidth.getText();
    }

    public String getHeightP(){
        return txtMinStock.getText();
    }

    public String getLargeP(){
        return txtMinStock.getText();
    }

    public String getMinStock(){
        return txtMinStock.getText();
    }
    
    public String getMaxStock(){
        return txtMaxStock.getText();
    }
        
    public JComboBox getCategory(){
        return cmbCategory;
    }
    
    public String getNotes(){
        return txtNotes.getText();
    }
    
    public JButton getBtnEdit(){
        return btnEdit;
    }
    
    public JButton getBtnDelete(){
        return btnDelete;
    }
    
    public Product getSelectedItem(){
        if (tblTable.getSelectedRow() != -1){
            int row = tblTable.getSelectedRow();
            return ((ProductTableModel)tblTable.getModel()).getValue(row);
        } else {
            return null;
        }
    }
    
    public ProductController getController(){
        return this.controller;
    }
}
