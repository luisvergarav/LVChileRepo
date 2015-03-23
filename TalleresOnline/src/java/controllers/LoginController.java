/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author Luis
 */
 
    import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import model.Dao.SemestreDao;
import model.Entitys.Semestre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
 
@Controller    
public class LoginController {

 
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(ModelMap model) {
                
		return "login";
 
	}
 
	@RequestMapping(value="/loginfailed.do", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
                List<String> errores = new ArrayList();
                errores.add("Error al autenticar el usuario - Usuario o contraseña invalidos");
		model.addAttribute("errores",errores);
		return "loginfailed";
 
	}
 
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(ModelMap model) {
                
		return "login";
 
	}
 

}
