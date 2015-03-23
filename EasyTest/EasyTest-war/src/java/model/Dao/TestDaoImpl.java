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
import model.entities.Evaluacion;
import model.entities.Test;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author PC
 */
public class TestDaoImpl implements TestDao{


    @Override
    public List<Test> getAll() {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
         List<Test> listaTest = new ArrayList<Test>();
     
        Transaction trx = null;   
        try{        
            trx =session.beginTransaction();        
            listaTest = session.createQuery("from Test").list();
            trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        
        return listaTest;
    }

    @Override
    public Test getbyId(int testId) {
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     Test test = new Test();
     //List<Encuestado> listaTest = new ArrayList<Encuestado>();
     
    Transaction trx = null;   
    try{
           trx =session.beginTransaction();
        test = (Test) session.get(Test.class,testId);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return test;
    }


    @Override
    public void guardar(Test test) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        Transaction trx = null;   
         try{       
            trx =session.beginTransaction();                
            session.saveOrUpdate(test);
            trx.commit();
            }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

    @Override
    public void eliminar(Test test) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
            trx =session.beginTransaction();
            session.delete(test);
            trx.commit();
            }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }

    @Override
    public void actualizar(Test test) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
}
