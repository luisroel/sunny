package erp.models;


import erp.entities.Address;
import erp.entities.Country;
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
public class AddressModel {
    private final DBConnection connection;
    
    public AddressModel(){
        this.connection = new DBConnection();
    }
    
    public List<Address> getList(int type, Long keyItem){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Address> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_addresses(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("Type_p", type);
            cstmt.setLong("Id_p", keyItem);
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
                Address record = new Address(
                      rs.getLong("Id")
                    , rs.getString("Line1")
                    , rs.getString("Line2")
                    , rs.getString("Line3")
                    , rs.getString("ZipCode")
                    , rs.getString("City")
                    , rs.getString("State")
                    , new Country(
                        rs.getLong("CountryId")
                      , rs.getString("Code")
                      , rs.getString("CountryName")
                    )
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(AddressModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AddressModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AddressModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Address obj, int type, Long keyItem, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_address( ?,?,?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("Type_p", type);
            cstmt.setLong("Id_p", keyItem);
            cstmt.setString("Line1_p", obj.getLine1());
            cstmt.setString("Line2_p", obj.getLine2());
            cstmt.setString("Line3_p", obj.getLine3());
            cstmt.setString("ZipCode_p", obj.getZipcode());
            cstmt.setString("City_p", obj.getCity());
            cstmt.setString("State_p", obj.getState());
            cstmt.setLong("CountryId_p", obj.getCountry().getId());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(AddressModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AddressModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Address obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_address( ?, ?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setString("Line1_p", obj.getLine1());
            cstmt.setString("Line2_p", obj.getLine2());
            cstmt.setString("Line3_p", obj.getLine3());
            cstmt.setString("ZipCode_p", obj.getZipcode());
            cstmt.setString("City_p", obj.getCity());
            cstmt.setString("State_p", obj.getState());
            cstmt.setLong("CountryId_p", obj.getCountry().getId());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(AddressModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AddressModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String delete(int type, Long addressId, Long keyItem){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_address(?,?,?,?)}");
            cstmt.setInt("Type_p", type);
            cstmt.setLong("AddressId_p", addressId);
            cstmt.setLong("Id_p", keyItem);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(AddressModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AddressModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
