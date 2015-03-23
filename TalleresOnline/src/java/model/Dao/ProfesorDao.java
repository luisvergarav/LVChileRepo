/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Profesor;

/**
 *
 * @author Luis
 */
public interface ProfesorDao {
        
    public void guardarProfesor(Profesor profesor);
    public Profesor obtenerPorId(String idProfesor);
    public List<Profesor> obtenerTodos();
    public Profesor obtenePorNombre(String nombre,String apellido);
}
