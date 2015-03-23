/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Cheque;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class ChequeDaoImpl implements ChequeDao{
private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }     
   
    @Transactional
    @Override
    public void guardarCheque(Cheque cheque) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(cheque);
    }

     @Transactional
    @Override
    public List<Cheque> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Cheque").list();
    }

      @Transactional
    @Override
    public void eliminar(Cheque cheque) {
        this.sessionFactory.getCurrentSession().delete(cheque);
    }
    
}
