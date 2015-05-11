/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dao.EncuestadoDaoServiceImp;
import model.Dao.EncuestadorDaoServiceImpl;
import model.Dao.EvaluacionDaoImpl;
import model.Dao.EvaluacionDaoService;
import model.Dao.EvaluacionDaoServiceImpl;
import model.Dao.PlantillaDaoServiceImpl;
import model.Dao.PreguntaDaoServiceImpl;
import model.Dao.RespuestaDaoServiceImpl;
import model.Dao.TestDaoImpl;
import model.Dao.TestDaoServiceImpl;
import model.entities.Alternativas;
import model.entities.Encuestado;
import model.entities.Encuestador;
import model.entities.Evaluacion;
import model.entities.Evapreguntas;

import model.entities.Pregunta;
import model.entities.Respuesta;
import model.entities.RespuestaId;
import model.entities.Test;
import org.springframework.web.servlet.tags.EvalTag;

/**
 *
 * @author PC
 */
@WebServlet(name = "TestServlet", urlPatterns = {"/TestServlet"})
public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //if (request.getParameter("action").equals("guardar")) guardarTest(request,response);
        if (request.getParameter("action").equals("agregar")) agregarTest(request,response);
        //if (request.getParameter("action").equals("eliminar")) eliminarTest(request,response);
        //if (request.getParameter("action").equals("listar")) listarTest(request,response);
        //if (request.getParameter("action").equals("editar")) editarTest(request,response);
        if (request.getParameter("action").equals("guardarTest")) guardarTest(request,response);
    
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void agregarTest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{  
    TestDaoServiceImpl testDaoImpl = new TestDaoServiceImpl();
    EvaluacionDaoServiceImpl evaluacionDaoImpl = new EvaluacionDaoServiceImpl();
        
      
    int idEvaluacionEnviada = Integer.parseInt(request.getParameter("idEvaluacion"));
    
    Evaluacion evaluacion = evaluacionDaoImpl.getbyId(idEvaluacionEnviada);
    
     request.setAttribute("evaluacion", evaluacion);
         
        request.getRequestDispatcher("/WEB-INF/pages/testUsuario.jsp").forward(request, response);
     
    }
    
     private void guardarTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        
    TestDaoServiceImpl testDao = new TestDaoServiceImpl();
    EvaluacionDaoServiceImpl evaluacionDaoImpl = new EvaluacionDaoServiceImpl();
    PreguntaDaoServiceImpl preguntaDaoImpl = new PreguntaDaoServiceImpl();
    EncuestadoDaoServiceImp encuestadoDaoImpl = new EncuestadoDaoServiceImp();
    RespuestaDaoServiceImpl respuestaDaoImpl = new RespuestaDaoServiceImpl();
    
    String idEvaluacion =        request.getParameter("idEvaluacion");
    
    
    
    System.out.println(idEvaluacion);
    Enumeration enumParams = request.getParameterNames();
    Set<String> idPreguntas = new HashSet<String>();
    
    while(enumParams.hasMoreElements()){
        String paramKey = (String)enumParams.nextElement();
        System.out.println(paramKey);
        String[] paramValueArray = paramKey.split("-"); //obtenemos idPregunta   
        if(paramKey.contains("pregunta-")) idPreguntas.add(paramValueArray[1]);
    }
   
            //obtenemos la evaluacion
           int idEvaluacionBuscada = Integer.parseInt(idEvaluacion);
           Evaluacion evaluacion = evaluacionDaoImpl.getbyId(idEvaluacionBuscada);
           
           
           
                    
           
           //Creamos el encuestado
           Encuestado encuestado = new Encuestado();
           encuestado.setNombre("Luis");
           encuestado.setApellido("Vergara");
           encuestado.setColegio("Colegio");
           encuestado.setCurso("4");
           encuestado.setEmail("Luis@gmail.com");
           encuestado.setNivel("b");
           encuestado.setSexo("Masculino");
           encuestadoDaoImpl.guardar(encuestado);
                   
           //Creamos el Test
           Test nuevoTest = new Test();      
           nuevoTest.setEvaluacion(evaluacion);  
           nuevoTest.setEncuestado(encuestado);//Tenemosel encuestado           
           testDao.guardar(nuevoTest);

        for (String id  :idPreguntas) {
                      
            int idPregunta = Integer.parseInt(id);            
      
            Pregunta pregunta = preguntaDaoImpl.getbyId(idPregunta); //obtenemos la pregunta     
 
           //Creamos la respuesta
           Respuesta respuesta = new Respuesta(); //Tenemos respuesta
           
           enumParams = request.getParameterNames();
           while(enumParams.hasMoreElements()){
                String paramKey = (String)enumParams.nextElement();
                System.out.println(paramKey);
                // obtenemos la pregunta
                 String paramValue = request.getParameter(paramKey);            
                 if(paramKey.contains("pregunta-")){
                    String[] paramValueArray = paramKey.split("-"); //obtenemos idPregunta   
                    if (paramValueArray[1].equals(id)) respuesta.setRespuesta(paramValue.concat(","));
                 }
           }
           //Creamos id respuesta
           RespuestaId respuestaId = new RespuestaId();
           
           
           respuestaId.setEvapreguntasPreguntaId(pregunta.getId());
           respuestaId.setEvapreguntasEvaluacionId(evaluacion.getId());
           respuestaId.setTestIdtest(nuevoTest.getIdtest());
           
           respuesta.setId(respuestaId);
           
           respuestaDaoImpl.guardar(respuesta);
           
           
        }
        
    }
    


}
