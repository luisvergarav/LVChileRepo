package model.entities;
// Generated 14-may-2015 17:53:52 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Evaluacion generated by hbm2java
 */
public class Evaluacion  implements java.io.Serializable {


     private Integer id;
     private Plantilla plantilla;
     private Encuestador encuestador;
     private String item;
     private String cabecera;
     private String mensajeconfirmacion;
     private String piepagina;
     private Set evapreguntases = new HashSet(0);
     private Set tests = new HashSet(0);

    public Evaluacion() {
    }

	
    public Evaluacion(Integer id, Plantilla plantilla, Encuestador encuestador, String item, String cabecera, String mensajeconfirmacion, String piepagina) {
        this.id = id;
        this.plantilla = plantilla;
        this.encuestador = encuestador;
        this.item = item;
        this.cabecera = cabecera;
        this.mensajeconfirmacion = mensajeconfirmacion;
        this.piepagina = piepagina;
    }
    public Evaluacion(Integer id, Plantilla plantilla, Encuestador encuestador, String item, String cabecera, String mensajeconfirmacion, String piepagina, Set evapreguntases, Set tests) {
       this.id = id;
       this.plantilla = plantilla;
       this.encuestador = encuestador;
       this.item = item;
       this.cabecera = cabecera;
       this.mensajeconfirmacion = mensajeconfirmacion;
       this.piepagina = piepagina;
       this.evapreguntases = evapreguntases;
       this.tests = tests;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Plantilla getPlantilla() {
        return this.plantilla;
    }
    
    public void setPlantilla(Plantilla plantilla) {
        this.plantilla = plantilla;
    }
    public Encuestador getEncuestador() {
        return this.encuestador;
    }
    
    public void setEncuestador(Encuestador encuestador) {
        this.encuestador = encuestador;
    }
    public String getItem() {
        return this.item;
    }
    
    public void setItem(String item) {
        this.item = item;
    }
    public String getCabecera() {
        return this.cabecera;
    }
    
    public void setCabecera(String cabecera) {
        this.cabecera = cabecera;
    }
    public String getMensajeconfirmacion() {
        return this.mensajeconfirmacion;
    }
    
    public void setMensajeconfirmacion(String mensajeconfirmacion) {
        this.mensajeconfirmacion = mensajeconfirmacion;
    }
    public String getPiepagina() {
        return this.piepagina;
    }
    
    public void setPiepagina(String piepagina) {
        this.piepagina = piepagina;
    }
    public Set getEvapreguntases() {
        return this.evapreguntases;
    }
    
    public void setEvapreguntases(Set evapreguntases) {
        this.evapreguntases = evapreguntases;
    }
    public Set getTests() {
        return this.tests;
    }
    
    public void setTests(Set tests) {
        this.tests = tests;
    }




}


