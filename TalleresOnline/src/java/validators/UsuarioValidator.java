/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import model.Entitys.Profesor;
import model.Entitys.Taller;
import model.Entitys.Users;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Luis
 */
public class UsuarioValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(Users.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Users usuario = (Users) obj;
		
		
                
                
                
                    
                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"username", null,"Ingrese nombre de usuario");
                 
                      ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"password", null,"Ingrese una contraseña");
                 
                   
                      
                   
	}

}


