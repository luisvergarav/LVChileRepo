/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Formapago;

/**
 *
 * @author Luis
 */
public interface FormaPagoDao {
        public void guardarFormaPago(Formapago formaPago);
    public Formapago obtenerPorId(int idFormaPago);
    public List<Formapago> obtenerTodos();    
}
