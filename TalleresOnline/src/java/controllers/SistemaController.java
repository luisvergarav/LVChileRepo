/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import validators.ProfesorValidator;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import model.Dao.AlumnoDao;
import model.Dao.ApoderadoDao;
import model.Dao.InstitucionDao;
import model.Dao.ProfesorDao;
import model.Dao.SemestreDao;
import model.Dao.SemestreDaoImpl;
import model.Dao.TipoTallerDao;
import model.Dao.UserDao;
import model.Dao.UserRolesDao;
import model.Entitys.Alumno;
import model.Entitys.Apoderado;
import model.Entitys.Institucion;
import model.Entitys.Profesor;
import model.Entitys.Semestre;
import model.Entitys.TipoTaller;
import model.Entitys.UserRoles;
import model.Entitys.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import validators.ApoderadoValidator;
import validators.UsuarioValidator;
/**
 *
 * @author Luis
 */
@Controller
@RequestMapping("/sistema")
@SessionAttributes({"usuario","apoderado"})
public class SistemaController {
      @Autowired
    InstitucionDao institucionDao;
      @Autowired
    AlumnoDao alumnoDao;

      
      @Autowired
    ApoderadoDao apoderadoDao;

      @Autowired
    ProfesorDao profesorDao;
                  @Autowired
    Users usuario;
@Autowired                  
    Apoderado apoderado;              

      @Autowired
     TipoTallerDao tipoTallerDao;
    @Autowired
    SemestreDao semestreDao;

        @Autowired
    UserDao userDao;

        @Autowired
    UserRolesDao userRolesDao;

        private String titulo;
      
      private static List<Apoderado> listaApoderados = new ArrayList<Apoderado>();

          @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        // You can register other Custom Editors with the WebDataBinder, like CustomNumberEditor for Integers and Longs, or StringTrimmerEditor for Strings
    }   

      
      @ModelAttribute("apoderado")  
    public Apoderado createApoderado() {  
        return apoderado;  
    }
      
    public List<Apoderado> getListaApoderados() {
        return listaApoderados;
    }

    public void setListaApoderados(List<Apoderado> listaApoderados) {
        this.listaApoderados = listaApoderados;
    }
              
      
      @ModelAttribute("usuario")  
    public Users createUsuario() {  
        return usuario;  
    }
      
     @RequestMapping(value = "/configuracion.do", method = RequestMethod.GET)
	public String configuracion(Model model, @RequestParam(value = "rutInstitucion", defaultValue = "0") int rutInstitucion)
         {
              Institucion inst = this.institucionDao.obtenerTodos().get(0);  
              List<Profesor> listaProfesoresInstitucion = new ArrayList<Profesor>();
              
              for(TipoTaller tipoTaller :(Set<TipoTaller>) inst.getTipoTallers()){
                    listaProfesoresInstitucion.addAll(tipoTaller.getProfesors());
              }
              model.addAttribute("institucion",inst);
              model.addAttribute("listaProfesoresInstitucion",listaProfesoresInstitucion);
              
              
              return "configuracion";
         }
     
      @RequestMapping(value = "/configuracion.do",method = RequestMethod.POST)
	public String guardarInstitucion(
		Model model,@ModelAttribute  Institucion institucion,
		BindingResult result) { 
                this.institucionDao.guardarInstitucion(institucion);
          
                return "redirect:configuracion.do?rutInstitucion=" + institucion.getRutInstitucion();
          
      }
      
           
       @RequestMapping(value = "/agregarProfesor.do", method = RequestMethod.GET)
	public String agregarProfesor(Model model, @RequestParam(value = "idProfesor", defaultValue = "0") String idProfesor)
         {
             Profesor profesor = new Profesor();
             titulo = "Creando  Profesor";
             if (!idProfesor.equals("0")){
                     titulo = "Editando  Profesor";
                     profesor = this.profesorDao.obtenerPorId(idProfesor);
             }
              
              model.addAttribute("listaTipoTaller",this.tipoTallerDao.obtenerTodos());
              model.addAttribute("profesor",profesor);
              model.addAttribute("titulo",titulo);
              return "agregarProfesor";
             
         }
       
       @RequestMapping(value = "/agregarProfesor.do", method = RequestMethod.POST)
	public String agregarProfesorForm(Model model,
		@ModelAttribute("profesor")  Profesor profesor,
                BindingResult bindResult)
         {
                ProfesorValidator profesorValidator = new ProfesorValidator();
                profesorValidator.validate(profesor, bindResult);

		if (bindResult.hasErrors()) {
			
			model.addAttribute("profesor", profesor);
			 model.addAttribute("listaTipoTaller",this.tipoTallerDao.obtenerTodos());
			model.addAttribute("titulo", "Validando");
			return "agregarProfesor";
		}
             
                this.profesorDao.guardarProfesor(profesor);
                Institucion inst = this.institucionDao.obtenerTodos().get(0);               
                
                model.addAttribute("institucion",inst);

return "redirect:configuracion.do";
                
         
             
         }
       
                  
       @RequestMapping(value = "/activarSemestre.do", method = RequestMethod.GET)
	public String agregarProfesor(Model model, @RequestParam(value = "idSemestre", defaultValue = "0") int idSemestre)
         {
             
             Semestre semestre = new Semestre();
             if (idSemestre > 0){
                     
                     
                     for(Semestre sem:this.semestreDao.obtenerTodos()){
                         sem.setActivo(0);
                        semestreDao.guardarSemestre(sem);
                     }
                     semestre = this.semestreDao.obtenerPorId(idSemestre);
                     semestre.setActivo(1);
                     semestreDao.guardarSemestre(semestre);
                     return "redirect:configuracion.do";
             }
             return "redirect:configuracion.do";
             
         }
         
       @RequestMapping(value = "/crearUsuario.do", method = RequestMethod.GET)
	public String crearUsuario(Model model)
         {
             Users usuario = new Users();
             Apoderado apoderado = new Apoderado();
             
             
             
             List<String> listaRolesDisponibles = new ArrayList<String>();
             
             listaRolesDisponibles.add("ROLE_USER");
             listaRolesDisponibles.add("ROLE_SUPER");
             listaRolesDisponibles.add("ROLE_COORDINADOR");
             
             
             int i= 0;
                String[] lrTmp = new String[usuario.getUserRoleses().size()];
                
             for (UserRoles ur:(Set<UserRoles>) usuario.getUserRoleses()){
                     lrTmp[i] = ur.getAuthority();
                     i++;
                }
                usuario.setRoles(lrTmp);
                
                usuario.getApoderados().add(apoderado);
                model.addAttribute("titulo","Crear Usuario");
                model.addAttribute("usuario",usuario);
                //model.addAttribute("apoderado",apoderado);
                model.addAttribute("listaRolesDisponibles",listaRolesDisponibles);
                
             return "agregarUsuario";
         }
       @RequestMapping(value = "/crearApoderado.do", method = RequestMethod.GET)
	public String crearApoderado(Model model)
         {
             
             model.addAttribute("apoderado",new Apoderado());
             model.addAttribute("titulo","Creando Apoderado");
             model.addAttribute("alumno",new Alumno());
             return "editarApoderado";
         }
       @RequestMapping(value = "/crearUsuario.do",method = RequestMethod.POST)
	public String crearUsuario(
		Model model,
                @ModelAttribute("usuario") Users usuario,
		BindingResult result) {

                UsuarioValidator userValidator = new UsuarioValidator();
                
                userValidator.validate(usuario, result);
                if (!result.hasErrors()){
                            Set<UserRoles> listaRolesUsuario = usuario.getUserRoleses();
                            for(UserRoles ur : listaRolesUsuario){
                                userRolesDao.eliminarUserRoles(ur);
                            }
                        
                userDao.guardarUsuario(usuario);
                
                               
                        
                
                       for(String rol : usuario.getRoles()){
                           
                           
                        if  (!rol.trim().equals("")){
                            
                             System.out.println("Rol " + rol);
                           
                             
                             
                             UserRoles nuevoRol = new UserRoles();
                             
                             nuevoRol.setUsers(userDao.obtenerPorUserName(usuario.getUsername()));
                             
                             
                             
                             nuevoRol.setAuthority(rol);                                                                                     
                                
                             listaRolesUsuario.add(nuevoRol);
                             
                             
                             
                             userRolesDao.guardarUserRole(nuevoRol);
                             
                             

                             
                             
                        }
                    }
                       
                       List<Users> listaUsuarios = userDao.obtenerTodos();
                       
                       model.addAttribute("listaUsuarios",listaUsuarios);
                    model.addAttribute("titulo","Listado de Usuarios");
                       return "listaUsuarios";
                       
                }else{
                                 List<String> listaRolesDisponibles = new ArrayList<String>();
             
             listaRolesDisponibles.add("ROLE_USER");
             listaRolesDisponibles.add("ROLE_SUPER");
             listaRolesDisponibles.add("ROLE_COORDINADOR");
             
             
             int i= 0;
                String[] lrTmp = new String[usuario.getUserRoleses().size()];
                
             for (UserRoles ur:(Set<UserRoles>) usuario.getUserRoleses()){
                     lrTmp[i] = ur.getAuthority();
                     i++;
                }
                usuario.setRoles(lrTmp);

                    model.addAttribute("usuario",usuario);
                            model.addAttribute("titulo","Verificando");    
                            model.addAttribute("listaRolesDisponibles",listaRolesDisponibles);
                       return "agregarUsuario";
                }
                       
                
        
       }

       @RequestMapping(value = "/listaUsuarios.do", method = RequestMethod.GET)
	public String listaUsuarios(Model model)
         {
             List<Users> listaUsuarios = userDao.obtenerTodos();
             
             model.addAttribute("titulo","Listado de Usuarios");
             model.addAttribute("listaUsuarios",listaUsuarios);
                       return "listaUsuarios";
             

         }
       
       @RequestMapping(value = "/editarUsuario.do", method = RequestMethod.GET)
	public String editarUsuario(Model model,
         @RequestParam(value = "userId", defaultValue = "0") long userId)
         {
             
             
           
             if (userId > 0) usuario = userDao.obtenerPorId(userId);
             
             
             
             
             List<String> listaRolesDisponibles = new ArrayList<String>();
             
             listaRolesDisponibles.add("ROLE_USER");
             listaRolesDisponibles.add("ROLE_SUPER");
             listaRolesDisponibles.add("ROLE_COORDINADOR");
             
             
             int i= 0;
                String[] lrTmp = new String[usuario.getUserRoleses().size()];
                
             for (UserRoles ur:(Set<UserRoles>) usuario.getUserRoleses()){
                     lrTmp[i] = ur.getAuthority();
                     i++;
                }
                usuario.setRoles(lrTmp);
             
                model.addAttribute("titulo","Editar Usuario");
                model.addAttribute("usuario",usuario);     
                
                model.addAttribute("apoderado",apoderado);
                
                model.addAttribute("listaRolesDisponibles",listaRolesDisponibles);
             
             return "agregarUsuario";
             
         }
       @RequestMapping(value = "/editarApoderado.do", method = RequestMethod.GET)
	public String editarApoderado(Model model,
         @RequestParam(value = "rutApoderado", defaultValue = "0") String rutApoderado,
       
         @ModelAttribute("apoderado") Apoderado apoderado, 
         BindingResult result) 
       {
           
             apoderado = apoderadoDao.obtenerPorId(rutApoderado);
             model.addAttribute("apoderado",apoderado);
             model.addAttribute("titulo","Editando Apoderado");
             model.addAttribute("alumno",new Alumno());
             return "editarApoderado";
         }
       @RequestMapping(value = "/crearApoderado.do",method = RequestMethod.POST)
	public String crearApoderado(
		Model model,@ModelAttribute("usuario")  Users usuario,
                @ModelAttribute Apoderado apoderado,
		BindingResult result) {
                
                ApoderadoValidator apoderadoValidator = new ApoderadoValidator();
                
                apoderadoValidator.validate(apoderado,result);
                
                if (!result.hasErrors()){
                apoderado.setUsuario(usuario);
                apoderadoDao.guardarApoderado(apoderado);
                
                return "redirect:listaUsuarios.do";
            
                
                } 
                model.addAttribute("rutApoderado",apoderado.getRutApoderado());
                model.addAttribute("alumno",new Alumno());
                model.addAttribute("titulo","Editando Apoderado");
                 return "editarApoderado";
      }

              @RequestMapping(value = "/crearAlumno.do",method = RequestMethod.POST)
	public String crearAlumno(
		Model model,@ModelAttribute("alumno")  Alumno alumno,
                @ModelAttribute("apoderado") Apoderado apoderado,
		BindingResult result) {

                alumno.setSemestre(semestreDao.obtenerActivo());                    
                alumno.setApoderado(apoderadoDao.obtenerPorId(apoderado.getRutApoderado()));
                alumnoDao.guardarAlumno(alumno);
           
                return "redirect:listaUsuarios.do";
      }

}
