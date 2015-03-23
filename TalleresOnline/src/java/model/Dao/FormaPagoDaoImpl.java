/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Formapago;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class FormaPagoDaoImpl implements FormaPagoDao {
private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
        @Transactional
    @Override
    public void guardarFormaPago(Formapago formaPago) {
        
                    this.sessionFactory.getCurrentSession().saveOrUpdate(formaPago);
    }

            @Transactional
    @Override
    public Formapago obtenerPorId(int idFormaPago) {
        return (Formapago) this.sessionFactory.getCurrentSession().get(Formapago.class,idFormaPago);
    }

                @Transactional
    @Override
    public List<Formapago> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Formapago").list();
    }
    
}
