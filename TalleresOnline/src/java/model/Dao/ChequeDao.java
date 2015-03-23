/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Cheque;

/**
 *
 * @author Luis
 */
public interface ChequeDao {
    
    public void guardarCheque(Cheque cheque);  
    public List<Cheque> obtenerTodos();
    public void eliminar(Cheque cheque);
}
