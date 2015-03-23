/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Taller;

/**
 *
 * @author Luis
 */



public interface TallerDao {
    
    public void guardarTaller(Taller taller);
    public Taller obtenerPorId(int taller);
    public List<Taller> obtenerTodos();
    
    
}
