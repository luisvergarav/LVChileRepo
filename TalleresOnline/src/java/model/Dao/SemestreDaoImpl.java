/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Semestre;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class SemestreDaoImpl implements SemestreDao{
private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
 @Transactional    
    @Override
    public void guardarSemestre(Semestre semestre) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(semestre);
    }

 @Transactional
 @Override
    public Semestre obtenerPorId(int idSemestre) {
        return (Semestre) this.sessionFactory.getCurrentSession().get(Semestre.class,idSemestre);
    }

 @Transactional
 @Override
    public List<Semestre> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Semestre").list();
    }

    @Override
     @Transactional
    public Semestre obtenerActivo() {
        return (Semestre) this.sessionFactory.getCurrentSession().createQuery("from Semestre where activo = 1").uniqueResult();
    }
    
}
