package model.Entitys;
// Generated 22-06-2014 12:47:50 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private long userId;
     private String username;
     private String password;
     private boolean enabled;
     private Set userRoleses = new HashSet(0);
     private Set apoderados = new HashSet(0);
     private String[] roles;

    public Users() {
    }

    public String[] getRoles() {
        return roles;
    }

    public void setRoles(String[] roles) {
        this.roles = roles;
    }

	
    public Users(long userId, String username, String password, boolean enabled) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.enabled = enabled;
    }
    public Users(long userId, String username, String password, boolean enabled, Set userRoleses) {
       this.userId = userId;
       this.username = username;
       this.password = password;
       this.enabled = enabled;
       this.userRoleses = userRoleses;
    }

    public Set getApoderados() {
        return apoderados;
    }

    public void setApoderados(Set apoderados) {
        this.apoderados = apoderados;
    }
   
    
    
    public long getUserId() {
        return this.userId;
    }
    
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isEnabled() {
        return this.enabled;
    }
    
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    public Set getUserRoleses() {
        return this.userRoleses;
    }
    
    public void setUserRoleses(Set userRoleses) {
        this.userRoleses = userRoleses;
    }




}


