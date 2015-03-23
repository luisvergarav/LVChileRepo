/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.entities.Pregunta;

/**
 *
 * @author Luis
 */
public class PreguntaDaoServiceImpl implements PreguntaDaoService {
    PreguntaDaoImpl preguntaDao = new PreguntaDaoImpl();
    
    
    @Override
    public List<Pregunta> getAll() {
       return preguntaDao.getAll();
    }

    @Override
    public Pregunta getbyId(int idPregunta) {
        return preguntaDao.getbyId(idPregunta);
    }

    @Override
    public void guardar(Pregunta Pregunta) {
        preguntaDao.guardar(Pregunta);
    }

    @Override
    public void eliminar(Pregunta pregunta) {
        preguntaDao.eliminar(pregunta);
    }

    @Override
    public void actualizar(Pregunta pregunta) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
