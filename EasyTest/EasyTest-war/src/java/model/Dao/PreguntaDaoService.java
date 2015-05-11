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
public interface PreguntaDaoService {
     public List<Pregunta> getAll();
    public Pregunta getbyId(int idPregunta);
    public void guardar(Pregunta Pregunta);
    public void eliminar(Pregunta pregunta);
    public void actualizar(Pregunta pregunta);
}
