/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Gratis;
import model.Entitys.GratisId;
import model.Entitys.Pagada;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class InscripcionGratisDaoImpl implements InscripcionGratisDao{

    
     private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    @Override
    public void guardarInscripcion(Gratis gratis) {
        this.sessionFactory.getCurrentSession().save(gratis);
    }

    @Transactional
    @Override
    public Gratis obtenerPorId(GratisId idGratis) {
        return (Gratis) this.sessionFactory.getCurrentSession().get(Gratis.class,idGratis);
    }

    @Transactional
    @Override
    public List<Gratis> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Gratis").list();
    }

    @Transactional
    @Override
    public List<Gratis> obtenerPorAlumno(String rutAlumno) {
        return this.sessionFactory.getCurrentSession().createQuery("from Gratis g where "
                        + "g.alumno.rutAlumno"                        
                        + " = ?").setString(0,rutAlumno).list();
    }
    
@Transactional
    @Override
    public void eliminarInscripcion(Gratis gratis) {
        this.sessionFactory.getCurrentSession().delete(gratis);
    }



    
}
