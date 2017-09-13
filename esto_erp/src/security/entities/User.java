/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.entities;

/**
 *
 * @author lespinoza
 */
public class User extends AbstractEntity {
     private long userId;
    private String userName;
    private char[] password;
    private boolean isActive;
    private TrackChange track;
    
    public User(long userId, String userName, char[] password, boolean isActive, TrackChange track){
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getUserId(){
        return this.userId;
    }
    
    public String getUsername(){
        return this.userName;
    }
    
    public char[] getPassword(){
        return this.password;
    }
    
    public boolean getIsActive(){
        return this.isActive;
    }
    
    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setUserId(long value){
        this.userId = value;
    }
    
    public void setUsername(String value){
        this.userName = value;
    }

    public void setPassword(char[] value){
        this.password = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }
    
    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.userName;
    }    
}
