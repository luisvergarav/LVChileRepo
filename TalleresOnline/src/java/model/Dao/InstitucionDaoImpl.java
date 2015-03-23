/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Institucion;
import model.Entitys.Taller;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class InstitucionDaoImpl implements InstitucionDao{
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    @Override
    public void guardarInstitucion(Institucion institucion){
        this.sessionFactory.getCurrentSession().saveOrUpdate(institucion);
    }
 @Transactional
    @Override
    public Institucion obtenerPorId(String idInstitucion) {
        return (Institucion) this.sessionFactory.getCurrentSession().get(Institucion.class,idInstitucion);
    }
 @Transactional
    @Override
    public List<Institucion> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Institucion").list();
    }
}
