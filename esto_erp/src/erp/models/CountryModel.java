/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package erp.models;

import erp.entities.Country;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lespinoza
 */
public class CountryModel {
   
    public CountryModel() {
    }
    
    public List<Country> getList(){
        List<Country> list = new ArrayList<>();
        list.add(new Country(new Long(1),"MEX", "MEXICO"));
        list.add(new Country(new Long(1),"USA", "EUAA"));
        return list;
    }
    
}
