/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Diasseccion;
import model.Entitys.Seccion;

import model.Entitys.Taller;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class DiasseccionDaoImpl implements DiasseccionDao{
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
 


    
    
    @Transactional
    @Override
    public void guardarDiasseccion(Diasseccion diasseccion) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(diasseccion);
    }
    
    @Transactional    
    @Override
    public Diasseccion obtenerPorId(int idDiasseccion) {
        return (Diasseccion) this.sessionFactory.getCurrentSession().get(Diasseccion.class,idDiasseccion);
    }
    
    @Transactional
    @Override
    public List<Diasseccion> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Diasseccion").list();
    }
    
    @Transactional
    @Override
    public void eliminar(Diasseccion diasseccion) {
        this.sessionFactory.getCurrentSession().delete(diasseccion);
    }
}
