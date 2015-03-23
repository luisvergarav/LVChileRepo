/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Pagada;
import model.Entitys.PagadaId;
import model.Entitys.Profesor;

/**
 *
 * @author Luis
 */
public interface InscripcionPagadaDao {
        
    public void guardarInscripcion(Pagada pagada);
    public Pagada obtenerPorId(PagadaId idPagada);
    public List<Pagada> obtenerTodos();
        public Pagada obtenerPorOC(String oc);
}
