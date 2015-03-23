/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.entities.Evaluacion;

/**
 *
 * @author Luis
 */
public class EvaluacionDaoServiceImpl implements EvaluacionDaoService {

    EvaluacionDaoImpl dao = new EvaluacionDaoImpl();
    
    @Override
    public List<Evaluacion> getAll() {
        return dao.getAll();
    }

    @Override
    public Evaluacion getbyId(int idEvaluacion) {
        return dao.getbyId(idEvaluacion);
    }

    @Override
    public void guardar(Evaluacion evaluacion) {
        dao.guardar(evaluacion);
    }

    @Override
    public void eliminar(Evaluacion evaluacion) {
        dao.eliminar(evaluacion);
    }

    @Override
    public void actualizar(Evaluacion Evaluacion) {
        dao.actualizar(Evaluacion);
    }
    
}
