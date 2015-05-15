package model.entities;
// Generated 14-may-2015 17:53:52 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Roles generated by hbm2java
 */
public class Roles  implements java.io.Serializable {


     private Integer roleid;
     private String descripcion;
     private Set encuestadors = new HashSet(0);

    public Roles() {
    }

	
    public Roles(Integer roleid, String descripcion) {
        this.roleid = roleid;
        this.descripcion = descripcion;
    }
    public Roles(Integer roleid, String descripcion, Set encuestadors) {
       this.roleid = roleid;
       this.descripcion = descripcion;
       this.encuestadors = encuestadors;
    }
   
    public Integer getRoleid() {
        return this.roleid;
    }
    
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set getEncuestadors() {
        return this.encuestadors;
    }
    
    public void setEncuestadors(Set encuestadors) {
        this.encuestadors = encuestadors;
    }




}


