/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.Dao;

import java.util.ArrayList;
import java.util.List;
import model.db.NewHibernateUtil;
import model.entities.Encuestado;
import model.entities.Encuestador;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PC
 */
public class EncuestadoDaoImpl implements EncuestadoDao{

    @Override
    public List<Encuestado> getAll() {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     List<Encuestado> lista = new ArrayList<Encuestado>();
     
    Transaction trx = null;   
      try{ 
        trx =session.beginTransaction();
        lista= session.createQuery("from Encuestado").list();
        trx.commit();
      }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return lista;
    }

    

    @Override
    public Encuestado getbyId(int idEncuestado) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     Encuestado encuestado = new Encuestado();
     List<Encuestado> lista = new ArrayList<Encuestado>();
     
    Transaction trx = null;   
    try{
           trx =session.beginTransaction();
        encuestado = (Encuestado) session.get(Encuestado.class,idEncuestado);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return encuestado;
    }

    @Override
    public void guardar(Encuestado encuestado) {
Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
           trx =session.beginTransaction();
        session.saveOrUpdate(encuestado);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}     
    }    

    @Override
    public void eliminar(Encuestado encuestado) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
                trx =session.beginTransaction();
                session.delete(encuestado);
                trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

   
    }

  
    

