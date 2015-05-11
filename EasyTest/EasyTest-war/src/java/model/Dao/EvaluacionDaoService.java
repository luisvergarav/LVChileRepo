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
public interface EvaluacionDaoService {
    public List<Evaluacion> getAll();
    public Evaluacion getbyId(int idEvaluacion);
    public void guardar(Evaluacion evaluacion);
    public void eliminar(Evaluacion evaluacion);
    public void actualizar(Evaluacion Evaluacion);
    
}
