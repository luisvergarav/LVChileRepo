/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Gratis;
import model.Entitys.GratisId;
import model.Entitys.Pagada;

/**
 *
 * @author Luis
 */
public interface InscripcionGratisDao {
       public void guardarInscripcion(Gratis gratis);
    public Gratis obtenerPorId(GratisId idGratis);
    public List<Gratis> obtenerTodos();
public List<Gratis> obtenerPorAlumno(String rutAlumno);
public void eliminarInscripcion(Gratis gratis);

}
