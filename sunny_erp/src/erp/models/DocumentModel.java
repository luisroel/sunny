package erp.models;

import erp.entities.Document;
import erp.entities.Master;
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
public class DocumentModel {
    private final DBConnection connection;

    public DocumentModel(){
        this.connection = new DBConnection();
    }
        
    public List<Document> getList(int type, Long keyItem){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Document> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call sperp_get_documents(?,?)}"
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
                Document record;
                record = new Document(
                        rs.getLong("Id")
                        , new Master(rs.getLong("DoctoId"), rs.getString("Code"), rs.getString("Description"))
                        , rs.getString("Notes")
                        , rs.getBlob("Image")
                );
                list.add(record);
            }
        } catch (Exception ex) {
            Logger.getLogger(DocumentModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DocumentModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DocumentModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Document obj, int type, Long keyItem, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_insert_document( ?,?,?,?,?, ?,? )}");
            cstmt.setLong("Type_p", type);
            cstmt.setLong("Id_p", keyItem);
            cstmt.setLong("DoctoId_p", obj.getDocto().getId());
            cstmt.setString("Notes_p", obj.getNotes());
            cstmt.setBlob("Image_p", obj.getImage());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DocumentModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DocumentModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Document obj, long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_update_document( ?,?,?,?,?,? )}");
            cstmt.setLong("Id_p", obj.getId());
            cstmt.setLong("DoctoId_p", obj.getDocto().getId());
            cstmt.setString("Notes_p", obj.getNotes());
            cstmt.setBlob("Image_p", obj.getImage());
            
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DocumentModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DocumentModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String delete(int type, Long Id, Long keyItem){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call sperp_delete_contact(?,?,?,?)}");
            cstmt.setInt("Type_p", type);
            cstmt.setLong("DoctoId_p", Id);
            cstmt.setLong("Id_p", keyItem);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DocumentModel.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DocumentModel.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
