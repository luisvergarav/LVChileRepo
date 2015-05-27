/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.ArrayList;
import java.util.List;

import model.db.NewHibernateUtil;
import model.entities.Encuestador;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class EncuestadorDaoImpl implements EncuestadorDao{
   
    @Override
    public List<Encuestador> getAll() {
    Session session = NewHibernateUtil.getSessionFactory().openSession();
     List<Encuestador> lista = new ArrayList<Encuestador>();
     
    Transaction trx = null;   
      try{ 
        trx =session.beginTransaction();
        lista= session.createQuery("from Encuestador").list();
        trx.commit();
      }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return lista;
    }

    
    @Override
    public Encuestador getbyId(int idEncuestador) {
    Session session = NewHibernateUtil.getSessionFactory().openSession();
     Encuestador encuestador = new Encuestador();
     List<Encuestador> lista = new ArrayList<Encuestador>();
     
    Transaction trx = null;   
    try{
           trx =session.beginTransaction();
        encuestador = (Encuestador) session.get(Encuestador.class,idEncuestador);
        trx.commit();
        }catch(HibernateException e){
		e.printStackTrace();
		}finally{
			session.close();
		}
        return encuestador;
    }

   
    @Override
    public void guardar(Encuestador encuestador) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
           trx =session.beginTransaction();
        session.saveOrUpdate(encuestador);
        trx.commit();
        }catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
        
    }

   
    @Override
    public void eliminar(Encuestador encuestador) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
                trx =session.beginTransaction();
                session.delete(encuestador);
                trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

   
    @Override
    public void actualizar(Encuestador encuestador) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Encuestador getbyRut(String rutEncuestadorBuscado) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         Encuestador encuestador = new Encuestador();
        Transaction trx = null;
        try{
                trx =session.beginTransaction();
                encuestador= (Encuestador) session.createQuery("from Encuestador where Rut = ?").setString(0, rutEncuestadorBuscado).uniqueResult();
                trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return encuestador;
    }

    @Override
    public Encuestador getbyNick(String nick) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         Encuestador encuestador = new Encuestador();
        Transaction trx = null;
        try{
                trx =session.beginTransaction();
                encuestador= (Encuestador) session.createQuery("from Encuestador where nick = ?").setString(0, nick).uniqueResult();
                trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return encuestador;
    }
    
}
