/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import model.Entitys.Profesor;
import model.Entitys.Seccion;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Luis
 */
public class SeccionValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(Seccion.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Seccion seccion = (Seccion) obj;
		
                
                if(seccion.getNombreSeccion().trim().isEmpty()	){
			errors.rejectValue("nombreSeccion", null, "Ingrese nombre para Seccion");
		}
		
	
		if(seccion.getCupos() <= 0	){
			errors.rejectValue("cupos", null, "Indique numero de Cupos");
		}
	
	}

}


