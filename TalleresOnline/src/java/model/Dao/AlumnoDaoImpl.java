/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Seccion;

import model.Entitys.Taller;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class AlumnoDaoImpl implements AlumnoDao{
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }     
   
    @Transactional
    @Override
    public void guardarAlumno(Alumno alumno) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(alumno);
    }

    @Transactional
    @Override
    public Alumno obtenerPorId(String rutAlumno) {
        return (Alumno) this.sessionFactory.getCurrentSession().get(Alumno.class,rutAlumno);
    }

    @Transactional
    @Override
    public List<Alumno> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Alumno").list();
    }

    @Transactional
    @Override
    public List<Alumno> obtenerPorSeccion(int codSeccion) {
                return this.sessionFactory.getCurrentSession().createQuery("select a from Alumno a where "
                        + "a.alumnoseccions."
                        + "seccion.codSeccion"
                        + " = ?").setInteger(0,codSeccion).list();
    }
}
