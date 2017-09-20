/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Master;
import erp.entities.Submaterial;
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
public class SubmaterialModel {
    private final DBConnection connection;
    
    public SubmaterialModel(){
        connection = new DBConnection();
    }

    public List<Submaterial> getAll() {
        CallableStatement cstmt;
        ResultSet rs;
        List<Submaterial> list;
        
        rs = null;
        cstmt = null;
        list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_submaterials()}"
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
                Submaterial record = new Submaterial(
                          rs.getLong("Id")
                        , rs.getBoolean("IsActive")
                        , rs.getString("Code")
                        , rs.getString("Description")
                        , rs.getFloat("Weight")
                        , rs.getFloat("MinStock")
                        , rs.getFloat("MaxStock")
                        , new Master(
                              rs.getLong("UOMId")
                            , rs.getString("UOMCode")
                            , rs.getString("UOM")
                        )
                        , new Master(
                              rs.getLong("CategoryId")
                            , rs.getString("CategoryCode")
                            , rs.getString("Category")
                        )
                        , rs.getString("Notes")
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubmaterialModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubmaterialModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubmaterialModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
     public String insert(Submaterial obj, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_submaterial( ?,?,?,?,?,?,?,?,?,?,? )}");
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setFloat("Weight_p", obj.getWeight());
            cstmt.setFloat("MinStock_p", obj.getMinStock());
            cstmt.setFloat("MaxStock_p", obj.getMaxStock());
            cstmt.setLong("UOMId_p", obj.getUOM().getId());
            cstmt.setLong("CategoryId_p", obj.getCategory().getId());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(SubmaterialModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubmaterialModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Submaterial obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_submaterial( ?,?,?,?,?,?,?,?,?,?,?,? )}");
            
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setFloat("Weight_p", obj.getWeight());
            cstmt.setFloat("MinStock_p", obj.getMinStock());
            cstmt.setFloat("MaxStock_p", obj.getMaxStock());
            cstmt.setLong("UOMId_p", obj.getUOM().getId());
            cstmt.setLong("CategoryId_p", obj.getCategory().getId());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(SubmaterialModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubmaterialModel.class.getName()).log(
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
                    "{call sperp_delete_submaterial(?,?)}");
            cstmt.setLong("Id_p", customerId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(SubmaterialModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubmaterialModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
