/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.Dao;

import java.util.List;
import model.Entities.Encuestador;
import model.Entities.Test;
/**
 *
 * @author PC
 */
public interface TestDaoService {
    
       public List<Test> getAll();
    public Test getbyId(int testId);
    public void guardar(Test test);
    public void eliminar(Test test);
    public void actualizar(Test test);
    public Encuestador getbyRut(String rutEncuestador);
}
