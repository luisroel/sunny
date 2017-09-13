package erp.model;


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
import security.models.MenuModel;

/**
 *
 * @author lespinoza
 */
public class AddressModel {
    private final DBConnection connection;
    private Long parentId;
    
    public AddressModel(){
        this.connection = new DBConnection();
        this.parentId = new Long(-1);
    }

    public void setParentId(Long parentId){
        this.parentId = parentId;
    }
    
    public List<Address> getCustomerAddresses(){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Address> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_customer_addresses(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("CustomerId_p",parentId);
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
                      rs.getLong("AddressId")
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
    
    public String insertCustomerAddress(Address obj, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_customer_address( ?, ?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("CustomerId_p", parentId);
            cstmt.setString("Line1_p", obj.getLine1());
            cstmt.setString("Line2_p", obj.getLine2());
            cstmt.setString("Line3_p", obj.getLine3());
            cstmt.setString("ZipCode_p", obj.getZipcode());
            cstmt.setString("City_p", obj.getCity());
            cstmt.setString("State_p", obj.getState());
            cstmt.setLong("CountryId_p", obj.getCountry().getCountryId());
            
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
    
    public String updateAddress(Address obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_address( ?, ?,?,?,?,?,?,?, ?,? )}");
            
            cstmt.setLong("AddressId_p", obj.getAddressId());
            
            cstmt.setString("Line1_p", obj.getLine1());
            cstmt.setString("Line2_p", obj.getLine2());
            cstmt.setString("Line3_p", obj.getLine3());
            cstmt.setString("ZipCode_p", obj.getZipcode());
            cstmt.setString("City_p", obj.getCity());
            cstmt.setString("State_p", obj.getState());
            cstmt.setLong("CountryId_p", obj.getCountry().getCountryId());
            
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
    
    public String deleteCustomerAddress(long addressId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_customer_address(?,?,?)}");
            cstmt.setLong("AddressId_p", addressId);
            cstmt.setLong("CustomerId_p", parentId);
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
    
    public List<Address> getProviderAddresses(){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Address> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_provider_addresses(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("ProviderId_p",parentId);
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
                      rs.getLong("AddressId")
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
    
    public String insertProviderAddress(Address obj, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_provider_address( ?, ?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("ProviderId_p", parentId);
            cstmt.setString("Line1_p", obj.getLine1());
            cstmt.setString("Line2_p", obj.getLine2());
            cstmt.setString("Line3_p", obj.getLine3());
            cstmt.setString("ZipCode_p", obj.getZipcode());
            cstmt.setString("City_p", obj.getCity());
            cstmt.setString("State_p", obj.getState());
            cstmt.setLong("CountryId_p", obj.getCountry().getCountryId());
            
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
    
    public String deleteProviderAddress(long addressId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_provider_address(?,?,?)}");
            cstmt.setLong("AddressId_p", addressId);
            cstmt.setLong("ProviderId_p", parentId);
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
