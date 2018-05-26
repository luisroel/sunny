/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.controllers;

import erp.models.DocumentModel;
import erp.views.DocumentView;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.filechooser.FileFilter;
import security.entities.User;
import security.entities.UserRight;

/**
 *
 * @author lespinoza
 */
public class DocumentController implements ActionListener, ListSelectionListener{
    private final User user;
    private final UserRight right;
    private final DocumentView view;
    private final DocumentModel model;
    private int viewState;
    private Long keyItem;
    private final int type;
    private String currentDir;
    private String imagePath;
    
    
    public DocumentController(DocumentView view, User user, UserRight right, Long keyItem, int type){
        this.user = user;
        this.right = right;
        this.view = view;
        this.model = new DocumentModel();
        this.keyItem = keyItem;
        this.type = type;
        this.viewState = 0;
        this.currentDir = ".";
        this.imagePath = "../img/sunny.jpeg";
    }
    
    @Override
    public void actionPerformed(ActionEvent ae) {
        switch (ae.getActionCommand()){
            case "Load":
                loadImage();
                break;
            case "New":
                newRecord();
                break;
            case "Edit":
                editRecord();
                break;
            case "Delete":
                deleteRecord();
                break;
            default:
                JOptionPane.showMessageDialog(view, "Action not identified", "Unkown", JOptionPane.ERROR_MESSAGE);
                break;
        }
    }
    
    @Override
    public void valueChanged(ListSelectionEvent lse) {
        view.loadDetail();
    }
    
    private void loadImage() {
        JFileChooser chooser = new JFileChooser(".");
        FileFilter type1 = new ExtensionFilter(null, new String[] {"JPG", "JPEG", "PNG"});
        chooser.addChoosableFileFilter(type1);
        
        chooser.setCurrentDirectory(new java.io.File(currentDir));
        chooser.setDialogTitle("Load Image File");
        chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
        chooser.setAcceptAllFileFilterUsed(false);
        
        if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
            currentDir = chooser.getCurrentDirectory().getAbsolutePath();
            imagePath = chooser.getSelectedFile().getAbsolutePath();
            view.getImage().loadImage(imagePath);
            view.getImagePanel().revalidate();
        }
    }
    
    public void loadData() {
/*        DocumentJListModel listModel;
        listModel = new DocumentJListModel(model.getList(type, keyItem));
        view.getList().setModel(listModel);
        if (listModel.getRowCount() > 0) {
            view.getList().setSelectedIndex(0);
            view.getBtnEdit().setEnabled(right.getIsUpdated());
            view.getBtnDelete().setEnabled(right.getIsDeleted());
        } else {
            view.clearFields();
            view.getBtnEdit().setEnabled(false);
            view.getBtnDelete().setEnabled(false);
         } */
    }

    private void newRecord(){
        JOptionPane.showMessageDialog(view, "Not implemented yet!", "System", JOptionPane.INFORMATION_MESSAGE);
    }
    
    private void editRecord(){
        JOptionPane.showMessageDialog(view, "Not implemented yet!", "System", JOptionPane.INFORMATION_MESSAGE);
    }
    
    private void deleteRecord(){
        JOptionPane.showMessageDialog(view, "Not implemented yet!", "System", JOptionPane.INFORMATION_MESSAGE);
    }
    
    private String validateData(){
        String rsl = "";
        
        return rsl;
    }
    
    private void insertRecord(){
        
    }
    
    private void updateRecord(){
        
    }
    
    public void setItem(Long keyItem) {
        this.keyItem = keyItem;
    }
    
    public void setViewState(int viewState){
        this.viewState = viewState;
    }
    
    public UserRight getRight(){
        return right;
    }
    
    public String getImagePath(){
        return imagePath;
    }
    
    public class ExtensionFilter extends FileFilter {
        private final String description;
        private final String extensions[];
        
        public ExtensionFilter(String description, String extension){
            this.description = description;
            this.extensions = new String[] {extension};
        }
        
        public ExtensionFilter(String description, String[] extensions){
            if (description == null){
                this.description = extensions[0] + "( " + extensions.length + " )";
            } else {
                this.description = description;
            }
            this.extensions = (String[])extensions.clone();
            toLower(this.extensions);
        }
        
        private void toLower(String array[]){
            for (int i=0, n = array.length; i<n; i++){
                array[i] = array[i].toLowerCase();
            }
        }
        
        @Override
        public String getDescription(){
            return this.description;
        }
        
        @Override
        public boolean accept(File file) {
            if (file.isDirectory()){
                return true;
            } else {
                String path = file.getAbsolutePath().toLowerCase();
                for (String ext : extensions) {
                    if (path.endsWith(ext) &&
                            (path.charAt(path.length() - ext.length() - 1)) == '.'){
                        return true;
                    }
                }
            }
            return false;
        }        
    }
}
