/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Pagada;
import model.Entitys.PagadaId;
import model.Entitys.Profesor;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class InscripcionPagadaDaoImpl implements InscripcionPagadaDao {
    
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    

    @Transactional
    @Override
    public void guardarInscripcion(Pagada pagada) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(pagada);
    }

    @Transactional
    @Override
    public Pagada obtenerPorId(PagadaId idPagada) {
        return (Pagada) this.sessionFactory.getCurrentSession().get(Pagada.class,idPagada);
    }

    @Transactional
    @Override
    public List<Pagada> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Pagada").list();
    }
    @Transactional
    @Override
    public Pagada obtenerPorOC(String oc) {
        return (Pagada)this.sessionFactory.getCurrentSession().createQuery("from Pagada p where p.numOrdenInscripcion = ? ")
                .setString(0, oc).uniqueResult();
    }
}
