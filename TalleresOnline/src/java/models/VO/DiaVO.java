/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models.VO;

import java.util.Date;

/**
 *
 * @author Luis
 */
public class DiaVO {
    private String nombre;  
    private String lugar;
    private Date horaInicio;
    private Date horaFin;

    public DiaVO(String nombre,  String lugar, Date horaInicio, Date horaFin) {
        this.nombre = nombre;
        
        this.lugar = lugar;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
           
            
}
