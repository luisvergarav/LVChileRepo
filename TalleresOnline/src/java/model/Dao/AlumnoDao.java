/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Seccion;


/**
 *
 * @author Luis
 */
public interface AlumnoDao {
    
    public void guardarAlumno(Alumno alumno);
    public Alumno obtenerPorId(String rutAlumno);
    public List<Alumno> obtenerTodos();
    public List<Alumno> obtenerPorSeccion(int codSeccion);
    
    
}
