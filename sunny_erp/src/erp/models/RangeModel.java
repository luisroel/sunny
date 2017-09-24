package erp.models;

import erp.entities.Range;
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
public class RangeModel {
    private final DBConnection connection;

    public RangeModel(){
        connection = new DBConnection();
    }
    
    public List<Range> getAll(int type, Long itemKey) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Range> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_ranges(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setInt("Type_p", type);
            cstmt.setLong("ItemKey_p", itemKey);
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
                Range record = new Range(
                          rs.getLong("Id")
                        , rs.getFloat("From")
                        , rs.getFloat("To")
                        , rs.getFloat("Amount")
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
    
     public String insert(Range obj, int type, Long itemKey, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_range( ?,?,?,?,?,?,? )}");
            cstmt.setInt("Type_p", type);
            cstmt.setLong("ItemKey_p", itemKey);
            cstmt.setFloat("From_p", obj.getFrom());
            cstmt.setFloat("To_p", obj.getTo());
            cstmt.setFloat("Amount_p", obj.getAmount());
            
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
    
    public String update(Range obj, int type, Long itemKey, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_range( ?,?,?,?,?,?,?,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setInt("Type_p", type);
            cstmt.setLong("ItemKey_p", itemKey);
            cstmt.setFloat("From_p", obj.getFrom());
            cstmt.setFloat("To_p", obj.getTo());
            cstmt.setFloat("Amount_p", obj.getAmount());
            
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
                    "{call sperp_delete_range(?,?)}");
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
