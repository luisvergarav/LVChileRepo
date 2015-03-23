/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Entitys.Diasseccion;

/**
 *
 * @author Luis
 */
public class DiasSeccionForm {
    private Set<Diasseccion> listadias;

    DiasSeccionForm(){
        this.listadias = new HashSet(5);
    }
    public Set<Diasseccion> getListadias() {
        return listadias;
    }

    public void setListadias(Set<Diasseccion> listadias) {
        this.listadias = listadias;
    }
    
    
    
}
