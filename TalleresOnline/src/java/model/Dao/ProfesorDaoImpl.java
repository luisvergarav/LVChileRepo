/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Profesor;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class ProfesorDaoImpl implements ProfesorDao {
    
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    @Override
    public void guardarProfesor(Profesor profesor) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(profesor);
    }
    @Transactional
    @Override
    public Profesor obtenerPorId(String idProfesor) {
        return (Profesor) this.sessionFactory.getCurrentSession().get(Profesor.class,idProfesor);
    }
    @Transactional
    @Override
    public List<Profesor> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Profesor").list();
    }
    @Transactional
    @Override
    public Profesor obtenePorNombre(String nombre,String apellido) {
        return (Profesor) this.sessionFactory.getCurrentSession().createQuery("from Profesor p where p.nombreProfesor = ? and p.apellidoProfesor = ?").setString(0,nombre).setString(1,apellido).uniqueResult();
    }
    
}
