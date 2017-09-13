package erp.model;

import erp.entities.Address;
import erp.entities.Contact;
import erp.entities.Country;
import erp.entities.Customer;
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
public class CustomerModel {
    private final DBConnection connection;

    public CustomerModel(){
        connection = new DBConnection();
    }
    
    public List<Customer> getAll() {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Customer> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_custumers()}"
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
                Customer record = new Customer(
                          rs.getLong("CustomerId")
                        , rs.getString("Code")
                        , rs.getString("Name")
                        , rs.getString("Phone1")
                        , rs.getString("Phone2")
                        , new Address(
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
                        )
                        , new Contact(
                              rs.getLong("ContactId")
                            , rs.getString("Suffix")
                            , rs.getString("Title")
                            , rs.getString("FirstName")
                            , rs.getString("MiddleName")
                            , rs.getString("LastName")
                            , rs.getString("Surname")
                            , rs.getString("Email")
                            , rs.getString("WorkPhone")
                            , rs.getString("HomePhone")
                            , rs.getString("MobilPhone")
                        )
                        , rs.getString("Website")
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
    
     public String insert(Customer obj, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_customer( ?,?,?,?,?,?, ?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?, ?,? )}");
            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Phone1_p", obj.getPhone1());
            cstmt.setString("Phone2_p", obj.getPhone2());
            cstmt.setString("Website_p", obj.getWebsite());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setString("Line1_p", obj.getAddress().getLine1());
            cstmt.setString("Line2_p", obj.getAddress().getLine2());
            cstmt.setString("Line3_p", obj.getAddress().getLine3());
            cstmt.setString("ZipCode_p", obj.getAddress().getZipcode());
            cstmt.setString("City_p", obj.getAddress().getCity());
            cstmt.setString("State_p", obj.getAddress().getState());
            cstmt.setLong("CountryId_p", obj.getAddress().getCountry().getCountryId());
            
            cstmt.setString("Suffix_p", obj.getContact().getSuffix());
            cstmt.setString("Title_p", obj.getContact().getTitle());
            cstmt.setString("FirstName_p", obj.getContact().getFirstName());
            cstmt.setString("MiddleName_p", obj.getContact().getMiddleName());
            cstmt.setString("LastName_p", obj.getContact().getLastName());
            cstmt.setString("Surname_p", obj.getContact().getSurname());
            cstmt.setString("Email_p", obj.getContact().getEmail());
            cstmt.setString("WorkPhone_p", obj.getContact().getWorkPhone());
            cstmt.setString("HomePhone_p", obj.getContact().getHomePhone());
            cstmt.setString("MobilPhone_p", obj.getContact().getMobilPhone());
            
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
    
    public String update(Customer obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_customer( ?, ?,?,?,?,?,?, ?, ?,?,?,?,?,?,?, ?, ?,?,?,?,?,?,?,?,?,?, ?,? )}");
            
            cstmt.setLong("CustomerId_p", obj.getCustomerId());

            cstmt.setString("Code_p", obj.getCode());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Phone1_p", obj.getPhone1());
            cstmt.setString("Phone2_p", obj.getPhone2());
            cstmt.setString("Website_p", obj.getWebsite());
            cstmt.setString("Notes_p", obj.getNotes());
            
            cstmt.setLong("AddressId_p", obj.getAddress().getAddressId());

            cstmt.setString("Line1_p", obj.getAddress().getLine1());
            cstmt.setString("Line2_p", obj.getAddress().getLine2());
            cstmt.setString("Line3_p", obj.getAddress().getLine3());
            cstmt.setString("ZipCode_p", obj.getAddress().getZipcode());
            cstmt.setString("City_p", obj.getAddress().getCity());
            cstmt.setString("State_p", obj.getAddress().getState());
            cstmt.setLong("CountryId_p", obj.getAddress().getCountry().getCountryId());
            
            cstmt.setLong("ContactId_p", obj.getContact().getContactId());
            
            cstmt.setString("Suffix_p", obj.getContact().getSuffix());
            cstmt.setString("Title_p", obj.getContact().getTitle());
            cstmt.setString("FirstName_p", obj.getContact().getFirstName());
            cstmt.setString("MiddleName_p", obj.getContact().getMiddleName());
            cstmt.setString("LastName_p", obj.getContact().getLastName());
            cstmt.setString("Surname_p", obj.getContact().getSurname());
            cstmt.setString("Email_p", obj.getContact().getEmail());
            cstmt.setString("WorkPhone_p", obj.getContact().getWorkPhone());
            cstmt.setString("HomePhone_p", obj.getContact().getHomePhone());
            cstmt.setString("MobilPhone_p", obj.getContact().getMobilPhone());
            
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
    
    public String delete(long customerId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_customer(?,?)}");
            cstmt.setLong("CustomerId_p", customerId);
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
