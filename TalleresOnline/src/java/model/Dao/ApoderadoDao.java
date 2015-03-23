/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Apoderado;

/**
 *
 * @author Luis
 */
public interface ApoderadoDao {
      public void guardarApoderado(Apoderado apoderado);
    public Apoderado obtenerPorId(String rutApoderado);
    public List<Apoderado> obtenerTodos();
    
}
