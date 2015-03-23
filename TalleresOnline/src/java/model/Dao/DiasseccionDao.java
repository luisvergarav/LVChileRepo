/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Diasseccion;
import model.Entitys.Seccion;


/**
 *
 * @author Luis
 */
public interface DiasseccionDao {
    
    public void guardarDiasseccion(Diasseccion diasseccion);
    public Diasseccion obtenerPorId(int idDiasseccion);
    public List<Diasseccion> obtenerTodos();
    public void eliminar(Diasseccion diasseccion);
    
}
