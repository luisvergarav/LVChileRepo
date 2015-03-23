/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import model.Entitys.Apoderado;
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
public class ApoderadoValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(Apoderado.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Apoderado apoderado = (Apoderado) obj;
		
		
                
                
                   
                   
                   ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"primerNombre", null,"Ingrese un Nombre");
                   
                
                   ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"segundoNombre", null, "Ingrese un nombre");                                   
                
                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"apellidoPaterno", null, "Ingrese un apellido");
                    
                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"apellidoMaterno", null, "Ingrese un apellido");                                   

                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"fechaNacimiento", null, "Ingrese una fecha");                                   

                    
           				
                
                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"mail", null, "Ingrese un mail");
                    
                    ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"rutApoderado", null, "Ingrese el rut del apoderado");                                   
                
                   
	}

}


