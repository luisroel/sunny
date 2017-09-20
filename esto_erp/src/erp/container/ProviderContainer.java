/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.container;

import erp.controllers.AddressController;
import erp.controllers.ContactController;
import erp.entities.Provider;
import erp.views.AddressView;
import erp.views.ContactView;
import erp.views.ProviderView;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.User;
import security.entities.UserRight;

/**
 *
 * @author lespinoza
 */
public class ProviderContainer extends javax.swing.JInternalFrame implements ListSelectionListener{
    private ProviderView providerView;
    private ContactView contactView;
    private AddressView addressView;
    private QuotationContainer quotesView;
    
    /**
     * Creates new form CustomerView2
     * @param user
     * @param right
     */
    public ProviderContainer(User user, UserRight right) {
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
        pnlQuotes = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtCode = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtName = new javax.swing.JTextField();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Providers");

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

        jTabbedPane2.addTab("Providers", pnlCustomer);

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

        javax.swing.GroupLayout pnlQuotesLayout = new javax.swing.GroupLayout(pnlQuotes);
        pnlQuotes.setLayout(pnlQuotesLayout);
        pnlQuotesLayout.setHorizontalGroup(
            pnlQuotesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 800, Short.MAX_VALUE)
        );
        pnlQuotesLayout.setVerticalGroup(
            pnlQuotesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 581, Short.MAX_VALUE)
        );

        jTabbedPane2.addTab("Quotes", pnlQuotes);

        jLabel1.setText("Code:");

        txtCode.setEditable(false);

        jLabel2.setText("Provider:");

        txtName.setEditable(false);

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
                .addComponent(jTabbedPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 608, Short.MAX_VALUE)
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
    private javax.swing.JPanel pnlQuotes;
    private javax.swing.JTextField txtCode;
    private javax.swing.JTextField txtName;
    // End of variables declaration//GEN-END:variables

    private void localInit(User user, UserRight right) {
        this.providerView = new ProviderView(user, right);
        this.pnlCustomer.setLayout(new java.awt.BorderLayout());
        this.pnlCustomer.add(providerView);
        this.pnlCustomer.revalidate();
      
        Provider selectedProvider;
        selectedProvider = providerView.getSelectedItem();
        if (selectedProvider == null ){
            txtCode.setText("");
            txtName.setText("");
            
            this.addressView = new AddressView(user, right, new Long(-1), 1);
            this.contactView = new ContactView(user, right, new Long(-1), 1);
            this.quotesView = new QuotationContainer(user, right, new Long(-1));
        } else {
            txtCode.setText(selectedProvider.getCode());
            txtName.setText(selectedProvider.getName());
            
            this.addressView = new AddressView(user, right, selectedProvider.getId(), 1);
            this.contactView = new ContactView(user, right, selectedProvider.getId() ,1);
            this.quotesView = new QuotationContainer(user, right, selectedProvider.getId());
        }
        
        this.pnlAddress.setLayout(new java.awt.BorderLayout());
        this.pnlAddress.add(addressView);
        this.pnlAddress.revalidate();
        
        this.pnlContacts.setLayout(new java.awt.BorderLayout());
        this.pnlContacts.add(contactView);
        this.pnlContacts.revalidate();
        
        this.pnlQuotes.setLayout(new java.awt.BorderLayout());
        this.pnlQuotes.add(quotesView);
        this.pnlQuotes.revalidate();

        this.providerView.getController().addSelectionListener(this);
    }
    
    @Override
    public void valueChanged(ListSelectionEvent lse) {
        
        Provider selectedProvider;
        selectedProvider = providerView.getSelectedItem();
        
        AddressController addressController;
        addressController = addressView.getController();

        ContactController contactController;
        contactController = contactView.getController();
        
        if (selectedProvider == null) {
            txtCode.setText("");
            txtName.setText("");
            
            addressController.setItem(new Long(-1));
            contactController.setItem(new Long(-1));
            quotesView.loadData(new Long(-1));          // TODO: change this container
        } else {
            txtCode.setText(selectedProvider.getCode());
            txtName.setText(selectedProvider.getName());
            
            addressController.setItem(selectedProvider.getId());
            contactController.setItem(selectedProvider.getId());
            quotesView.loadData(selectedProvider.getId());  // TODO: change this container
        }
        
        addressController.loadData();
        contactController.loadData();
    }
}
