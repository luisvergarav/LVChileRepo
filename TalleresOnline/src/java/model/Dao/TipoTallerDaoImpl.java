/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.TipoTaller;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class TipoTallerDaoImpl implements TipoTallerDao {
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
 @Transactional
    @Override
    public void guardarTipoTaller(TipoTaller tipoTaller) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(tipoTaller);
    }
 @Transactional
    @Override
    public TipoTaller obtenerPorId(int idTipoTaller) {
        return (TipoTaller) this.sessionFactory.getCurrentSession().get(TipoTaller.class,idTipoTaller);
    }
 @Transactional
    @Override
    public List<TipoTaller> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from TipoTaller").list();
    }
    
 
    
}
