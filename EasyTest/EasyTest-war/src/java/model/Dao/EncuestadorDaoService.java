/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entities.Encuestador;

/**
 *
 * @author Luis
 */
public interface EncuestadorDaoService {
     public List<Encuestador> getAll();
    public Encuestador getbyId(int idEncuestador);
    public void guardar(Encuestador encuestador);
    public void eliminar(Encuestador encuestador);
    public void actualizar(Encuestador encuestador);
    
}
