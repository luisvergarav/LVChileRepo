/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.entities.Test;
import model.entities.Encuestador;

/**
 *
 * @author PC
 */
public class TestDaoServiceImpl implements TestDao {

    TestDaoImpl testDao = new TestDaoImpl();

    @Override
    public List<Test> getAll() {
        return testDao.getAll();
    }

    @Override
    public Test getbyId(int testId) {
        return testDao.getbyId(testId);
    }

    @Override
    public void guardar(Test test) {
        testDao.guardar(test);
    }

    @Override
    public void eliminar(Test test) {
        testDao.eliminar(test);
    }

    @Override
    public void actualizar(Test test) {
        testDao.actualizar(test);
    }


}
