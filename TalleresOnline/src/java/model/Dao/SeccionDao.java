/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Seccion;


/**
 *
 * @author Luis
 */
public interface SeccionDao {
     
    public void guardarSeccion(Seccion seccion);
    public Seccion obtenerPorId(int idSeccion);
    public List<Seccion> obtenerTodos();
    public void eliminar(Seccion seccion);
    
}
