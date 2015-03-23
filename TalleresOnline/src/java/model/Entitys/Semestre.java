package model.Entitys;
// Generated 07-07-2014 01:00:13 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Semestre generated by hbm2java
 */
public class Semestre  implements java.io.Serializable {


     private Integer idsemestre;
     private Institucion institucion;
     private int periodo;
     private int anoPeriodo;
     private int activo;
     private Set<Taller> talleres = new HashSet<Taller>(0);
 

    public Semestre() {
    }

    public Set<Taller> getTalleres() {
        return talleres;
    }

    public void setTalleres(Set<Taller> talleres) {
        this.talleres = talleres;
    }

	
    public Semestre(Institucion institucion, int periodo, int anoPeriodo, int activo) {
        this.institucion = institucion;
        this.periodo = periodo;
        this.anoPeriodo = anoPeriodo;
        this.activo = activo;
    }
  
   
    public Integer getIdsemestre() {
        return this.idsemestre;
    }
    
    public void setIdsemestre(Integer idsemestre) {
        this.idsemestre = idsemestre;
    }
    public Institucion getInstitucion() {
        return this.institucion;
    }
    
    public void setInstitucion(Institucion institucion) {
        this.institucion = institucion;
    }
    public int getPeriodo() {
        return this.periodo;
    }
    
    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }
    public int getAnoPeriodo() {
        return this.anoPeriodo;
    }
    
    public void setAnoPeriodo(int anoPeriodo) {
        this.anoPeriodo = anoPeriodo;
    }
    public int getActivo() {
        return this.activo;
    }
    
    public void setActivo(int activo) {
        this.activo = activo;
    }
   




}

