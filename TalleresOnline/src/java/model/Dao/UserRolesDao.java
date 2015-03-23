/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.Entitys.UserRoles;

/**
 *
 * @author Luis
 */
public interface UserRolesDao {
    public void guardarUserRole(UserRoles userRole);       
    public List<UserRoles> obtenerTodos();
    public void eliminarUserRoles(UserRoles userRole);
   
}
