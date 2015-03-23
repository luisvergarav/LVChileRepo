/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Apoderado;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class ApoderadoDaoImpl implements ApoderadoDao {
private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
 @Transactional
    @Override
    public void guardarApoderado(Apoderado apoderado) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(apoderado);
    }

 @Transactional
 @Override
    public Apoderado obtenerPorId(String rutApoderado) {
           return (Apoderado) this.sessionFactory.getCurrentSession().get(Apoderado.class,rutApoderado);
    }
@Transactional
    @Override
    public List<Apoderado> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Apoderado").list();
    }
    
}
