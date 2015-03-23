/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import model.Entitys.Profesor;
import model.Entitys.TipoTaller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Luis
 */
public class TipoTallerValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(TipoTaller.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		TipoTaller tipoTaller = (TipoTaller) obj;
		
                                 ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"nombre", null, "Ingrese Nombre del tipo Taller a Agregar");

                
		
	
		if( tipoTaller.getInstitucion().getRutInstitucion().isEmpty()){
			errors.rejectValue("institucion.rutInstitucion", null, "Tipo Taller necesita esta asociado a una Institucion");
		}
	
	}

}


