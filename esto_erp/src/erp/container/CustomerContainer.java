/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.container;

import erp.controllers.AddressController;
import erp.controllers.ContactController;
import erp.entities.Customer;
import erp.views.AddressView;
import erp.views.ContactView;
import erp.views.CustomerView;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.User;
import security.entities.UserRight;

/**
 *
 * @author lespinoza
 */
public class CustomerContainer extends javax.swing.JInternalFrame implements ListSelectionListener{
    private CustomerView customerView;
    private ContactView contactView;
    private AddressView addressView;
    
    /**
     * Creates new form CustomerView2
     * @param user
     * @param right
     */
    public CustomerContainer(User user, UserRight right) {
        initComponents();
        localInit(user, right);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane2 = new javax.swing.JTabbedPane();
        pnlCustomer = new javax.swing.JPanel();
        pnlAddress = new javax.swing.JPanel();
        pnlContacts = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtCode = new javax.swing.JTextField();
        txtName = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Customers");

        javax.swing.GroupLayout pnlCustomerLayout = new javax.swing.GroupLayout(pnlCustomer);
        pnlCustomer.setLayout(pnlCustomerLayout);
        pnlCustomerLayout.setHorizontalGroup(
            pnlCustomerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 800, Short.MAX_VALUE)
        );
        pnlCustomerLayout.setVerticalGroup(
            pnlCustomerLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 581, Short.MAX_VALUE)
        );

        jTabbedPane2.addTab("Customer", pnlCustomer);

        javax.swing.GroupLayout pnlAddressLayout = new javax.swing.GroupLayout(pnlAddress);
        pnlAddress.setLayout(pnlAddressLayout);
        pnlAddressLayout.setHorizontalGroup(
            pnlAddressLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 800, Short.MAX_VALUE)
        );
        pnlAddressLayout.setVerticalGroup(
            pnlAddressLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 581, Short.MAX_VALUE)
        );

        jTabbedPane2.addTab("Addresses", pnlAddress);

        javax.swing.GroupLayout pnlContactsLayout = new javax.swing.GroupLayout(pnlContacts);
        pnlContacts.setLayout(pnlContactsLayout);
        pnlContactsLayout.setHorizontalGroup(
            pnlContactsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 800, Short.MAX_VALUE)
        );
        pnlContactsLayout.setVerticalGroup(
            pnlContactsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 581, Short.MAX_VALUE)
        );

        jTabbedPane2.addTab("Contacts", pnlContacts);

        jLabel1.setText("Code:");

        txtCode.setEditable(false);

        txtName.setEditable(false);

        jLabel2.setText("Custumer:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTabbedPane2)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtCode, javax.swing.GroupLayout.PREFERRED_SIZE, 86, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtName)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtCode, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTabbedPane2)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTabbedPane jTabbedPane2;
    private javax.swing.JPanel pnlAddress;
    private javax.swing.JPanel pnlContacts;
    private javax.swing.JPanel pnlCustomer;
    private javax.swing.JTextField txtCode;
    private javax.swing.JTextField txtName;
    // End of variables declaration//GEN-END:variables

    private void localInit(User user, UserRight right) {
        this.customerView = new CustomerView(user, right);
        this.pnlCustomer.setLayout(new java.awt.BorderLayout());
        this.pnlCustomer.add(customerView);
        this.pnlCustomer.revalidate();
      
        Customer selectedCustomer;
        selectedCustomer = customerView.getSelectedItem();
        if (selectedCustomer == null){
            txtCode.setText("");
            txtName.setText("");
            this.addressView = new AddressView(user, right, new Long(-1), 0);
            this.contactView = new ContactView(user, right, new Long(-1), 0);
        } else {
            txtCode.setText(selectedCustomer.getCode());
            txtName.setText(selectedCustomer.getName());
            this.addressView = new AddressView(user, right, selectedCustomer.getId(), 0);
            this.contactView = new ContactView(user, right, selectedCustomer.getId(), 0);
        }
        
        this.pnlAddress.setLayout(new java.awt.BorderLayout());
        this.pnlAddress.add(addressView);
        this.pnlAddress.revalidate();
        
        this.pnlContacts.setLayout(new java.awt.BorderLayout());
        this.pnlContacts.add(contactView);
        this.pnlContacts.revalidate();
        
        this.customerView.getController().addSelectionListener(this);
    }
    
    @Override
    public void valueChanged(ListSelectionEvent lse) {
        Customer selectedCustomer = customerView.getSelectedItem();
        
        AddressController addressController;
        addressController = addressView.getController();
        
        ContactController contactController;
        contactController = contactView.getController();
        
        if (selectedCustomer == null) {
            txtCode.setText("");
            txtName.setText("");
            addressController.setItem(new Long(-1));
            contactController.setItem(new Long(-1));
        } else {
            txtCode.setText(selectedCustomer.getCode());
            txtName.setText(selectedCustomer.getName());
            addressController.setItem(selectedCustomer.getId());
            contactController.setItem(selectedCustomer.getId());
        }
        addressController.loadData();
        contactController.loadData();
    }
}
