/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.TipoTaller;

/**
 *
 * @author Luis
 */
public interface TipoTallerDao {
     public void guardarTipoTaller(TipoTaller tipoTaller);
    public TipoTaller obtenerPorId(int idTipoTaller);
    public List<TipoTaller> obtenerTodos();
    
}
