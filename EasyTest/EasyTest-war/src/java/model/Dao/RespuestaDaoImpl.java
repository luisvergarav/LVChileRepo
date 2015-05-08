/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import model.Entities.Respuesta;
import model.Entities.Test;
import model.db.NewHibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author VASS13
 */
public class RespuestaDaoImpl implements RespuestaDao{

     @Override
    public void guardar(Respuesta respuesta) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
        Transaction trx = null;   
         try{       
            trx =session.beginTransaction();                
            session.saveOrUpdate(respuesta);
            trx.commit();
            }catch(HibernateException e){
		e.printStackTrace();
		}finally{
			session.close();
		}
    }

    
}
