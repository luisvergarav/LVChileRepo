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
public class EncuestadorDaoServiceImpl implements EncuestadorDao {
    EncuestadorDaoImpl dao = new EncuestadorDaoImpl();
    
    @Override
    public List<Encuestador> getAll() {
        return dao.getAll();
    }

    @Override
    public Encuestador getbyId(int idEncuestador) {
        return dao.getbyId(idEncuestador);
    }

    @Override
    public void guardar(Encuestador encuestador) {
         dao.guardar(encuestador);
    }

    @Override
    public void eliminar(Encuestador encuestador) {
        dao.eliminar(encuestador);
    }

    @Override
    public void actualizar(Encuestador encuestador) {
        dao.actualizar(encuestador);
    }

    @Override
    public Encuestador getbyRut(String rutEncuestador) {
        return dao.getbyRut(rutEncuestador);
    }
    
}
