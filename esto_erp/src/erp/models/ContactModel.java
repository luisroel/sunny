package erp.models;

import erp.entities.Contact;
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
public class ContactModel {
    private final DBConnection connection;

    public ContactModel(){
        this.connection = new DBConnection();
    }
        
    public List<Contact> getList(int type, Long keyItem){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Contact> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_contacts(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setInt("Type_p", type);
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
                Contact record = new Contact(
                      rs.getLong("Id")
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
    
    public String insert(Contact obj, int type, Long keyItem, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_contact( ?,?,?,?,?,?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("Type_p", type);
            cstmt.setLong("Id_p", keyItem);
            cstmt.setString("Suffix_p", obj.getSuffix());
            cstmt.setString("Title_p", obj.getTitle());
            cstmt.setString("FirstName_p", obj.getFirstName());
            cstmt.setString("MiddleName_p", obj.getMiddleName());
            cstmt.setString("LastName_p", obj.getLastName());
            cstmt.setString("Surname_p", obj.getSurname());
            cstmt.setString("Email_p", obj.getEmail());
            cstmt.setString("WorkPhone_p", obj.getWorkPhone());
            cstmt.setString("HomePhone_p", obj.getHomePhone());
            cstmt.setString("MobilPhone_p", obj.getMobilPhone());
            
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
    
    public String update(Contact obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_contact( ?, ?,?,?,?,?,?,?,?,?,?, ?,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setString("Suffix_p", obj.getSuffix());
            cstmt.setString("Title_p", obj.getTitle());
            cstmt.setString("FirstName_p", obj.getFirstName());
            cstmt.setString("MiddleName_p", obj.getMiddleName());
            cstmt.setString("LastName_p", obj.getLastName());
            cstmt.setString("Surname_p", obj.getSurname());
            cstmt.setString("Email_p", obj.getEmail());
            cstmt.setString("WorkPhone_p", obj.getWorkPhone());
            cstmt.setString("HomePhone_p", obj.getHomePhone());
            cstmt.setString("MobilPhone_p", obj.getMobilPhone());
            
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
    
    public String delete(int type, Long contactId, Long keyItem){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_contact(?,?,?,?)}");
            cstmt.setInt("Type_p", type);
            cstmt.setLong("ContactId_p", contactId);
            cstmt.setLong("Id_p", keyItem);
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
