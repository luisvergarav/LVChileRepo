/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.db.NewHibernateUtil;
import model.entities.Plantilla;

/**
 *
 * @author Luis
 */
public class PlantillaDaoImpl implements PlantillaDao{

    @Override
    public List<Plantilla> getAll() {
       Session session = NewHibernateUtil.getSessionFactory().openSession();
         List<Plantilla> lista = new ArrayList<Plantilla>();
     
        Transaction trx = null;   
        try{        
            trx =session.beginTransaction();        
            lista = session.createQuery("from Plantilla").list();
            trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
        
        return lista;
    }

    @Override
    public Plantilla getbyId(int idPlantilla) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
     Plantilla plantilla = new Plantilla();
     List<Plantilla> lista = new ArrayList<Plantilla>();
     
    Transaction trx = null;   
    try{
           trx =session.beginTransaction();
        plantilla = (Plantilla) session.get(Plantilla.class,idPlantilla);
        trx.commit();
        }catch(HibernateException e){
			
		}finally{
			session.close();
		}
    return plantilla;
    }

    @Override
    public void guardar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void eliminar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void actualizar(Plantilla plantilla) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
