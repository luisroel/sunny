/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.model;

import erp.entities.Country;
import java.util.ArrayList;
import java.util.List;
import security.database.DBConnection;

/**
 *
 * @author lespinoza
 */
public class CountryModel {
    
    private final DBConnection connection;

    /**
     *
     */
    public CountryModel() {
        this.connection = new DBConnection();
    }
    
    public List<Country> getList(){
        List<Country> list = new ArrayList<>();
        list.add(new Country(new Long(1),"MEX", "Mexico"));
        list.add(new Country(new Long(1),"USA", "EUAA"));
        return list;
    }
    
}
