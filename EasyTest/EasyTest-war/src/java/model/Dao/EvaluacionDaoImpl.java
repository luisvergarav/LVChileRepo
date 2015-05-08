/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.ArrayList;
import java.util.List;
import model.db.NewHibernateUtil;
import model.Entities.Evaluacion;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class EvaluacionDaoImpl implements EvaluacionDao{
   
    @Override
    public List<Evaluacion> getAll() {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         List<Evaluacion> lista = new ArrayList<Evaluacion>();
     
        Transaction trx = null;   
        try{        
            trx =session.beginTransaction();        
            lista = session.createQuery("from Evaluacion").list();
            trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        
        return lista;
        
    }
    
    
    @Override
    public Evaluacion getbyId(int idEvaluacion) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
         Evaluacion evaluacion = new Evaluacion();
     
        Transaction trx = null;   
        try{        
            trx =session.beginTransaction();        
            evaluacion = (Evaluacion)session.get(Evaluacion.class,idEvaluacion);
            trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        
        return evaluacion;
    }
   
    @Override
    public void guardar(Evaluacion evaluacion) {
       Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        Transaction trx = null;   
         try{       
            trx =session.beginTransaction();                
            session.saveOrUpdate(evaluacion);
            trx.commit();
            }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

    
    @Override
    public void eliminar(Evaluacion evaluacion) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        Transaction trx = null;   
        try{        
            trx =session.beginTransaction();                
            session.delete(evaluacion);
            trx.commit();
            }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        
        
    }

   
    @Override
    public void actualizar(Evaluacion Evaluacion) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
