/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.entities.Plantilla;

/**
 *
 * @author Luis
 */
public interface PlantillaDaoService {
       public List<Plantilla> getAll();
    public Plantilla getbyId(int idPlantilla);
    public void guardar(Plantilla plantilla);
    public void eliminar(Plantilla plantilla);
    public void actualizar(Plantilla plantilla);
    
}
