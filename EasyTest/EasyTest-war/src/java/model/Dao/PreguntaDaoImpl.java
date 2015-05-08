/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.ArrayList;
import java.util.List;
import model.db.NewHibernateUtil;
import model.Entities.Pregunta;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class PreguntaDaoImpl implements PreguntaDao{

 
    @Override
    public List<Pregunta> getAll() {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         List<Pregunta> lista = new ArrayList<Pregunta>();
         
         Transaction trx = null;   
         try{
           trx =session.beginTransaction();
           lista = session.createCriteria("from Pregunta").list();
           trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
           return lista;
        
    }

    @Override
    public Pregunta getbyId(int idPregunta) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
         Pregunta pregunta = new Pregunta();
         
         Transaction trx = null;   
         try{
           trx =session.beginTransaction();
           pregunta = (Pregunta) session.get(Pregunta.class,idPregunta);
           trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
           return pregunta;
    }

    @Transactional
    @Override
    public void guardar(Pregunta pregunta) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
           trx =session.beginTransaction();
            session.saveOrUpdate(pregunta);
            trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

    @Transactional
    @Override
    public void eliminar(Pregunta pregunta) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
            trx =session.beginTransaction();
            session.delete(pregunta);
            trx.commit();
            }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

    @Transactional
    @Override
    public void actualizar(Pregunta pregunta) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
