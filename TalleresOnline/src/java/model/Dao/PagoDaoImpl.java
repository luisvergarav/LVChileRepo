/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Pago;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class PagoDaoImpl implements PagoDao {

     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    @Override    public void guardarPago(Pago pago) {
             this.sessionFactory.getCurrentSession().saveOrUpdate(pago);
           
    }

    @Transactional
    @Override
    public Pago obtenerPorId(int idPago) {
        return (Pago) this.sessionFactory.getCurrentSession().get(Pago.class,idPago);
    }

    @Transactional
    @Override
    public List<Pago> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Pago").list();
    }
    
}
