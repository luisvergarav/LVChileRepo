/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import model.Dao.AlumnoDao;
import model.Dao.InstitucionDao;
import model.Dao.SeccionDao;
import model.Dao.TallerDao;
import model.Entitys.Alumno;
import model.Entitys.Institucion;
import model.Entitys.Seccion;
import model.Entitys.Semestre;
import model.Entitys.Taller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
/**
 *
 * @author Luis
 */
@Controller
@RequestMapping("/informes")
public class InformesController {
    @Autowired
    InstitucionDao institucionDao;
    @Autowired
    AlumnoDao alumnoDao;
    @Autowired
    SeccionDao seccionDao;
    @Autowired
    TallerDao tallerDao;

        //Busqueda alumno para ver sus inscripciones
        //para ver inscripciones del alumno a talleres
         @RequestMapping(value = "/informeSeccionesAlumno.do", method = RequestMethod.GET)
	public String informeSeccionesAlumnoGet(Model model, @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno)
         {
              Set<Alumno> alumnos = new HashSet<Alumno>();
              
             if (!rutAlumno.equals("0")){
              alumnos.add(this.alumnoDao.obtenerPorId(rutAlumno));
             }
             
              model.addAttribute("alumnos",alumnos);
              return "informeSeccionesAlumno";
             
         }
         
         
         @RequestMapping(value = "/informeSeccionesAlumno.do",method = RequestMethod.POST)
	public String informeSeccionesAlumnoPost(
		Model model,@RequestParam(value = "busqueda", defaultValue = "0") String rutAlumno) { 
                Set<Alumno> alumnos = new HashSet<Alumno>();
                
                System.out.println("rutBusqueda  -->" + rutAlumno );
                if (!rutAlumno.equals("0")){
                    alumnos.add(this.alumnoDao.obtenerPorId(rutAlumno));
                }
                
              model.addAttribute("alumnos",alumnos);
                return "informeSeccionesAlumno";
         }
         //post para busqueda alumno para ver sus descripciones.
         //para ver inscripciones del alumno a talleres
         @RequestMapping(value = "/informeSeccionesAlumnoPdf.do", method = RequestMethod.GET)
	public String informeSeccionesAlumnoGetPdf(Model model, @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno)
         {
             Alumno alumno = new Alumno();
              Institucion inst = this.institucionDao.obtenerTodos().get(0);
                 Semestre semestreActivo = new Semestre();
                 
                if (!rutAlumno.equals("0")){
                   alumno =  this.alumnoDao.obtenerPorId(rutAlumno);
                }
                
                 for(Semestre sem:(Set<Semestre>) inst.getSemestres()){
                    if (sem.getActivo() > 0){
                        semestreActivo = sem;
                    }
                }
                
                 model.addAttribute("alumno",alumno);
                 model.addAttribute("semestre",semestreActivo);
                return "informeSeccionesAlumnoPdf";
         }
         //ok
     @RequestMapping(value = "/informeAlumnoSeccion.do", method = RequestMethod.GET)
	public String informeAlumnoSeccion(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion)
         {
             Institucion inst = this.institucionDao.obtenerTodos().get(0);
             Seccion seccion = this.seccionDao.obtenerPorId(codSeccion);
             
             Semestre semestreActivo = new Semestre();
                
                for(Semestre sem:(Set<Semestre>) inst.getSemestres()){
                    if (sem.getActivo() > 0){
                        semestreActivo = sem;
                    }
                }

             
              model.addAttribute("alumnos",seccion.getAlumnoseccions());
              model.addAttribute("semestre",semestreActivo);
             model.addAttribute("seccion",seccion);
              
              
              return "PdfReportView";
         }
     //ok
     @RequestMapping(value = "/informeSecciones.do", method = RequestMethod.GET)
	public String informeSeleccion(Model model,@RequestParam(value = "idTaller", defaultValue = "0") int idTaller)             
         {
                
                Taller taller  = new Taller();
                
                if (idTaller > 0 ){
                    taller = this.tallerDao.obtenerPorId(idTaller);
                }
                
                model.addAttribute("secciones",taller.getSeccions());
                return "informeSecciones";
         }
     //ok
     @RequestMapping(value = "/informesPorTaller.do", method = RequestMethod.GET)
	public String informeSeleccion(Model model)             
         {
                Semestre semestre = new Semestre();
                
                 for(Semestre sem : (Set<Semestre>) this.institucionDao.obtenerTodos().get(0).getSemestres()){
                     if (sem.getActivo() > 0) semestre =  sem ;
                 }                   
                
                model.addAttribute("semestre", semestre);
                return "informesPorTaller";
         }
     
     @RequestMapping(value = "/jasperReportAlumno.do", method = RequestMethod.GET)
	public void informeAlumno(Model model,@RequestParam(value = "busqueda", defaultValue = "0") String rutAlumno)             
         {
     
      try
        {
            /*
            JasperReport jasperReport = null;
            JasperPrint jasperPrint = null;
            JasperDesign jasperDesign = null;
            Map parameters = new HashMap();
            jasperDesign = JRXmlLoader.load("c:/alumnos.jrxml");
            jasperReport = JasperCompileManager.compileReport(jasperDesign);
            jasperPrint  = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(alumnoDao.obtenerPorId(rutAlumno).getAlumnoseccions()));
            JasperExportManager.exportReportToPdfFile(jasperPrint,"StudentInfo.pdf");
            JasperViewer.viewReport(jasperPrint);
                    */
        }
        catch(Exception ex)
        {
            System.out.println("EXCEPTION: "+ex);
        }
         }
}
