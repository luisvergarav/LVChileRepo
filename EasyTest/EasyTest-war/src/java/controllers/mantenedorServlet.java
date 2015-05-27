/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dao.EncuestadorDaoServiceImpl;
import model.entities.Encuestador;
import model.entities.UserRoles;
import model.entities.UserRolesId;

/**
 *
 * @author VASS13
 */
@WebServlet(name = "mantenedorServlet", urlPatterns = {"/restricted/mantenedorServlet"})
public class mantenedorServlet extends HttpServlet {

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
  
        if (request.getParameter("action").equals("guardarUsuario")) guardarUsuario(request,response);
        if (request.getParameter("action").equals("agregarUsuario")) agregarUsuario(request,response);
        if (request.getParameter("action").equals("eliminarUsuario")) eliminarUsuario(request,response);
        if (request.getParameter("action").equals("listarUsuarios")) listarUsuario(request,response);
        if (request.getParameter("action").equals("editarUsuario")) editarUsuario(request,response);
       if (request.getParameter("action").equals("eliminarUsuario")) eliminarUsuario(request,response);
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

    private void guardarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
         String id = request.getParameter("idEncuestador");
         String nombre = request.getParameter("nombre");
        String rut = request.getParameter("rut");
        String apellido = request.getParameter("apellido");
        String nick = request.getParameter("nick");
        String contrasena = request.getParameter("contrasena");
        String email = request.getParameter("email");
        String rol = request.getParameter("rol");
        int idParseado;
        
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        Encuestador encuestador = new Encuestador();
        
        if (!id.isEmpty()) {
            idParseado = Integer.parseInt(id);
            encuestador.setIdencuestador(idParseado);
        }
        
        
        encuestador.setRut(rut);
        encuestador.setContrasena(contrasena);
        encuestador.setEmail(email);
        encuestador.setNick(nick);
        encuestador.setNombre(nombre);
        encuestador.setApellido(apellido);
        
        UserRoles userRol = new UserRoles();
        
        userRol.setEncuestador(encuestador);
        
        UserRolesId userRolId = new UserRolesId();
        
        userRolId.setIdencuestador(encuestador.getIdencuestador());
        
        userRolId.setRoleName(rol);
        
        userRol.setId(userRolId);
        
        encuestador.getRoleses().add(userRol);
        
        
        
        encuestadorDao.guardar(encuestador);
        HttpSession session = request.getSession();
        
        session.setAttribute("encuestador", encuestadorDao.getbyRut(rut));
        request.setAttribute("listaEncuestadores", encuestadorDao.getAll());
        
        response.sendRedirect("mantenedorServlet?action=listarUsuarios");
    }

    private void agregarUsuario(HttpServletRequest request, HttpServletResponse response) {
          Encuestador encuestador = new Encuestador();
        
        
                
        request.setAttribute("encuestador", encuestador);
         RequestDispatcher rd =   request.getRequestDispatcher("/WEB-INF/pages/agregarUsuario.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }



    private void listarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        
                
        request.setAttribute("listaEncuestadores", encuestadorDao.getAll());
        
        request.getRequestDispatcher("/WEB-INF/pages/listaEncuestadores.jsp").forward(request, response);
    }
 private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idEncuestador = request.getParameter("idEncuestador");        
        
        int idEncuestadorBuscado = Integer.parseInt(idEncuestador);
        
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        request.setAttribute("encuestador",encuestadorDao.getbyId(idEncuestadorBuscado));
                        
        request.getRequestDispatcher("/WEB-INF/pages/agregarUsuario.jsp").forward(request, response);
    }
 
     private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idEncuestador = request.getParameter("idEncuestador");        
        
        int idEncuestadorBuscado = Integer.parseInt(idEncuestador);
        
        EncuestadorDaoServiceImpl encuestadorDao = new EncuestadorDaoServiceImpl();
        
        encuestadorDao.eliminar(encuestadorDao.getbyId(idEncuestadorBuscado));
                
        request.setAttribute("listaEncuestadores", encuestadorDao.getAll());
        
        
        
        request.getRequestDispatcher("/WEB-INF/pages/listaEncuestadores.jsp").forward(request, response);
        
    }
}
