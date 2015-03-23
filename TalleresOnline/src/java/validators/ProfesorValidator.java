/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import model.Entitys.Profesor;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Luis
 */
public class ProfesorValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(Profesor.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Profesor profesor = (Profesor) obj;
		
		if(profesor.getApellidoProfesor().isEmpty()){
			errors.rejectValue("apellidoProfesor", null, "Ingrese un Apellido");
		}

                ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"idProfesor", null, "Ingrese un Rut");
                
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"nombreProfesor", null, "Ingrese el Nombre");
		
		
	
		if(profesor.getTipoTaller() == null 
		|| profesor.getTipoTaller().getIdTipoTaller() == 0){
			errors.rejectValue("tipoTaller.idTipoTaller", null, "Seleccione un Tipo Taller");
		}
	
	}

}


