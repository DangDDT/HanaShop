/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.account;

import java.io.Serializable;

/**
 *
 * @author Tam Dang
 */
public class AccountDTO implements Serializable{
    private String userID;
    private String password;
    private boolean isAdmin;
    private String name;

    public AccountDTO() {
    }
    
    public AccountDTO(String userID, String password, boolean isAdmin, String name) {
        this.userID = userID;
        this.password = password;
        this.isAdmin = isAdmin;
        this.name = name;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
