/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.swing.JOptionPane;

/**
 *
 * @author luis.espinoza
 */
public class Util {
    public static boolean isNumeric(String str)
    {
      return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
    }
    
    public static String getPasswordMD5(char[] textPassword){
        String passM5 = null;
        try{
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] tmp = String.copyValueOf(textPassword).getBytes();
            md5.update(tmp);
            passM5 = byteArrToString(md5.digest());
        } catch(NoSuchAlgorithmException ex){
            JOptionPane.showMessageDialog(null,
            "Error found when encripting password!", "Error",
            JOptionPane.ERROR_MESSAGE);
        }
        return passM5;
    }
    
    public static String byteArrToString(byte[] b){
       String res;
       StringBuilder sb;
       sb = new StringBuilder(b.length * 2);
       for (int i = 0; i < b.length; i++){
          int j = b[i] & 0xff;
          if (j < 16) {
             sb.append('0');
          }
          sb.append(Integer.toHexString(j));
       }
       res = sb.toString();
       return res.toUpperCase();
    }
}
