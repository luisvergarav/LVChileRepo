/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Pago;

/**
 *
 * @author Luis
 */
public interface PagoDao {
 public void guardarPago(Pago pago);
    public Pago obtenerPorId(int idPago);
    public List<Pago> obtenerTodos();
    
}
