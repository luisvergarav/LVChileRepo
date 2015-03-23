/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import models.VO.CartBean;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dao.AlumnoDao;
import model.Dao.ChequeDao;
import model.Dao.FormaPagoDao;
import model.Dao.InscripcionGratisDao;
import model.Dao.InscripcionPagadaDao;
import model.Dao.InscripcionPagadaDaoImpl;
import model.Dao.InstitucionDao;
import model.Dao.PagoDao;
import model.Dao.ProfesorDao;
import model.Dao.SeccionDao;
import model.Dao.SemestreDao;
import model.Dao.TallerDao;
import model.Dao.UserDao;
import model.Entitys.Alumno;
import model.Entitys.Apoderado;
import model.Entitys.Cheque;
import model.Entitys.Institucion;
import model.Entitys.Pagada;
import model.Entitys.Pago;
import model.Entitys.Profesor;
import model.Entitys.Seccion;

import model.Entitys.Taller;
import model.Entitys.TipoTaller;
import model.Entitys.Formapago;
import model.Entitys.Gratis;
import model.Entitys.GratisId;
import model.Entitys.PagadaId;
import model.Entitys.Semestre;
import model.Entitys.Users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.userdetails.User;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.reflect.generics.tree.FormalTypeParameter;

/**
 *
 * @author Luis
 */
@Controller
@RequestMapping("/inscripciones")
@SessionAttributes({"cart", "alumno", "semestre","pago"})
public class InscripcionController {

    @Autowired
    FormaPagoDao formaPagoDao;
    @Autowired
    ChequeDao chequeDao;
    @Autowired
    PagoDao pagoDao;
    @Autowired
    CartBean cartBean;
    @Autowired
    Alumno alumno;
    @Autowired
    Pago pago;
    @Autowired
    TallerDao tallerDao;
    @Autowired
    SeccionDao seccionDao;
    @Autowired
    InstitucionDao institucionDao;
    @Autowired
    ProfesorDao profesorDao;
    @Autowired
    InscripcionPagadaDao inscripcionPagadasDao;
    @Autowired
    AlumnoDao alumnoDao;
    @Autowired
    InscripcionGratisDao inscripcionGratisDao;
    @Autowired
    InscripcionPagadaDao inscripcionPagadaDao;
    @Autowired
    UserDao userDao;
    @Autowired
    SemestreDao semestreDao;
    private String titulo;

    @ModelAttribute("cart")
    public CartBean createCart() {
        return cartBean;
    }

    @ModelAttribute("pago")
    public Pago createPago() {
        if (pago == null ) pago = new Pago();
        return pago;
    }
    
    @ModelAttribute("alumno")
    public Alumno createAlumno() {
        return alumno;
    }

    @ModelAttribute("semestre")
    public Semestre createSemestre() {
        Semestre semestreTmp = null;


        for (Semestre semestre : (Set<Semestre>) institucionDao.obtenerTodos().get(0).getSemestres()) {
            if (semestre.getActivo() == 1) {
                semestreTmp = semestre;
            }
        }

        return semestreTmp;
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        // You can register other Custom Editors with the WebDataBinder, like CustomNumberEditor for Integers and Longs, or StringTrimmerEditor for Strings
    }   
    
    
    @RequestMapping(value = "/inscribirAlumno.do", method = RequestMethod.GET)
    public String form(Model model, @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "rutAlumno", defaultValue = "") String rutAlumno,
            @ModelAttribute("semestre") Semestre semestre) {
        semestre = this.createSemestre();
        //Alumno alumno = new Alumno();
        Gratis gratis = new Gratis();
        List<Taller> listaTalleres = new ArrayList<Taller>();
        List<String> errores = new ArrayList<String>();




        alumno = alumnoDao.obtenerPorId(alumno.getRutAlumno());

        if (alumno == null) {
            errores.add("Alumno no encontrado!");
            model.addAttribute("listaTalleresDisponibles", listaTalleres);
            model.addAttribute("errores", errores);
            model.addAttribute("titulo", titulo);
        } else {
            GratisId idGratis = new GratisId();

            idGratis.setInscripcionRutAlumno(alumno.getRutAlumno());

            gratis.setId(idGratis);


            titulo = "En esta pagina ud. puede inscribir su Alumno a los Talleres indicados";






            model.addAttribute("inscripcion", gratis);
            model.addAttribute("alumno", alumno);
            boolean sw = true;

            List<Taller> listaTalleresTmp = new ArrayList<Taller>();

            for (Taller taller : semestre.getTalleres()) {
                if (taller.getClaseTaller().equals("CU")) {
                    for (Gratis g : (Set<Gratis>) alumno.getGratises()) {
                        if (g.getTaller().getIdTaller() == taller.getIdTaller()) {
                            sw = false;
                        }
                    }
                }
                if (taller.getClaseTaller().equals("CO")) {
                    for (Pagada p : (Set<Pagada>) alumno.getPagadas()) {
                        if (p.getTaller().getIdTaller() == taller.getIdTaller() && (p.getEstado() == '1' || p.getEstado() == '2') && p.getPago() != null) {
                            sw = false;
                        }

                    }
                    for (Taller t : cart.getListaTalleres()) {
                        if (t.getIdTaller() == taller.getIdTaller()) {
                            sw = false;
                        }
                    }
                }
                if (sw) {
                    listaTalleresTmp.add(taller);
                }
                sw = true;
            }

            for (Taller taller : listaTalleresTmp) {
                if (taller.getGenero().equals(alumno.getSexo()) || taller.getGenero().equals("X")) {


                    switch (Integer.parseInt(alumno.getCurso())) {
                        case 1:
                            if (taller.getPrimero() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 2:
                            if (taller.getSegundo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 3:
                            if (taller.getTercero() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 4:
                            if (taller.getCuarto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 5:
                            if (taller.getQuinto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 6:
                            if (taller.getSexto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 7:
                            if (taller.getSeptimo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 8:
                            if (taller.getOctavo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 11:
                            if (taller.getPmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 12:
                            if (taller.getSmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 13:
                            if (taller.getTmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 14:
                            if (taller.getCmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -3:
                            if (taller.getPrekinder() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -2:
                            if (taller.getKinder() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -1:
                            if (taller.getJardin() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;


                    }
                }
            }


            model.addAttribute("listaTalleresDisponibles", listaTalleres);
            model.addAttribute("errores", errores);
            model.addAttribute("titulo", titulo);




        }






        return "inscribirAlumno";



    }

    @RequestMapping(value = "/guardarInscripcion.do", method = RequestMethod.GET)
    public String form(
            Model model,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute("semestre") Semestre semestre) {

        //alumno = new Alumno();
        String retorno = "";
        if (idTaller == 0) {
            model.addAttribute("alumno", alumno);
            retorno = "inscribirAlumno.do";
        } else {

            Taller taller = new Taller();
            taller = this.tallerDao.obtenerPorId(idTaller);
            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());
            List<String> errores = new ArrayList<String>();


            if (taller.getCupos() > taller.getInscritos()) {
                if (taller.getClaseTaller().equals("CU")) {
                    if (alumno.getGratises().size() < 2) {
                        Gratis gratis = new Gratis();
                        GratisId gratisId = new GratisId();

                        gratisId.setGratisIdTaller(idTaller);
                        gratisId.setInscripcionRutAlumno(alumno.getRutAlumno());


                        gratis.setSemestre(taller.getSemestre());
                        gratisId.setSemestreIdsemestre(taller.getSemestre().getIdsemestre());


                        Gratis gratisTmp = this.inscripcionGratisDao.obtenerPorId(gratisId);
                        if (gratisTmp == null) {

                            gratis.setInscripcionFechaInscripcion(new Date());
                            gratis.setId(gratisId);
                            gratis.setAlumno(alumno);
                            gratis.setTaller(taller);

                            System.out.println("Rut Alumno " + gratis.getId().getInscripcionRutAlumno());
                            System.out.println("Nombre Alumno " + gratis.getAlumno().getPrimerNombre());
                            System.out.println("Id taller " + gratis.getId().getGratisIdTaller());
                            System.out.println("Fecha Inscripcion " + gratis.getInscripcionFechaInscripcion());
                            System.out.println("Nombre Taller " + gratis.getTaller().getNombreTaller());
                            System.out.println("Clase Taller " + gratis.getTaller().getClaseTaller());
                            System.out.println("CartBean " + this.cartBean.getListaTalleres().size());


                            this.inscripcionGratisDao.guardarInscripcion(gratis);

                            /*
                            Semestre semestre = new Semestre();
                            
                            for(Semestre sem:(Set<Semestre>)this.institucionDao.obtenerTodos().get(0).getSemestres()){
                            if (sem.getActivo()>0) semestre = sem;
                            }
                             */
                            semestre = this.createSemestre();

                            if (!rutAlumno.equals("") && semestre != null) {
                                model.addAttribute("titulo", "Listado Inscripciones");
                                model.addAttribute("alumno", alumno);

                                List<Gratis> listaGratisAlumno = new ArrayList<Gratis>();
                                List<Pagada> listaPagadaAlumno = new ArrayList<Pagada>();

                                for (Taller t : semestre.getTalleres()) {
                                    for (Gratis g : (Set<Gratis>) t.getGratises()) {
                                        if (g.getAlumno().getRutAlumno().equals(alumno.getRutAlumno())) {
                                            listaGratisAlumno.add(g);
                                        }
                                    }

                                    for (Pagada p : (Set<Pagada>) t.getPagadas()) {
                                        if (p.getAlumno().getRutAlumno().equals(alumno.getRutAlumno())) {
                                            listaPagadaAlumno.add(p);
                                        }
                                    }

                                }
                                model.addAttribute("listadoGratis", listaGratisAlumno);
                                model.addAttribute("listadoPagadas", listaPagadaAlumno);
                                model.addAttribute("semestre", this.createSemestre());
                            }

                            model.addAttribute("cart", cart);

                            retorno = "listadoInscripciones";
                        }
                    } else {
                        errores.add("Puede elegir un maximo de 2 talleres curriculares por alumno.");
                        model.addAttribute("rutAlumno", alumno.getRutAlumno());
                    }
                } else {

                    retorno = "redirect:inscribirAlumno.do";
                }

                if (taller.getClaseTaller().equals("CO")) {
                    Pagada pagada = new Pagada();
                    PagadaId pagadaId = new PagadaId();

                    pagadaId.setPagadaIdTaller(idTaller);
                    pagadaId.setInscripcionRutAlumno(alumno.getRutAlumno());



                    pagada.setSemestre(taller.getSemestre());
                    pagadaId.setSemestreIdsemestre(taller.getSemestre().getIdsemestre());

                    Pagada pagadaTmp = this.inscripcionPagadaDao.obtenerPorId(pagadaId);

                    if (pagadaTmp != null) {
                        if (pagadaTmp.getEstado() != '1' && pagadaTmp.getEstado() != '2') {
                            pagadaTmp = null;
                        }
                    }
                    Taller tallerTmp = null;

                    for (Taller t : cart.getListaTalleres()) {
                        if (t.getIdTaller() == taller.getIdTaller()) {
                            tallerTmp = t;
                        }
                    }


                    if (pagadaTmp == null && tallerTmp == null) {

                        pagada.setInscripcionFechaInscripcion(new Date());
                        pagada.setId(pagadaId);
                        pagada.setAlumno(alumno);
                        pagada.setTaller(taller);

                        Date dateTmp = new Date();


                        String ordenCompra = "OC_" + String.valueOf(dateTmp.getTime());
                        pagada.setNumOrdenInscripcion(ordenCompra);

                        System.out.println("Rut Alumno " + pagada.getId().getInscripcionRutAlumno());
                        System.out.println("Nombre Alumno " + pagada.getAlumno().getPrimerNombre());
                        System.out.println("Id taller " + pagada.getId().getPagadaIdTaller());
                        System.out.println("Fecha Inscripcion " + pagada.getInscripcionFechaInscripcion());
                        System.out.println("Nombre Taller " + pagada.getTaller().getNombreTaller());
                        System.out.println("Clase Taller " + pagada.getTaller().getClaseTaller());
                        /*
                        Semestre semestre = new Semestre();
                        
                        for(Semestre sem:(Set<Semestre>)this.institucionDao.obtenerTodos().get(0).getSemestres()){
                        if (sem.getActivo()>0) semestre = sem;
                        }
                         */

                        if (!rutAlumno.equals("") && semestre != null) {

                            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());

                            model.addAttribute("titulo", "Listado Inscripciones");
                            model.addAttribute("alumno", alumno);
                            List<Gratis> listaGratisAlumno = new ArrayList<Gratis>();
                            List<Pagada> listaPagadaAlumno = new ArrayList<Pagada>();

                            for (Taller t : semestre.getTalleres()) {
                                for (Gratis gratis : (Set<Gratis>) t.getGratises()) {
                                    if (gratis.getAlumno().getRutAlumno().equals(alumno.getRutAlumno())) {
                                        listaGratisAlumno.add(gratis);
                                    }
                                }

                                for (Pagada p : (Set<Pagada>) t.getPagadas()) {
                                    if (p.getAlumno().getRutAlumno().equals(alumno.getRutAlumno()) && p.getPago() != null) {
                                        listaPagadaAlumno.add(p);
                                    }
                                }

                            }
                            model.addAttribute("listadoGratis", listaGratisAlumno);
                            model.addAttribute("listadoPagadas", listaPagadaAlumno);


                        }

                        cart.setTotalBolsacompras(cart.getTotalBolsacompras() + taller.getMonto().doubleValue());
                        cart.addToTalleres(taller);

                        errores.add("Se agrego el item correctamente a la bolsa de compras");
                        model.addAttribute("cart", cart);
                        model.addAttribute("errores", errores);

                        retorno = "listadoInscripciones";
                    } else {
                        retorno = "redirect:inscribirAlumno.do";
                    }

                }
            } else {
                errores.add("Cupos del taller selecciondo estan agotados!!!");
            }

            model.addAttribute("rutAlumno", alumno.getRutAlumno());
            model.addAttribute("errores", errores);
            retorno = "redirect:inscribirAlumno.do";
        }
        return retorno;

    }

    @RequestMapping("/seleccionarAlumno.do")
    public String seleccionarAlumno(Model model, @ModelAttribute("cart") CartBean cart, Principal principal,
            @ModelAttribute("semestre") Semestre semestre) {

        String name = principal.getName();

        Users user1 = userDao.obtenerPorUserName(name);

        Set<Apoderado> apoderados = user1.getApoderados();

        Set<Alumno> listaAlumnosApoderado = new HashSet<Alumno>();

        for (Apoderado ap : apoderados) {
            if (ap.getAlumnos().size() > 0) {
                listaAlumnosApoderado.addAll(ap.getAlumnos());
            }
        }

        model.addAttribute("semestreActivo", semestre);
        model.addAttribute("username", name);
        model.addAttribute("message", "Spring Security Custom Form example");




        model.addAttribute("titulo", "Seleccione Alumno");
        model.addAttribute("listaAlumnos", listaAlumnosApoderado);
        model.addAttribute("cart", cart);



        return "seleccionarAlumno";
    }

    @RequestMapping(value = "/listadoInscripciones.do", method = RequestMethod.GET)
    public String listadoInscriptiones(Model model,
            @ModelAttribute("cart") CartBean cart, @ModelAttribute("alumno") Alumno alumno,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("semestre") Semestre semestre) {
        //Alumno alumno = new Alumno();
                /*
        
        for(Semestre sem:(Set<Semestre>)this.institucionDao.obtenerTodos().get(0).getSemestres()){
        if (sem.getActivo()>0) semestre = sem;
        }
         */
        semestre = this.createSemestre();

        if (!rutAlumno.equals("") && semestre != null) {



            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());

            model.addAttribute("titulo", "Listado Inscripciones actuales del Alumno");
            model.addAttribute("alumno", alumno);

            List<Gratis> listaGratisAlumno = new ArrayList<Gratis>();
            List<Pagada> listaPagadaAlumno = new ArrayList<Pagada>();

            for (Taller taller : semestre.getTalleres()) {
                for (Gratis gratis : (Set<Gratis>) taller.getGratises()) {
                    if (gratis.getAlumno().getRutAlumno().equals(alumno.getRutAlumno())) {
                        listaGratisAlumno.add(gratis);
                    }
                }

                for (Pagada pagada : (Set<Pagada>) taller.getPagadas()) {
                    if (pagada.getAlumno().getRutAlumno().equals(alumno.getRutAlumno()) && pagada.getPago() != null) {
                        listaPagadaAlumno.add(pagada);
                    }
                }

            }


            model.addAttribute("listadoGratis", listaGratisAlumno);
            model.addAttribute("listadoPagadas", listaPagadaAlumno);



        }


        model.addAttribute("cart", cart);

        return "listadoInscripciones";
    }

    @RequestMapping(value = "/agregarSeccionInscripcion.do", method = RequestMethod.GET)
    public String listadoSeccionesAlumno(Model model,
            @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
            @ModelAttribute("alumno") Alumno alumno) {
        //alumno = new Alumno();
        Taller taller = new Taller();

        Institucion inst = this.institucionDao.obtenerTodos().get(0);
        Semestre semestreActivo = new Semestre();

        for (Semestre sem : (Set<Semestre>) inst.getSemestres()) {
            if (sem.getActivo() > 0) {
                semestreActivo = sem;
            }
        }

        if (semestreActivo != null) {
            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());
            taller = this.tallerDao.obtenerPorId(idTaller);

            model.addAttribute("titulo", "Listado Secciones Taller");
            model.addAttribute("alumno", alumno);
            model.addAttribute("taller", taller);


            boolean sw = true;
            List<Seccion> listaSeccionTmp = new ArrayList<Seccion>();
            for (Seccion s : (Set<Seccion>) taller.getSeccions()) {
                for (Seccion se : (Set<Seccion>) alumno.getAlumnoseccions()) {
                    if (se.getCodSeccion() == s.getCodSeccion()) {
                        sw = false;
                    }
                }
                if (sw) {
                    listaSeccionTmp.add(s);
                }
                sw = true;
            }



            model.addAttribute("listadoSeccionesDisponibles", listaSeccionTmp);
            model.addAttribute("listadoSeccionesTomadas", alumno.getAlumnoseccions());
            System.out.println("cantidad secciones " + taller.getSeccions().size());



        }




        return "agregarSeccionInscripcion";
    }

    @RequestMapping(value = "/guardarSeccionAlumno.do", method = RequestMethod.GET)
    public String guardarSeccionAlumno(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion,
            @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno) {
        //alumno = new Alumno();
        List<String> errores = new ArrayList<String>();



        Seccion seccion = new Seccion();


        if (codSeccion != 0) {
            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());
            seccion = this.seccionDao.obtenerPorId(codSeccion);

            Set<Alumno> tmpAlumnos = seccion.getAlumnoseccions();

            tmpAlumnos.add(alumno);

            // seccion.setAlumnos(tmpAlumnos);

            Set<Seccion> tmpSecciones = alumno.getAlumnoseccions();

            tmpSecciones.add(seccion);

            // alumno.setSeccions(tmpSecciones);

            this.alumnoDao.guardarAlumno(alumno);
            this.seccionDao.guardarSeccion(seccion);


        } else {
            errores.add("Codigo seccion no existe!");
        }

        model.addAttribute("errores", errores);
        model.addAttribute("alumno", alumno);





        return "redirect:agregarSeccionInscripcion.do?idTaller=" + idTaller;
    }

    @RequestMapping(value = "/eliminarSeccionAlumno.do", method = RequestMethod.GET)
    public String eliminarSeccionAlumno(Model model, @RequestParam(value = "codSeccion", defaultValue = "0") int codSeccion,
            @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno) {

        //alumno = new Alumno();



        Seccion seccion = new Seccion();


        if (codSeccion != 0 && idTaller != 0) {
            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());
            seccion = this.seccionDao.obtenerPorId(codSeccion);

            //Set<Alumno> tmpAlumnos = 
            seccion.getAlumnoseccions().remove(alumno);

            // seccion.setAlumnos(tmpAlumnos);

            Set<Seccion> tmpSecciones = alumno.getAlumnoseccions();
            tmpSecciones.remove(seccion);

            //alumno.setSeccions(tmpSecciones);

            //this.alumnoDao.guardarAlumno(alumno);
            this.seccionDao.guardarSeccion(seccion);
        }









        return "redirect:agregarSeccionInscripcion.do?idTaller=" + idTaller;

    }

    @RequestMapping(value = "/pagarTaller.do", method = RequestMethod.GET)
    public String pagarTaller(
            Model model,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno) {

        BigDecimal montoPagar = new BigDecimal(0);

        //alumno = new Alumno();

        String retorno = "pagarTaller";

        List<Pagada> inscripcionesPagar = new ArrayList<Pagada>();

        Date dateTmp = new Date();



        String ordenCompra = "OC_" + String.valueOf(dateTmp.getTime());


        alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());




        for (Taller t : cart.getListaTalleres()) {



            Pagada pagada = new Pagada();
            PagadaId pagadaId = new PagadaId();


            pagadaId.setPagadaIdTaller(t.getIdTaller());
            pagadaId.setInscripcionRutAlumno(alumno.getRutAlumno());



            pagada.setSemestre(t.getSemestre());
            pagadaId.setSemestreIdsemestre(t.getSemestre().getIdsemestre());

            Pagada pagadaTmp = this.inscripcionPagadaDao.obtenerPorId(pagadaId);

            if (pagadaTmp != null) {
                if (pagadaTmp.getPago() == null || (pagadaTmp.getEstado() != '1' && pagadaTmp.getEstado() != '2')) {

                    pagadaTmp.setInscripcionFechaInscripcion(new Date());




                    pagadaTmp.setNumOrdenInscripcion(ordenCompra);



                    System.out.println("Rut Alumno " + pagadaTmp.getId().getInscripcionRutAlumno());
                    System.out.println("Nombre Alumno " + pagadaTmp.getAlumno().getPrimerNombre());
                    System.out.println("Id taller " + pagadaTmp.getId().getPagadaIdTaller());
                    System.out.println("Fecha Inscripcion " + pagadaTmp.getInscripcionFechaInscripcion());
                    System.out.println("Nombre Taller " + pagadaTmp.getTaller().getNombreTaller());
                    System.out.println("Clase Taller " + pagadaTmp.getTaller().getClaseTaller());

                    //para pagar taller
                    this.inscripcionPagadaDao.guardarInscripcion(pagadaTmp);


                    montoPagar = montoPagar.add(pagadaTmp.getTaller().getMonto());
                    model.addAttribute("transaccion", pagadaTmp.getTransaccion());


                }
            }

            if (pagadaTmp == null) {

                pagada.setInscripcionFechaInscripcion(new Date());
                pagada.setId(pagadaId);
                pagada.setAlumno(alumno);
                pagada.setTaller(t);



                pagada.setNumOrdenInscripcion(ordenCompra);



                System.out.println("Rut Alumno " + pagada.getId().getInscripcionRutAlumno());
                System.out.println("Nombre Alumno " + pagada.getAlumno().getPrimerNombre());
                System.out.println("Id taller " + pagada.getId().getPagadaIdTaller());
                System.out.println("Fecha Inscripcion " + pagada.getInscripcionFechaInscripcion());
                System.out.println("Nombre Taller " + pagada.getTaller().getNombreTaller());
                System.out.println("Clase Taller " + pagada.getTaller().getClaseTaller());

                //para pagar taller
                this.inscripcionPagadaDao.guardarInscripcion(pagada);


                montoPagar = montoPagar.add(pagada.getTaller().getMonto());
                model.addAttribute("transaccion", pagada.getTransaccion());

            }
        }
        model.addAttribute("ordenCompra", ordenCompra);
        model.addAttribute("montoPagar", montoPagar);
        model.addAttribute("cart", cart);

        return retorno;
    }

    @RequestMapping(value = "/verBolsa.do", method = RequestMethod.GET)
    public String verBolsa(
            Model model,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno) {

        BigDecimal montoPagar = new BigDecimal(0);

        //alumno = new Alumno();

        String retorno = "bolsaCompras";





        alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());


        model.addAttribute("alumno", alumno);
        model.addAttribute("cart", cart);

        return retorno;
    }

    @RequestMapping(value = "/pagoCheque.do", method = RequestMethod.GET)
    public String pagoCheque(
            Model model,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute Pago pago) {
        
       if (pago.getIdPago() == 0){
           pago = new Pago();
       }

        pago.setFormapago(formaPagoDao.obtenerPorId(3));
        model.addAttribute("pago", pago);
        model.addAttribute("cheque",new Cheque());

        model.addAttribute("titulo", "Ingrese Datos del Cheque");

        return "pagoCheque";


    }

    @RequestMapping(value = "/pagoCheque.do", method = RequestMethod.POST)
    public String pagoChequePost(
            Model model,@ModelAttribute Pago pago,
            @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute("cart") CartBean cart,
      
            BindingResult result) {

        BigDecimal montoPagar = new BigDecimal(0);

        //alumno = new Alumno();

        String retorno = "pagoCheque";

        List<Pagada> inscripcionesPagar = new ArrayList<Pagada>();

        Date dateTmp = new Date();



        String ordenCompra = "OC_" + String.valueOf(dateTmp.getTime());


        alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());




        for (Taller t : cart.getListaTalleres()) {



            Pagada pagada = new Pagada();
            PagadaId pagadaId = new PagadaId();


            pagadaId.setPagadaIdTaller(t.getIdTaller());
            pagadaId.setInscripcionRutAlumno(alumno.getRutAlumno());



            pagada.setSemestre(t.getSemestre());
            pagadaId.setSemestreIdsemestre(t.getSemestre().getIdsemestre());

            Pagada pagadaTmp = this.inscripcionPagadaDao.obtenerPorId(pagadaId);

            if (pagadaTmp != null) {
                if (pagadaTmp.getPago() == null || (pagadaTmp.getEstado() != '1' && pagadaTmp.getEstado() != '2')) {

                    pagadaTmp.setInscripcionFechaInscripcion(new Date());

                    pagadaTmp.setEstado('2');
                    pagadaTmp.setFracaso(0);














                    pagadaTmp.setNumOrdenInscripcion(ordenCompra);



                    System.out.println("Rut Alumno " + pagadaTmp.getId().getInscripcionRutAlumno());
                    System.out.println("Nombre Alumno " + pagadaTmp.getAlumno().getPrimerNombre());
                    System.out.println("Id taller " + pagadaTmp.getId().getPagadaIdTaller());
                    System.out.println("Fecha Inscripcion " + pagadaTmp.getInscripcionFechaInscripcion());
                    System.out.println("Nombre Taller " + pagadaTmp.getTaller().getNombreTaller());
                    System.out.println("Clase Taller " + pagadaTmp.getTaller().getClaseTaller());

                    //para pagar taller
                    //this.inscripcionPagadaDao.guardarInscripcion(pagada);
                    pago.setFormapago(formaPagoDao.obtenerPorId(3));
                    pago.getPagadas().add(pagadaTmp);

                    pagoDao.guardarPago(pago);
                    pagadaTmp.setPago(pago);
                    inscripcionPagadasDao.guardarInscripcion(pagadaTmp);



                    montoPagar = montoPagar.add(pagadaTmp.getTaller().getMonto());
                    model.addAttribute("transaccion", pagadaTmp.getTransaccion());

                }

            }

            if (pagadaTmp == null) {










                pagada.setInscripcionFechaInscripcion(new Date());
                pagada.setId(pagadaId);
                pagada.setAlumno(alumno);
                pagada.setTaller(t);
                pagada.setEstado('2');
                pagada.setFracaso(0);














                pagada.setNumOrdenInscripcion(ordenCompra);



                System.out.println("Rut Alumno " + pagada.getId().getInscripcionRutAlumno());
                System.out.println("Nombre Alumno " + pagada.getAlumno().getPrimerNombre());
                System.out.println("Id taller " + pagada.getId().getPagadaIdTaller());
                System.out.println("Fecha Inscripcion " + pagada.getInscripcionFechaInscripcion());
                System.out.println("Nombre Taller " + pagada.getTaller().getNombreTaller());
                System.out.println("Clase Taller " + pagada.getTaller().getClaseTaller());

                //para pagar taller
                //this.inscripcionPagadaDao.guardarInscripcion(pagada);
                pago.setFormapago(formaPagoDao.obtenerPorId(3));
                pago.getPagadas().add(pagada);


                
                
                pagoDao.guardarPago(pago);
                pagada.setPago(pago);
                inscripcionPagadasDao.guardarInscripcion(pagada);



                montoPagar = montoPagar.add(pagada.getTaller().getMonto());
           

            }
        }
      
        model.addAttribute("pago", pagoDao.obtenerPorId(pago.getIdPago()));
        model.addAttribute("cheque", new Cheque());
        cart = new CartBean();


        return retorno;

    }

     @RequestMapping(value = "/guardarCheque.do", method = RequestMethod.POST)
    public String guardarChequePost(
            Model model, @ModelAttribute("pago") Pago pago,
            @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute("cart") CartBean cart,
            @ModelAttribute("cheque") Cheque cheque,
            BindingResult result) {
         
         
                
                cheque.setBanco(pago.getBanco());                
                cheque.setTitular(pago.getTitular());
                cheque.setFechaPago(new Date());
                cheque.setPago(pago);
                pago.getCheques().add(cheque);
                pagoDao.guardarPago(pago);
                
                chequeDao.guardarCheque(cheque);
                
        model.addAttribute("pago", pago);
        model.addAttribute("cheque", new Cheque());
        model.addAttribute("titulo", "Ingrese Datos del Cheque");

        return "pagoCheque";
            
            
     }
    
    @RequestMapping(value = "/activar/listadoInscripcionesPendientes.do", method = RequestMethod.GET)
    public String listadoInscriptionesPendientes(Model model,
            @ModelAttribute("semestre") Semestre semestre) {
        
        semestre = this.createSemestre();
        
        List<Pagada> listaPendientes = new ArrayList<Pagada>();

        for (Taller t : semestre.getTalleres()) {
            for (Pagada p : (Set<Pagada>) t.getPagadas()) {
                System.out.println("p.getNumOrdenInscripcion(); " + p.getNumOrdenInscripcion());
                System.out.println("p.getEstado() " + p.getEstado());
                if (p.getEstado() == '2') {
                    listaPendientes.add(p);
                    p.getNumOrdenInscripcion();
                    System.out.println("guardando");
                }
            }
        }
        model.addAttribute("listaPendientesCheques", listaPendientes);
        model.addAttribute("semestre", semestre);
        return "listadoPendientesCheques";
    }

    @RequestMapping(value = "/activar/activarPago.do", method = RequestMethod.GET)
    public String activarPago(Model model,
            @RequestParam(value = "idPago", defaultValue = "0") int idPago,
            @ModelAttribute("semestre") Semestre semestre) {
        Pago pago = null;
        if (idPago != 0) {
            pago = pagoDao.obtenerPorId(idPago);
            for (Pagada p : (Set<Pagada>) pago.getPagadas()) {
                p.setEstado('1');
                inscripcionPagadasDao.guardarInscripcion(p);


            }

        }

        //model.addAttribute("semestre", semestre);
        return "redirect:listadoInscripcionesPendientes.do";
    }

    @RequestMapping(value = "/activar/rechazarPago.do", method = RequestMethod.GET)
    public String rechazarPago(Model model,
            @RequestParam(value = "idPago", defaultValue = "0") int idPago,
            @ModelAttribute("semestre") Semestre semestre) {
        Pago pago = null;
        if (idPago != 0) {
            pago = pagoDao.obtenerPorId(idPago);
            for (Pagada p : (Set<Pagada>) pago.getPagadas()) {
                p.setEstado('3');
                inscripcionPagadasDao.guardarInscripcion(p);
            }

        }
        //model.addAttribute("semestre", semestre);
        return "redirect:listadoInscripcionesPendientes.do";
    }

    @RequestMapping(value = "/informe/informeSeccionesAlumno.do", method = RequestMethod.GET)
    public String rechazarPago(Model model,
            @ModelAttribute("semestre") Semestre semestre,
            @ModelAttribute("alumno") Alumno alumno) {

        model.addAttribute("alumno", alumno);
        model.addAttribute("semestre", semestre);
        return "informeSeccionesAlumnoPdf";
    }

    @RequestMapping(value = "/coordinacion/listadoInscripcionesAlumno.do", method = RequestMethod.GET)
    public String listadoInscriptionesAlumno(Model model,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("semestre") Semestre semestre) {
        //Alumno alumno = new Alumno();
                /*
        
        for(Semestre sem:(Set<Semestre>)this.institucionDao.obtenerTodos().get(0).getSemestres()){
        if (sem.getActivo()>0) semestre = sem;
        }
         */
        semestre = this.createSemestre();

        if (!rutAlumno.equals("") && semestre != null) {



            alumno = this.alumnoDao.obtenerPorId(rutAlumno);

            model.addAttribute("titulo", "Listado Inscripciones actuales del Alumno");
            model.addAttribute("alumno", alumno);





            model.addAttribute("listadoGratis", inscripcionGratisDao.obtenerPorAlumno(rutAlumno));



        }

        return "listadoInscripcionesAlumno";
    }

    @RequestMapping(value = "/coordinacion/inscribirAlumnoCoordinacion.do", method = RequestMethod.GET)
    public String inscribirAlumnoCoordinacion(Model model, @ModelAttribute("alumno") Alumno alumno,
            @RequestParam(value = "rutAlumno", defaultValue = "") String rutAlumno,
            @ModelAttribute("semestre") Semestre semestre) {
        semestre = this.createSemestre();
        //Alumno alumno = new Alumno();
        Gratis gratis = new Gratis();
        List<Taller> listaTalleres = new ArrayList<Taller>();
        List<String> errores = new ArrayList<String>();




        alumno = alumnoDao.obtenerPorId(alumno.getRutAlumno());

        if (alumno == null) {
            errores.add("Alumno no encontrado!");
            model.addAttribute("listaTalleresDisponibles", listaTalleres);
            model.addAttribute("errores", errores);
            model.addAttribute("titulo", titulo);
        } else {
            GratisId idGratis = new GratisId();

            idGratis.setInscripcionRutAlumno(alumno.getRutAlumno());

            gratis.setId(idGratis);


            titulo = "En esta pagina ud. puede inscribir su Alumno a los Talleres indicados";






            model.addAttribute("inscripcion", gratis);
            model.addAttribute("alumno", alumno);
            boolean sw = true;

            List<Taller> listaTalleresTmp = new ArrayList<Taller>();

            for (Taller taller : semestre.getTalleres()) {
                if (taller.getClaseTaller().equals("CU")) {
                    for (Gratis g : (Set<Gratis>) alumno.getGratises()) {
                        if (g.getTaller().getIdTaller() == taller.getIdTaller()) {
                            sw = false;
                        }
                    }
                    if (sw) {
                    listaTalleresTmp.add(taller);
                }
                }

                
                sw = true;
            }

            for (Taller taller : listaTalleresTmp) {
                if (taller.getGenero().equals(alumno.getSexo()) || taller.getGenero().equals("X")) {


                    switch (Integer.parseInt(alumno.getCurso())) {
                        case 1:
                            if (taller.getPrimero() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 2:
                            if (taller.getSegundo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 3:
                            if (taller.getTercero() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 4:
                            if (taller.getCuarto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 5:
                            if (taller.getQuinto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 6:
                            if (taller.getSexto() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 7:
                            if (taller.getSeptimo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 8:
                            if (taller.getOctavo() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 11:
                            if (taller.getPmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 12:
                            if (taller.getSmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 13:
                            if (taller.getTmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case 14:
                            if (taller.getCmedio() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -3:
                            if (taller.getPrekinder() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -2:
                            if (taller.getKinder() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;
                        case -1:
                            if (taller.getJardin() == 1) {
                                listaTalleres.add(taller);
                            }
                            break;


                    }
                }
            }


            model.addAttribute("listaTalleresDisponibles", listaTalleres);
            model.addAttribute("errores", errores);
            model.addAttribute("titulo", titulo);




        }






        return "inscribirAlumnoCoordinacion";



    }

    //Busqueda alumno para ver sus inscripciones
    //para ver inscripciones del alumno a talleres
    @RequestMapping(value = "/coordinacion/buscarAlumnoCoordinacion.do", method = RequestMethod.GET)
    public String buscarAlumnoCoordinacionGet(Model model, @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno) {
        Set<Alumno> alumnos = new HashSet<Alumno>();

        if (!rutAlumno.equals("0")) {
            alumnos.add(this.alumnoDao.obtenerPorId(rutAlumno));
        }

        model.addAttribute("alumnos", alumnos);
        return "buscarAlumnoCoordinacion";

    }

    @RequestMapping(value = "/coordinacion/buscarAlumnoCoordinacion.do", method = RequestMethod.POST)
    public String buscarAlumnoCoordinacionPost(
            Model model, @RequestParam(value = "busqueda", defaultValue = "0") String rutAlumno) {
        Set<Alumno> alumnos = new HashSet<Alumno>();

        System.out.println("rutBusqueda  -->" + rutAlumno);
        if (!rutAlumno.equals("0")) {
            alumnos.add(this.alumnoDao.obtenerPorId(rutAlumno));
        }

        model.addAttribute("alumnos", alumnos);
        return "buscarAlumnoCoordinacion";
    }

    @RequestMapping(value = "/coordinacion/guardarInscripcionCoordinacion.do", method = RequestMethod.GET)
    public String guardarInscripcionCoordinacion(
            Model model,
            @ModelAttribute("cart") CartBean cart,
            @RequestParam(value = "idTaller", defaultValue = "0") int idTaller,
            @RequestParam(value = "rutAlumno", defaultValue = "0") String rutAlumno,
            @ModelAttribute("alumno") Alumno alumno,
            @ModelAttribute("semestre") Semestre semestre) {

        //alumno = new Alumno();
        String retorno = "";
        if (idTaller == 0) {
            model.addAttribute("alumno", alumno);
            retorno = "inscribirAlumno.do";
        } else {

            Taller taller = new Taller();
            taller = this.tallerDao.obtenerPorId(idTaller);
            alumno = this.alumnoDao.obtenerPorId(alumno.getRutAlumno());
            List<String> errores = new ArrayList<String>();


            if (taller.getCupos() > taller.getInscritos()) {
                if (taller.getClaseTaller().equals("CU")) {
                    if (alumno.getGratises().size() < 2) {
                        Gratis gratis = new Gratis();
                        GratisId gratisId = new GratisId();

                        gratisId.setGratisIdTaller(idTaller);
                        gratisId.setInscripcionRutAlumno(alumno.getRutAlumno());


                        gratis.setSemestre(taller.getSemestre());
                        gratisId.setSemestreIdsemestre(taller.getSemestre().getIdsemestre());


                        Gratis gratisTmp = this.inscripcionGratisDao.obtenerPorId(gratisId);
                        if (gratisTmp == null) {

                            gratis.setInscripcionFechaInscripcion(new Date());
                            gratis.setId(gratisId);
                            gratis.setAlumno(alumno);
                            gratis.setTaller(taller);

                            System.out.println("Rut Alumno " + gratis.getId().getInscripcionRutAlumno());
                            System.out.println("Nombre Alumno " + gratis.getAlumno().getPrimerNombre());
                            System.out.println("Id taller " + gratis.getId().getGratisIdTaller());
                            System.out.println("Fecha Inscripcion " + gratis.getInscripcionFechaInscripcion());
                            System.out.println("Nombre Taller " + gratis.getTaller().getNombreTaller());
                            System.out.println("Clase Taller " + gratis.getTaller().getClaseTaller());
                            System.out.println("CartBean " + this.cartBean.getListaTalleres().size());


                            this.inscripcionGratisDao.guardarInscripcion(gratis);

                            /*
                            Semestre semestre = new Semestre();
                            
                            for(Semestre sem:(Set<Semestre>)this.institucionDao.obtenerTodos().get(0).getSemestres()){
                            if (sem.getActivo()>0) semestre = sem;
                            }
                             */
                            semestre = this.createSemestre();

                            if (!rutAlumno.equals("") && semestre != null) {
                                model.addAttribute("titulo", "Listado Inscripciones");
                                model.addAttribute("alumno", alumno);

                                List<Gratis> listaGratisAlumno = new ArrayList<Gratis>();
            

                                for (Taller t : semestre.getTalleres()) {
                                    for (Gratis g : (Set<Gratis>) t.getGratises()) {
                                        if (g.getAlumno().getRutAlumno().equals(alumno.getRutAlumno())) {
                                            listaGratisAlumno.add(g);
                                        }
                                    }

                                   

                                }
                                model.addAttribute("listadoGratis", listaGratisAlumno);
         
                                model.addAttribute("semestre", this.createSemestre());
                            }

                   

                            retorno = "listadoInscripcionesAlumno";
                        }
                    } else {
                        errores.add("Puede elegir un maximo de 2 talleres curriculares por alumno.");
                        model.addAttribute("rutAlumno", alumno.getRutAlumno());
                    }
                } else {

                    retorno = "redirect:inscribirAlumnoCoordinacion.do";
                }


            } else {
                errores.add("Cupos del taller selecciondo estan agotados!!!");
            }

            
            model.addAttribute("alumno", alumno);
            model.addAttribute("errores", errores);
            
             model.addAttribute("titulo", "Listado Inscripciones actuales del Alumno");






            model.addAttribute("listadoGratis", inscripcionGratisDao.obtenerPorAlumno(alumno.getRutAlumno()));

            retorno = "listadoInscripcionesAlumno";
        }
        return retorno;

    }
    
    @RequestMapping(value = "/eliminarInscripcion.do", method = RequestMethod.GET)
    public String eliminarInscripcion(Model model, @ModelAttribute("alumno") Alumno alumno,    
    @RequestParam(value = "idInscripcion", defaultValue = "0") int idTaller,
            @ModelAttribute("semestre") Semestre semestre) {
         
         GratisId inscripcionEliminarId = new GratisId();
         
         inscripcionEliminarId.setGratisIdTaller(idTaller);
         inscripcionEliminarId.setInscripcionRutAlumno(alumno.getRutAlumno());
         inscripcionEliminarId.setSemestreIdsemestre(semestre.getIdsemestre());
         Gratis gratis = new Gratis();
         
         gratis.setId(inscripcionEliminarId);
         
         inscripcionGratisDao.eliminarInscripcion(gratis);
         
            model.addAttribute("alumno", alumno);
         
            
             model.addAttribute("titulo", "Listado Inscripciones actuales del Alumno");






            model.addAttribute("listadoGratis", inscripcionGratisDao.obtenerPorAlumno(alumno.getRutAlumno()));

         return "listadoInscripciones";
     }
    
     @RequestMapping(value = "/coordinacion/eliminarInscripcionGratis.do", method = RequestMethod.GET)
    public String eliminarInscripcionGratis(Model model, @ModelAttribute("alumno") Alumno alumno,    
    @RequestParam(value = "idInscripcion", defaultValue = "0") int idTaller,
            @ModelAttribute("semestre") Semestre semestre) {
         
         GratisId inscripcionEliminarId = new GratisId();
         
         inscripcionEliminarId.setGratisIdTaller(idTaller);
         inscripcionEliminarId.setInscripcionRutAlumno(alumno.getRutAlumno());
         inscripcionEliminarId.setSemestreIdsemestre(semestre.getIdsemestre());
         Gratis gratis = new Gratis();
         
         gratis.setId(inscripcionEliminarId);
         
         inscripcionGratisDao.eliminarInscripcion(gratis);
         
            model.addAttribute("alumno", alumno);
         
            
             model.addAttribute("titulo", "Listado Inscripciones actuales del Alumno");






            model.addAttribute("listadoGratis", inscripcionGratisDao.obtenerPorAlumno(alumno.getRutAlumno()));

         return "listadoInscripcionesAlumno";
     }
}
