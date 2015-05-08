/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.ArrayList;
import java.util.List;
import model.db.NewHibernateUtil;
import model.Entities.Encuestado;
import model.Entities.Grupopreguntas;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author VASS13
 */
public class GrupoPreguntasDaoImpl implements GrupoPreguntasDao {

    @Override
    public List<Grupopreguntas> getAll() {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
     List<Grupopreguntas> lista = new ArrayList<Grupopreguntas>();
     
    Transaction trx = null;   
      try{ 
        trx =session.beginTransaction();
        lista= session.createQuery("from Grupopreguntas").list();
        trx.commit();
      }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return lista;
    }

    @Override
    public Grupopreguntas getbyId(int idGrupopreguntas) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     Grupopreguntas grupopreguntas = new Grupopreguntas();
     List<Grupopreguntas> lista = new ArrayList<Grupopreguntas>();
     
    Transaction trx = null;   
    try{
           trx =session.beginTransaction();
        grupopreguntas = (Grupopreguntas) session.get(Grupopreguntas.class,idGrupopreguntas);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        return grupopreguntas;
    }

    @Override
    public void guardar(Grupopreguntas grupopreguntas) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
           trx =session.beginTransaction();
        session.saveOrUpdate(grupopreguntas);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}     
    }

    @Override
    public void eliminar(Grupopreguntas grupopreguntas) {
         Session session = NewHibernateUtil.getSessionFactory().openSession();
     
        Transaction trx = null;
        try{
                trx =session.beginTransaction();
                session.delete(grupopreguntas);
                trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    }
    
}
