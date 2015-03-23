/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Seccion;

import model.Entitys.Taller;
import model.Entitys.Users;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Luis
 */
public class UserDaoImpl implements UserDao{
      private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
 

   
    @Transactional
    @Override
    public void guardarUsuario(Users user) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @Transactional
    @Override
    public Users obtenerPorId(String userId) {
        return (Users) this.sessionFactory.getCurrentSession().get(Users.class,userId);
    }

    @Transactional
    @Override
    public List<Users> obtenerTodos() {
        return this.sessionFactory.getCurrentSession().createQuery("from Users").list();
    }
@Transactional
    @Override
    public Users obtenerPorUserName(String userName) {
        return (Users) this.sessionFactory.getCurrentSession().createQuery("from Users u where u.username = ?").setString(0,userName).uniqueResult();
    }
@Transactional
    @Override
    public Users obtenerPorId(long userId) {
        return (Users) this.sessionFactory.getCurrentSession().get(Users.class,userId);
    }
}
