/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.Dao;

import java.util.List;
import model.entities.Encuestado;

/**
 *
 * @author PC
 */
public interface EncuestadoDao {
    
    public List<Encuestado> getAll();
    public Encuestado getbyId(int idEncuestado);
    public void guardar(Encuestado encuestado);
    public void eliminar(Encuestado encuestado);
    
    
    
}
