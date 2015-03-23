/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import java.text.SimpleDateFormat;
import validators.TallerValidator;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

import java.util.List;
import java.util.Random;
import java.util.Set;
import model.Dao.DiasseccionDao;
import model.Dao.InstitucionDao;
import model.Dao.ProfesorDao;
import model.Dao.SeccionDao;
import model.Dao.SemestreDao;
import model.Dao.TallerDao;
import model.Dao.TipoTallerDao;
import model.Entitys.Diasseccion;

import model.Entitys.Institucion;
import model.Entitys.Profesor;
import model.Entitys.Seccion;
import model.Entitys.Semestre;

import model.Entitys.Taller;
import model.Entitys.TipoTaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import models.VO.DiaVO;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.SessionAttributes;
import validators.SeccionValidator;
import validators.TipoTallerValidator;

/**
 *
 * @author Luis
 */
@Controller
@RequestMapping("/mantenedor")
@SessionAttributes({"taller"})
public class TallerController {

    @ModelAttribute("taller")  
    public Taller createTaller() {  
        return taller;  
    }

    @Autowired
    Taller taller;    
    @Autowired
    TallerDao tallerDao;
    @Autowired
    SeccionDao seccionDao;
    @Autowired
    InstitucionDao institucionDao;
   @Autowired
    SemestreDao semestreDao; 
     @Autowired
    ProfesorDao profesorDao;
    @Autowired
     DiasseccionDao diasseccionDao;
    @Autowired
     TipoTallerDao tipoTallerDao;
     
    
    private String titulo;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        // You can register other Custom Editors with the WebDataBinder, like CustomNumberEditor for Integers and Longs, or StringTrimmerEditor for Strings
    }   
    
       @RequestMapping(value = "/tipoTallerConf.do", method = RequestMethod.GET)
	public String tipoTallerConf(Model model, @RequestParam(value = "idTipoTaller", defaultValue = "0") int idTipoTaller)
         {
             
             TipoTaller tipoTaller =new TipoTaller();
             List<String> errores = new ArrayList<String>();
                if (idTipoTaller > 0){
                    titulo = "Editando Tipo Taller";
                    TipoTaller tipoTallerTmp = this.tipoTallerDao.obtenerPorId(idTipoTaller);
                    if (tipoTallerTmp != null )tipoTaller = tipoTallerTmp;
                    else
                        errores.add("Tipo Taller no existente!");
                    
                }else  {                       
                        titulo = "Nuevo Tipo Taller";
                        tipoTaller.setInstitucion(this.institucionDao.obtenerTodos().get(0));
                        
                }
                
                model.addAttribute("errores",errores); 
               model.addAttribute("titulo",titulo); 
               model.addAttribute("tipoTaller",tipoTaller);
               model.addAttribute("listaTipoTaller",this.institucionDao.obtenerTodos().get(0).getTipoTallers());
              
             return "tipoTallerConf";
         }
 
   
         @RequestMapping(value = "/tipoTallerConf.do",method = RequestMethod.POST)
	public String guardarTipoTaller(
		Model model,@ModelAttribute  TipoTaller tipoTaller,
		BindingResult result) { 
                
             Institucion inst = this.institucionDao.obtenerPorId(tipoTaller.getInstitucion().getRutInstitucion());
             
                TipoTallerValidator tipoTallerValidator = new TipoTallerValidator();
                tipoTallerValidator.validate(tipoTaller, result);

		if (result.hasErrors()) {
			
			for(org.springframework.validation.ObjectError e :result.getAllErrors()){
                            System.out.println(e.toString());
                        }
			model.addAttribute("titulo", "Validando");
                        
               
               model.addAttribute("tipoTaller",tipoTaller);
               model.addAttribute("listaTipoTaller",this.institucionDao.obtenerTodos().get(0).getTipoTallers());
              
			return "tipoTallerConf";
		}
            
             
                tipoTaller.setInstitucion(inst);
                
                this.tipoTallerDao.guardarTipoTaller(tipoTaller);
                
                return "redirect:tipoTallerConf.do?idTipoTaller=" + tipoTaller.getIdTipoTaller();
          
      }
    
    
        @RequestMapping(value = "/agregarTaller.do", method = RequestMethod.GET)
	public String form(Model model, @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
        @ModelAttribute("taller") Taller taller)
         {
                //Taller taller = new Taller();
                List<Seccion> listaSecciones = new ArrayList<Seccion>();
                List<String> errores = new ArrayList<String>();
                Institucion inst = this.institucionDao.obtenerTodos().get(0);
                
                
                        
                
                if (idTaller > 0){
                    
                
                    
                    Taller tallerTmp = tallerDao.obtenerPorId(idTaller);
                    if (tallerTmp != null) {
                        taller = tallerTmp;
                        listaSecciones.addAll(taller.getSeccions());
                    }else
                    {
                        taller = new Taller();
                        
                        
                        errores.add("No existe el taller indicado!");
                    }
                    
                    
                     
                    
                    
                    
                    titulo = "Editar Taller";
                } else {
			taller = new Taller();
                        for(Semestre s:(Set<Semestre>) inst.getSemestres()){
                        if (s.getActivo()> 0){
                                taller.setSemestre(s);
                        }
                        }
			titulo = "Crear Taller";
		}
                
                model.addAttribute("errores", errores);
                model.addAttribute("taller", taller);
                model.addAttribute("titulo", titulo);
                
                List <Institucion> listaInstituciones = institucionDao.obtenerTodos();
                
                
                Set<TipoTaller> listaTipoTaller =  listaInstituciones.get(0).getTipoTallers();
                
                
                System.out.println(listaTipoTaller.size() + listaInstituciones.get(0).getRutInstitucion());
                
                   model.addAttribute("listaTipoTaller",listaTipoTaller);
                model.addAttribute("listaInstituciones",listaInstituciones);
                model.addAttribute("listaSecciones",listaSecciones);
                
                
                return "agregarTaller";
        }
        
        @RequestMapping(value = "/agregarTaller.do",method = RequestMethod.POST)
	public String form(
		Model model,@ModelAttribute  Taller taller,
		BindingResult result) { 
                    Random rnd = new Random();
                    
                    
                    System.out.println(taller.getIdTaller());
                    System.out.println(taller.getNombreTaller());
                    System.out.println(taller.getClaseTaller());
                    System.out.println(taller.getCupos());
                    System.out.println(taller.getInicioTaller());
                    System.out.println(taller.getTerminoTaller());
                    System.out.println(taller.getTipoTaller().getIdTipoTaller());
                    
                       
            
                 TallerValidator tallerValidator = new TallerValidator();
                tallerValidator.validate(taller, result);

		if (result.hasErrors()) {
			
			for(org.springframework.validation.ObjectError e :result.getAllErrors()){
                            System.out.println(e.toString());
                        }
			model.addAttribute("titulo", "Validando");
                        
                          model.addAttribute("taller", taller);
                             List <Institucion> listaInstituciones = institucionDao.obtenerTodos();
                
                
                Set<TipoTaller> listaTipoTaller =  listaInstituciones.get(0).getTipoTallers();
                
                
                System.out.println(listaTipoTaller.size() + listaInstituciones.get(0).getRutInstitucion());
                
                   model.addAttribute("listaTipoTaller",listaTipoTaller);
                model.addAttribute("listaInstituciones",listaInstituciones);
  
			return "agregarTaller";
		}
            
                
                
                //System.out.println("datos condominio original " + condominio.getNombre());
                
                //System.out.println("datos condominio propietario " + propietario.getId().getIdCondominio());
                tallerDao.guardarTaller(taller);
                //condominioDao.grabarCondominio(condominio);
                
                
            
                return "redirect:listado.do";
                
        }
        
        @RequestMapping("/listado.do")
	public String listado(Model model,
        @RequestParam(value = "desc", defaultValue = "") String strBusqueda) {
                if (strBusqueda.trim().isEmpty()){
            
                model.addAttribute("talleres",this.semestreDao.obtenerActivo().getTalleres());
                
                }else{
                        List<Taller> listaTmp = new ArrayList<Taller>();
                        for (Taller taller:this.semestreDao.obtenerActivo().getTalleres()){
                            if (taller.getNombreTaller().contains(strBusqueda)){
                                listaTmp.add(taller);
                            }
                        }
                        model.addAttribute("talleres",listaTmp);
                }
		model.addAttribute("titulo", "Listado Producto");
				
				
		return "listado";
	}
        
       @RequestMapping(value = "/agregarSeccion.do", method = RequestMethod.GET)
	public String agregarSeccion(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion ,
     
                @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
                @ModelAttribute("taller") Taller taller)
         { 
                    Seccion seccion = new Seccion();
//                        seccion.setTaller(this.tallerDao.obtenerPorId(idTaller));
                        seccion.setTaller(taller);
                        Diasseccion diaSeccion = new Diasseccion();
                        
                        Set<Profesor> listaProfesoresTmp = new HashSet<Profesor>();
                        List<String> listaProfesores = new ArrayList<String>();                        
                        //Taller taller = this.tallerDao.obtenerPorId(idTaller);
               
                
                if (codSeccion != 0 ){
                    
                    seccion = this.seccionDao.obtenerPorId(codSeccion);
                    diaSeccion.setSeccion(seccion);
                    
                    listaProfesoresTmp = seccion.getSeccionprofesors();
                    
                    titulo = "Editar Secciones"; 
                    
                }else{
                        
                   
                        titulo = "Crear Seccion";
                        
                       
                }
                List<String> listaProfesoresDisponibles =  new ArrayList<String>();
                
                
                 for(Profesor p :(Set<Profesor>) taller.getTipoTaller().getProfesors()){
                     listaProfesoresDisponibles.add(p.getNombreProfesor() + ' ' + p.getApellidoProfesor());
                 } 
                 
                seccion.setTaller(taller);
                
                        
                int i= 0;
                String[] lpTmp = new String[listaProfesoresTmp.size()];
                
                for(Profesor p : listaProfesoresTmp){
                     lpTmp[i] = (p.getNombreProfesor() + ' ' + p.getApellidoProfesor());
                     i++;
                }
                seccion.setListaProfesores(lpTmp);
                
                //listaDias.add(new DiaVO("JUEVES","PLAZA AZUL",new java.util.Date(2014, 2,12),new java.util.Date(2014, 2,12)));
                
                model.addAttribute("diaSeccion", diaSeccion);
                model.addAttribute("seccion", seccion);
                model.addAttribute("listaProfesoresDisponibles", listaProfesoresDisponibles);
                model.addAttribute("titulo", titulo);
                model.addAttribute("listaProfesores",listaProfesores);
                
                
                return "agregarSeccion";
        }
        
        @RequestMapping(value = "/agregarSeccion.do",method = RequestMethod.POST)
	public String agregarSeccion(
		Model model,@ModelAttribute  Seccion seccion,@ModelAttribute("diaSeccion") Diasseccion diaSeccion,
		BindingResult result) {
                    
                    System.out.println("Dias seccion dia taller" + diaSeccion.getLugar());
                    System.out.println("Seccion  Cupos  " + seccion.toString());
                    System.out.println("Seccion  Cupos  " + seccion.getDiasseccions().size());
              
                   SeccionValidator  seccionValidator = new SeccionValidator();
                   
                   seccionValidator.validate(seccion, result);
                    
                    
                    
		if (result.hasErrors()) {
                        
                    titulo = "Editar Secciones";
                model.addAttribute("titulo", titulo);   
                    
                    return "agregarSeccion";
                }
                    
                    
                    for(String nombreProfesor : seccion.getListaProfesores()){
                        if (!nombreProfesor.trim().equals("")){
                            String[] arrNombres = nombreProfesor.split("\\s");
                             System.out.println("Nombre " + arrNombres[0] + " Apellido " + arrNombres[1]);
                           
                             Set<Profesor> listaProfesoresSeccion = seccion.getSeccionprofesors();
                             Profesor profesor = profesorDao.obtenePorNombre(arrNombres[0],arrNombres[1]);
                             
                                
                             listaProfesoresSeccion.add(profesor);
                             
                             
                             
                        }
                    }
                    
                    System.out.println("Seccion  Id " + seccion.getCodSeccion());
                    
                    System.out.println("Id Taller " + seccion.getTaller().getIdTaller());
                    
               
                    
                    
                    Taller taller = tallerDao.obtenerPorId(seccion.getTaller().getIdTaller()); 
                    
                    //System.out.println("Id Profesor " + seccion.getProfesors().getIdProfesor() );
                    //Profesor profesor = this.profesorDao.obtenerPorId(seccion.getProfesors().getIdProfesor());
                    
                    //seccion.setProfesor(profesor);
                    
                     
                            seccion.setTaller(taller); 
                            
                            seccionDao.guardarSeccion(seccion);
                      
                    
                    

                    return "redirect:agregarSeccion.do?idTaller="+taller.getIdTaller() + "&codSeccion=" + seccion.getCodSeccion();
                
        }

         @RequestMapping(value = "/agregarDiasSeccion.do", method = RequestMethod.GET)
	public String agregarDiasSeccion(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion )
         {
                Seccion seccion = this.seccionDao.obtenerPorId(codSeccion);
                
                
                model.addAttribute("titulo","Agregar Horarios a Seccion");
                model.addAttribute("seccion",seccion);
                return "agregarDiasSeccion";
         }
         public @ModelAttribute("diasSeccionForm")
    DiasSeccionForm setupForm() {
        return new DiasSeccionForm();
    }
         
         
        @RequestMapping(value = "/agregarDiasSeccion.do",method = RequestMethod.POST)
	public String agregarDiasSeccion(Model model,
		@ModelAttribute("diaSeccion")  Diasseccion diaSeccion,
                BindingResult bindResult) 
        {
       
                System.out.println("Lugar dia seccion " + diaSeccion.getLugar());
                System.out.println("codigo seccion " + diaSeccion.getSeccion().getCodSeccion());
                System.out.println("Hora inicio Dia seccion " + diaSeccion.getHoraInicio());               
                System.out.println("Hora Fin Dia seccion " + diaSeccion.getHoraFin());
                
                Seccion seccion = this.seccionDao.obtenerPorId(diaSeccion.getSeccion().getCodSeccion());
                Taller taller = this.tallerDao.obtenerPorId(seccion.getTaller().getIdTaller());
                
                
                seccion.getDiasseccions().add(diaSeccion);
                diaSeccion.setSeccion(seccion);
                this.diasseccionDao.guardarDiasseccion(diaSeccion);
                
                return "redirect:agregarSeccion.do?idTaller="+taller.getIdTaller() + "&codSeccion=" + seccion.getCodSeccion();
        }
    
       @RequestMapping(value = "/eliminarDiasSeccion.do", method = RequestMethod.GET)
	public String eliminarDiassSeccion(Model model, @RequestParam(value = "idDiasSeccion", defaultValue = "0") int idDiasSeccion,
        @RequestParam(value = "idTaller", defaultValue = "0") int idTaller
               , @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion )
         { 
                Diasseccion diasseccion = this.diasseccionDao.obtenerPorId(idDiasSeccion);
                
                this.diasseccionDao.eliminar(diasseccion);
                
                return "redirect:agregarSeccion.do?idTaller="+ idTaller + "&codSeccion=" + codSeccion;
         }
       
       
       @RequestMapping(value = "/eliminarSeccionTaller.do", method = RequestMethod.GET)
	public String eliminarSeccionTaller(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion)
         { 
             List<String> errores = new ArrayList<String>();
             int idTaller = 0;
             try{   
             Seccion seccion  = this.seccionDao.obtenerPorId(codSeccion);
                idTaller = seccion.getTaller().getIdTaller();
                
                
                this.seccionDao.eliminar(seccion);
             }catch(Exception e){
                 errores.add("No se puede eliminar, verifique si existe algun alumno inscrito en esta seccion" );
             }
                //model.addAttribute("errores",errores);
                
                return "redirect:agregarTaller.do?idTaller="+ idTaller;
         }
       
}   
