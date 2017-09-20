package erp.models;

import erp.entities.Master;
import erp.entities.Quotation;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.database.DBConnection;
import security.models.MenuModel;

/**
 *
 * @author lespinoza
 */
public class QuotationModel {
    private final DBConnection connection;

    public QuotationModel(){
        connection = new DBConnection();
    }
    
    public List<Quotation> getAll(Long itemKey, Long subItemKey) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Quotation> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_quotations(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("ProviderId_p", itemKey);
            cstmt.setLong("SubmaterialId_p", subItemKey);
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
                Quotation record = new Quotation(
                          rs.getLong("Id")
                        , new Master(rs.getLong("CategoryId"), rs.getString("CategoryCode"), rs.getString("CategoryDescription"))
                        , new Master(rs.getLong("SubmaterialId"), rs.getString("SubmaterialCode"), rs.getString("SubmaterialDescription"))
                        , rs.getString("ProviderCode")
                        , rs.getInt("LeadTime")
                        , rs.getFloat("AdditionalCost")
                        , rs.getTimestamp("From")
                        , rs.getTimestamp("To")
                        , rs.getString("Notes")
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(MenuModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Master> getList(Long itemKey) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Master> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_quotation_submaterial(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("ProviderId_p", itemKey);
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
                Master record = new Master(
                          rs.getLong("Id")
                        , rs.getString("Code")
                        , rs.getString("Description")
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(MenuModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
     public String insert(Quotation obj, Long itemKey, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_quotation( ?,?, ?,?, ?,?, ?,?, ?,? )}");
            cstmt.setLong("ProviderId_p", itemKey);
            cstmt.setLong("SubmaterialId_p", obj.getCode().getId());
            cstmt.setString("ProviderCode_p", obj.getProviderCode());
            cstmt.setInt("LeadTime_p", obj.getLeadTime());
            cstmt.setFloat("AdditionalCost_p", obj.getAdditionalCost());
            cstmt.setTimestamp("From_p", obj.getFrom());
            cstmt.setTimestamp("To_p", obj.getTo());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(MenuModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Quotation obj, Long itemKey, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_quotation( ?,? ,?,? ,?,? ,?,? ,?,? ,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setLong("ProviderId_p", itemKey);
            cstmt.setLong("SubmaterialId_p", obj.getCode().getId());
            cstmt.setString("ProviderCode_p", obj.getProviderCode());
            cstmt.setInt("LeadTime_p", obj.getLeadTime());
            cstmt.setFloat("AdditionalCost_p", obj.getAdditionalCost());
            cstmt.setTimestamp("From_p", obj.getFrom());
            cstmt.setTimestamp("To_p", obj.getTo());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(MenuModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String delete(long Id){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_quotation(?,?)}");
            cstmt.setLong("Id_p", Id);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(MenuModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MenuModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
