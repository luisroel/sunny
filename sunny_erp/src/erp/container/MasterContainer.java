/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.container;

import erp.views.MasterView;
import security.entities.User;
import security.entities.UserRight;

/**
 *
 * @author lespinoza
 */
public class MasterContainer extends javax.swing.JInternalFrame {
    private MasterView productCategoriesView;
    private MasterView submaterialCategoriesView;
    private MasterView measurementUnitsView;
    
    /**
     * Creates new form CustomerView2
     * @param user
     * @param right
     */
    public MasterContainer(User user, UserRight right) {
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

        jTabbedPane1 = new javax.swing.JTabbedPane();
        pnlProducts = new javax.swing.JPanel();
        pnlSubmaterials = new javax.swing.JPanel();
        pnlMeasurementUnits = new javax.swing.JPanel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Categories");

        jTabbedPane1.setBorder(javax.swing.BorderFactory.createTitledBorder(""));

        javax.swing.GroupLayout pnlProductsLayout = new javax.swing.GroupLayout(pnlProducts);
        pnlProducts.setLayout(pnlProductsLayout);
        pnlProductsLayout.setHorizontalGroup(
            pnlProductsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 572, Short.MAX_VALUE)
        );
        pnlProductsLayout.setVerticalGroup(
            pnlProductsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 453, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Product Categories", pnlProducts);

        javax.swing.GroupLayout pnlSubmaterialsLayout = new javax.swing.GroupLayout(pnlSubmaterials);
        pnlSubmaterials.setLayout(pnlSubmaterialsLayout);
        pnlSubmaterialsLayout.setHorizontalGroup(
            pnlSubmaterialsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 572, Short.MAX_VALUE)
        );
        pnlSubmaterialsLayout.setVerticalGroup(
            pnlSubmaterialsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 453, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Submaterial Categories", pnlSubmaterials);

        javax.swing.GroupLayout pnlMeasurementUnitsLayout = new javax.swing.GroupLayout(pnlMeasurementUnits);
        pnlMeasurementUnits.setLayout(pnlMeasurementUnitsLayout);
        pnlMeasurementUnitsLayout.setHorizontalGroup(
            pnlMeasurementUnitsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 572, Short.MAX_VALUE)
        );
        pnlMeasurementUnitsLayout.setVerticalGroup(
            pnlMeasurementUnitsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 453, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Measurement Units", pnlMeasurementUnits);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 579, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JPanel pnlMeasurementUnits;
    private javax.swing.JPanel pnlProducts;
    private javax.swing.JPanel pnlSubmaterials;
    // End of variables declaration//GEN-END:variables

    private void localInit(User user, UserRight right) {
                
       this.productCategoriesView = new MasterView(user, right, 0);         // products categories
       this.pnlProducts.setLayout(new java.awt.BorderLayout());
       this.pnlProducts.add(productCategoriesView);
       this.pnlProducts.revalidate();
       this.submaterialCategoriesView = new MasterView(user, right, 1);     // submaterial categories
       this.pnlSubmaterials.setLayout(new java.awt.BorderLayout());
       this.pnlSubmaterials.add(submaterialCategoriesView);
       this.pnlSubmaterials.revalidate();
       this.measurementUnitsView = new MasterView(user, right, 2);          // measurement units
       this.pnlMeasurementUnits.setLayout(new java.awt.BorderLayout());
       this.pnlMeasurementUnits.add(measurementUnitsView);
       this.pnlMeasurementUnits.revalidate();
       
    }
}