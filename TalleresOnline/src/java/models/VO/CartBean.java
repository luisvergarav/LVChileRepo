/*
 * 
 * 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models.VO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import model.Entitys.Taller;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;


public class CartBean implements Serializable
{
   List<Taller> listaTalleres = new ArrayList<Taller>();
   private double totalBolsacompras;

    public double getTotalBolsacompras() {
        return totalBolsacompras;
    }

    public void setTotalBolsacompras(double totalBolsacompras) {
        this.totalBolsacompras = totalBolsacompras;
    }

   
   
   
    public List<Taller> getListaTalleres() {
        return listaTalleres;
    }

    public void addToTalleres(Taller Taller) {
        this.listaTalleres.add(Taller);
    }

   
   
}

