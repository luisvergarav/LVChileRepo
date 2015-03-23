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
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Luis
 */
public class TallerValidator implements Validator{


	@Override
	public boolean supports(Class<?> obj) {
		return obj.equals(Taller.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Taller taller = (Taller) obj;
		
		if(taller.getNombreTaller().isEmpty()){
			errors.rejectValue("nombreTaller", null, "Ingrese un nombre para el Taller");
		}

                if(taller.getCupos() <= 0){
			errors.rejectValue("cupos", null, "Indique cantidad de Cupos para el Taller");
		}
                
                
                   if (taller.getInicioTaller() == null){
                       errors.rejectValue("inicioTaller", null, "Ingrese Fecha inicio Taller");
                   }else{
                       
                   }
                       
                   
                   if (taller.getTerminoTaller() == null){
                       errors.rejectValue("terminoTaller", null, "Ingrese Fecha termino Taller");
                   }
                   
                   ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"inicioTaller", null,"Ingrese Fecha inicio Taller");
                   
                
                   ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"terminoTaller", null, "Ingrese Fecha termino Taller");
                
                 ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"claseTaller", null, "Seleccione Clase de Taller");
                
                 if(!taller.getClaseTaller().equals("CU") && !taller.getClaseTaller().equals("CO"))
                     errors.rejectValue("claseTaller", null, "Seleccione Clase de Taller");
		
	
		if(taller.getInstitucion() == null 
		|| taller.getInstitucion().getRutInstitucion().isEmpty() || taller.getInstitucion().getRutInstitucion().equals("0")){
			errors.rejectValue("institucion.rutInstitucion", null, "Seleccione una Institucion");
		}
                
             
                
                
                if(taller.getTipoTaller() == null 
		|| taller.getTipoTaller().getIdTipoTaller() <= 0){
			errors.rejectValue("tipoTaller.idTipoTaller", null, "Seleccione un Tipo de Taller");
		}
              
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"monto", null, "Indique monto del Taller");
                
                
                if (taller.getMonto() != null){
                if(taller.getMonto().intValue() <= 0){
			errors.rejectValue("monto", null, "Indique monto del Taller");
		}
                }   
                
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"semestre.idsemestre", null, "Seleccione el Semestre");
                
                
                
	}

}


