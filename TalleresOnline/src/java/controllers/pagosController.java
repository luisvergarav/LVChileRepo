/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author Luis
 */
@Controller
@RequestMapping("/pagos")
@SessionAttributes("cart")

public class pagosController {
         @RequestMapping(value = "/cierre.do",method = {RequestMethod.POST, RequestMethod.GET})
	public void testSyntax(HttpServletRequest request, HttpServletResponse response)
         {
            PrintWriter out;
        try {
            out = response.getWriter();
            out.print("<html>ACEPTADO</html>");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
                
            
        
       }

         @RequestMapping(value = "/exito.do",method = {RequestMethod.POST, RequestMethod.GET})
	public void exito(HttpServletRequest request, HttpServletResponse response)
         {
            PrintWriter out;
        try {
            out = response.getWriter();
            out.print("EXITO");
        } catch (IOException ex) {
            ex.printStackTrace();
        }                            
        
     }
         
        @RequestMapping(value = "/fracaso.do",method = {RequestMethod.POST, RequestMethod.GET})
	public void fracaso(HttpServletRequest request, HttpServletResponse response)
         {
            PrintWriter out;
        try {
            out = response.getWriter();
            out.print("FRACASO");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
                
            
        
      }
 

         
}
