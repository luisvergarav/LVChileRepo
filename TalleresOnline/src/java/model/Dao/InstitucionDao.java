/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Institucion;
import model.Entitys.Taller;

/**
 *
 * @author Luis
 */
public interface InstitucionDao {
    
    public void guardarInstitucion(Institucion institucion);
    public Institucion obtenerPorId(String idInstitucion);
    public List<Institucion> obtenerTodos();
    
    
}
