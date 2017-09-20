/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import erp.entities.Product;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.database.DBConnection;

/**
 *
 * @author lespinoza
 */
public class ProductModel {
    private final DBConnection connection;
    
    public ProductModel(){
        connection = new DBConnection();
    }
    
   
    public List<Product> getAll() {
        CallableStatement cstmt;
        ResultSet rs;
        List<Product> list;
        
        rs = null;
        cstmt = null;
        list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_products()}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                Product record = new Product(
                          rs.getLong("Id")
                        , rs.getBoolean("IsActive")
                        , rs.getString("Code")
                        , rs.getString("Description")
                        , new Master(
                              rs.getLong("CategoryId")
                            , rs.getString("CategoryCode")
                            , rs.getString("Category")
                        )
                        , rs.getFloat("Weight")
                        , rs.getString("Color")
                        , rs.getFloat("Width")
                        , rs.getFloat("Height")
                        , rs.getFloat("Large")
                        , rs.getFloat("MinStock")
                        , rs.getFloat("MaxStock")
                        , rs.getString("Notes")
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
     public String insert(Product obj, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_product( ?,?,?,?,?,?,?,?,?,?,?,?,?,? )}");
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setLong("CategoryId_p", obj.getCategory().getId());
            cstmt.setFloat("Weight_p", obj.getWeight());
            cstmt.setString("Color_p", obj.getColor());
            cstmt.setFloat("Width_p", obj.getWidth());
            cstmt.setFloat("Height_p", obj.getHeight());
            cstmt.setFloat("Large_p", obj.getLarge());
            cstmt.setFloat("MinStock_p", obj.getMinStock());
            cstmt.setFloat("MaxStock_p", obj.getMaxStock());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(ProductModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Product obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_product( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setLong("CategoryId_p", obj.getCategory().getId());
            cstmt.setFloat("Weight_p", obj.getWeight());
            cstmt.setString("Color_p", obj.getColor());
            cstmt.setFloat("Width_p", obj.getWidth());
            cstmt.setFloat("Height_p", obj.getHeight());
            cstmt.setFloat("Large_p", obj.getLarge());
            cstmt.setFloat("MinStock_p", obj.getMinStock());
            cstmt.setFloat("MaxStock_p", obj.getMaxStock());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(ProductModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String delete(long customerId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_product(?,?)}");
            cstmt.setLong("Id_p", customerId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(ProductModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
