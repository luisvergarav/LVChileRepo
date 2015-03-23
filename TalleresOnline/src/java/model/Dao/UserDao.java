/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.Alumno;
import model.Entitys.Seccion;
import model.Entitys.Users;


/**
 *
 * @author Luis
 */
public interface UserDao {
    
    public void guardarUsuario(Users user);
    public Users obtenerPorId(String userId);
    public Users obtenerPorUserName(String userName);
    public List<Users> obtenerTodos();
    public Users obtenerPorId(long userId);

    
    
}
