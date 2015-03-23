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
public class EncuestadoDaoServiceImp implements EncuestadoDaoService{
    
    EncuestadoDaoImpl encuestadoDao = new EncuestadoDaoImpl();
    
    @Override
    public List<Encuestado> getAll() {
        return encuestadoDao.getAll();
    }

    @Override
    public Encuestado getbyId(int idEncuestado) {
        return encuestadoDao.getbyId(idEncuestado);
    }

    @Override
    public void guardar(Encuestado encuestado) {
        encuestadoDao.guardar(encuestado);
    }

    @Override
    public void eliminar(Encuestado encuestado) {
        encuestadoDao.eliminar(encuestado);
    }
    
}
