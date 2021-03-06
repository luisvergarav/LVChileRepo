/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Seccion;

import model.Entitys.Taller;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class SeccionDaoImpl implements SeccionDao{
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
 
@Transactional
    @Override
    public void guardarSeccion(Seccion seccion) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(seccion);
    }
@Transactional
    @Override
    public Seccion obtenerPorId(int idSeccion) {
           return (Seccion) this.sessionFactory.getCurrentSession().get(Seccion.class,idSeccion);
    }
@Transactional
    @Override
    public List<Seccion> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Seccion").list();
    }
@Transactional
    @Override
    public void eliminar(Seccion seccion) {
            this.sessionFactory.getCurrentSession().delete(seccion);
    }
}
