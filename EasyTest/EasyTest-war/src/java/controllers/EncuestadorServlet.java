/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dao.EncuestadorDaoImpl;
import model.Dao.EncuestadorDaoServiceImpl;
import model.entities.Encuestador;

/**
 *
 * @author Luis
 */
@WebServlet(name = "EncuestadorServlet", urlPatterns = {"/encuestador/EncuestadorServlet"})
public class EncuestadorServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        if (request.getParameter("action").equals("agregar")) agregarEncuestador(request,response);
        
        if (request.getParameter("action").equals("listar")) listarEncuestadores(request,response);
        if (request.getParameter("action").equals("guardar")) guardarEncuestador(request,response);
        
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

    private void guardarEncuestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String rut = request.getParameter("rut");
        String apellido = request.getParameter("apellido");
        String nick = request.getParameter("nick");
        String contrasena = request.getParameter("contrasena");
        String email = request.getParameter("email");
        
        
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        Encuestador encuestador = new Encuestador();
        
        
        encuestador.setRut(rut);
        encuestador.setContrasena(contrasena);
        encuestador.setEmail(email);
        encuestador.setNick(nick);
        encuestador.setNombre(nombre);
        encuestador.setApellido(apellido);
                
        
        encuestadorDao.guardar(encuestador);
        HttpSession session = request.getSession();
        
        session.setAttribute("encuestador", encuestadorDao.getbyRut(rut));
        request.setAttribute("listaEncuestadores", encuestadorDao.getAll());
        
        response.sendRedirect("EvaluacionServlet?action=agregar");
        
    }



    private void listarEncuestadores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        
                
        request.setAttribute("listaEncuestadores", encuestadorDao.getAll());
        
        request.getRequestDispatcher("/WEB-INF/pages/listaEncuestadores.jsp").forward(request, response);

    }

    private void agregarEncuestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        
        Encuestador encuestador = new Encuestador();
        
        
                
        request.setAttribute("encuestador", encuestador);
        
        request.getRequestDispatcher("/WEB-INF/pages/agregarEvaluador.jsp").forward(request, response);
        
    }

   
}
