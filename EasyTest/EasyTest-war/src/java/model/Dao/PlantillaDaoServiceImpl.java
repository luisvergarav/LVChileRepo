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
public class PlantillaDaoServiceImpl implements PlantillaDaoService{
    PlantillaDaoImpl plantillaDao = new PlantillaDaoImpl();
    
    @Override
    public List<Plantilla> getAll() {
        return plantillaDao.getAll();
                
    }

    @Override
    public Plantilla getbyId(int idPlantilla) {
        return plantillaDao.getbyId(idPlantilla);
    }

    @Override
    public void guardar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void eliminar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void actualizar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
