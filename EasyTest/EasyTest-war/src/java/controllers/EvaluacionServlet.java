/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dao.EncuestadorDaoImpl;
import model.Dao.EncuestadorDaoServiceImpl;
import model.Dao.EvaluacionDaoImpl;
import model.Dao.EvaluacionDaoServiceImpl;
import model.Dao.GrupoPreguntasDaoImpl;
import model.Dao.GrupoPreguntasDaoServiceImpl;
import model.Dao.PlantillaDaoServiceImpl;
import model.Dao.PreguntaDaoServiceImpl;
import model.entities.Alternativas;
import model.entities.Encuestador;
import model.entities.Evaluacion;
import model.entities.Evapreguntas;
import model.entities.Grupopreguntas;
import model.entities.Pregunta;

/**
 *
 * @author Luis
 */

@WebServlet(name = "EvaluacionServlet", urlPatterns = {"/encuestador/EvaluacionServlet"})
public class EvaluacionServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        if (request.getParameter("action").equals("guardar")) guardarEvaluacion(request,response);
        if (request.getParameter("action").equals("agregar")) agregarEvaluacion(request,response);
        if (request.getParameter("action").equals("eliminar")) eliminarEvaluacion(request,response);
        if (request.getParameter("action").equals("listar")) listarEvaluacion(request,response);
        if (request.getParameter("action").equals("editar")) editarEvaluacion(request,response);
        if (request.getParameter("action").equals("guardarPregunta")) guardarPregunta(request,response);
        if (request.getParameter("action").equals("agregarAlternativa")) agregarAlternativa(request,response);
        if (request.getParameter("action").equals("guardarAlternativa")) guardarAlternativa(request,response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void agregarEvaluacion(HttpServletRequest request, HttpServletResponse response){  
    EncuestadorDaoServiceImpl encuestadorDaoImpl = new EncuestadorDaoServiceImpl();
    PlantillaDaoServiceImpl plantillaDaoImpl = new PlantillaDaoServiceImpl();
        
      HttpSession session = request.getSession();
      
      
      
      String currentUser = (String )request.getUserPrincipal().getName();
      
      
      
      Encuestador encuestador = encuestadorDaoImpl.getbyId(Integer.parseInt(currentUser));
      
    //Encuestador encuestador =  (Encuestador)      session.getAttribute("encuestador");
    //String rutEncuestadorBuscado = encuestador.getRut();
    
    Evaluacion evaluacion = new Evaluacion();
    
    
    evaluacion.setEncuestador(encuestador);
    
         
    session.setAttribute("encuestador", encuestador);
    request.setAttribute("evaluacion", evaluacion);
    request.setAttribute("listaPlantillas", plantillaDaoImpl.getAll());
        System.out.println("Tamaño" + plantillaDaoImpl.getAll().size());
    
     RequestDispatcher rd =   request.getRequestDispatcher("/WEB-INF/pages/agregarEvaluacion.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void eliminarEvaluacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EvaluacionDaoServiceImpl evaluacionDao = new EvaluacionDaoServiceImpl();
        
    String idEvaluacion =        request.getParameter("idEvaluacion");
    int idEvaluacionBuscada = Integer.parseInt(idEvaluacion);
    
    
    
    evaluacionDao.eliminar(evaluacionDao.getbyId(idEvaluacionBuscada));
    request.setAttribute("listaEvaluaciones", evaluacionDao.getAll());
    
        request.getRequestDispatcher("/WEB-INF/pages/listaEvaluaciones.jsp").forward(request, response);
    }

    private void listarEvaluacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session = request.getSession();
         Encuestador encuestador =  (Encuestador)  session.getAttribute("encuestador");
        int idEncuestadorBuscado = encuestador.getIdencuestador();
                        
        
        Set<Evaluacion> listaEvaluaciones = encuestador.getEvaluacions();
        
        request.setAttribute("listaEvaluaciones",listaEvaluaciones);
		
        
        
        request.getRequestDispatcher("/WEB-INF/pages/listaEvaluaciones.jsp").forward(request, response);

        
    }
    private void guardarEvaluacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        EvaluacionDaoImpl evaluacionDao = new EvaluacionDaoImpl();
    EncuestadorDaoServiceImpl encuestadorDaoImpl = new EncuestadorDaoServiceImpl();
    PlantillaDaoServiceImpl plantillaDaoImpl = new PlantillaDaoServiceImpl();
    
    String cabecera =        request.getParameter("cabecera");
    String piePagina =        request.getParameter("piePagina");
    String idEncuestador =        request.getParameter("idEncuestador");
    String mensajeconfirmacion =        request.getParameter("mensajeconfirmacion");
    String item =        request.getParameter("item");
    int idEncuestadorBuscado = Integer.parseInt(idEncuestador);
    int idPlantilla = Integer.parseInt(request.getParameter("idPlantilla"));
    
     HttpSession session = request.getSession();
     Encuestador encuestador =  (Encuestador)  session.getAttribute("encuestador");
       
    
    Evaluacion evaluacion = new Evaluacion();
    
    evaluacion.setCabecera(cabecera);
    evaluacion.setPiepagina(piePagina);
    evaluacion.setPlantilla(plantillaDaoImpl.getbyId(idPlantilla));
    evaluacion.setEncuestador(encuestador);
    evaluacion.setItem(item);
    evaluacion.setMensajeconfirmacion(mensajeconfirmacion);
    
    evaluacionDao.guardar(evaluacion);
    request.setAttribute("encuestador", encuestador);
    request.setAttribute("listaEvaluaciones", evaluacionDao.getAll());
        request.getRequestDispatcher("/WEB-INF/pages/listaEvaluaciones.jsp").forward(request, response);
    }

    private void editarEvaluacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEvaluacion = Integer.parseInt(request.getParameter("idEvaluacion"));
        
        EvaluacionDaoServiceImpl evaluacionDaoImpl = new EvaluacionDaoServiceImpl();
        
        Evaluacion evaluacion = evaluacionDaoImpl.getbyId(idEvaluacion);
        
        Pregunta pregunta = new Pregunta();
        
        HttpSession session = request.getSession();
      
         session.setAttribute("evaluacion",evaluacion);
        
         request.setAttribute("pregunta", pregunta);
         request.setAttribute("evaluacion", evaluacion);
        request.getRequestDispatcher("/WEB-INF/pages/agregarPregunta.jsp").forward(request, response);
        
    }

    private void guardarPregunta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEvaluacion = Integer.parseInt(request.getParameter("idEvaluacion"));
        String textoPregunta = request.getParameter("textoPregunta");
        String tipoPregunta = request.getParameter("tipoPregunta");
        
        
        EvaluacionDaoServiceImpl evaluacionDaoImpl = new EvaluacionDaoServiceImpl();
        PreguntaDaoServiceImpl preguntaDaoImpl = new PreguntaDaoServiceImpl();
        GrupoPreguntasDaoServiceImpl grupoPreguntasDaoServiceImpl = new GrupoPreguntasDaoServiceImpl();
                
        HttpSession session = request.getSession();
      
        Evaluacion evaluacion =  (Evaluacion)      session.getAttribute("evaluacion");
    
        //Evaluacion evaluacion = evaluacionDaoImpl.getbyId(idEvaluacion);
        
        
        
        Pregunta pregunta = new Pregunta();
        
        pregunta.setTextopregunta(textoPregunta);
        pregunta.setTipopregunta(tipoPregunta);
        
        
        Grupopreguntas grupoPreguntas = new Grupopreguntas();
        
        grupoPreguntas.setDescripciongrupo("Grupo 1");
        
        grupoPreguntasDaoServiceImpl.guardar(grupoPreguntas);
        
        pregunta.setGrupopreguntas(grupoPreguntas);
        
        
        
        
        
        
        Set<Evaluacion> evaluacionesPregunta = pregunta.getEvapreguntases();
        
        evaluacion.getEvapreguntases().add(pregunta);
        
        evaluacionDaoImpl.guardar(evaluacion);
        
        pregunta = new Pregunta();
        
         request.setAttribute("pregunta", pregunta);
         request.setAttribute("evaluacion", evaluacion);
         
        request.getRequestDispatcher("/WEB-INF/pages/agregarPregunta.jsp").forward(request, response);
        
                
        
                
    }
    
    private void agregarAlternativa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PreguntaDaoServiceImpl preguntaDaoImpl = new PreguntaDaoServiceImpl();
        HttpSession session = request.getSession();
      
        int idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
      
        Pregunta pregunta = preguntaDaoImpl.getbyId(idPregunta);
                
        
      Alternativas alternativas = new Alternativas();

        alternativas.setPregunta(pregunta);
    
        request.setAttribute("alternativa",alternativas);
         session.setAttribute("pregunta",pregunta);        

         
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/agregarAlternativa.jsp");
                   
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void guardarAlternativa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PreguntaDaoServiceImpl preguntaDaoImpl = new PreguntaDaoServiceImpl();
        
        String texto = request.getParameter("textoAlternativa");
        int puntaje = Integer.parseInt(request.getParameter("puntajeAlternativa"));
        String correcta = request.getParameter("correctaAlternativa");
        

        HttpSession session = request.getSession();
      Pregunta pregunta =  (Pregunta)      session.getAttribute("pregunta");
        
      Alternativas alternativas = new Alternativas();

        alternativas.setCorrecta('T');        
        alternativas.setPuntaje(puntaje);
        alternativas.setPregunta(pregunta);
        alternativas.setTextoalternativa(texto);
        
        Set<Alternativas> alternativasPreguntas = pregunta.getAlternativases();
        
        alternativasPreguntas.add(alternativas);
        preguntaDaoImpl.guardar(pregunta);
        
        

        
       alternativas = new Alternativas();
       alternativas.setPregunta(pregunta);
       session.setAttribute("pregunta",pregunta);
       
         request.setAttribute("alternativa", alternativas);
         
        request.getRequestDispatcher("/WEB-INF/pages/agregarAlternativa.jsp").forward(request, response);
    }
}
