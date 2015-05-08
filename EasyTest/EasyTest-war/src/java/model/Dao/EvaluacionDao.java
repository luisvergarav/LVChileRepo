/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entities.Evaluacion;

/**
 *
 * @author Luis
 */
public interface EvaluacionDao {
    public List<Evaluacion> getAll();
    public Evaluacion getbyId(int idEvaluacion);
    public void guardar(Evaluacion evaluacion);
    public void eliminar(Evaluacion evaluacion);
    public void actualizar(Evaluacion Evaluacion);
    
    
}
