/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Semestre;

/**
 *
 * @author Luis
 */
public interface SemestreDao {
        public void guardarSemestre(Semestre semestre);
    public Semestre obtenerPorId(int idSemestre);
    public List<Semestre> obtenerTodos();
    
    public Semestre obtenerActivo();
    
}
