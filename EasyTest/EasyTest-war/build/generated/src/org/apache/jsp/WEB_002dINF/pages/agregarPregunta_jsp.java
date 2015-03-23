package org.apache.jsp.WEB_002dINF.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Set;
import model.entities.Pregunta;
import model.entities.Encuestador;
import model.entities.Evaluacion;
import java.util.List;

public final class agregarPregunta_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

Pregunta pregunta = (Pregunta)request.getAttribute("pregunta");


Evaluacion evaluacion = (Evaluacion) request.getAttribute("evaluacion");



      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Agregar Pregunta</h1>\n");
      out.write("        <form action=\"EvaluacionServlet?action=guardarPregunta\" method=\"POST\">\n");
      out.write("            <table>\n");
      out.write("            <tr>\n");
      out.write("                <td>Id Evaluacion</td>\n");
      out.write("                <td>\n");
      out.write("            <input type=\"text\" name=\"idEvaluacion\" value=\"");
      out.print(evaluacion.getIdEvaluacion());
      out.write("\" />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Texto Pregunta</td>\n");
      out.write("                <td>\n");
      out.write("            <input type=\"text\" name=\"textoPregunta\" value=\"");
      out.print(pregunta.getTextoPregunta());
      out.write("\" />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>Tipo Pregunta</td>\n");
      out.write("                <td>\n");
      out.write("            <input type=\"text\" name=\"tipoPregunta\" value=\"");
      out.print(pregunta.getTipoPregunta());
      out.write("\" />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td></td>\n");
      out.write("                <td>\n");
      out.write("            <input type=\"submit\" value=\"Guardar\" name=\"guardar\" />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("                \n");
      out.write("        <table id=\"tabla1\" cellpadding='3' cellspacing='2' class=\"table table-filter\">\n");
      out.write("\t\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<th>Id</th>\n");
      out.write("\t\t<th>Texto Pregunta</th>\n");
      out.write("\t\t<th>Tipo Pregunta</th>\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t\n");
      out.write("\t\t");
 for (Pregunta pregunta1:(Set<Pregunta>)evaluacion.getEvaluacionpreguntases()){
      out.write("\n");
      out.write("\t\t\t<tr>\n");
      out.write("                            \n");
      out.write("                            <td>\n");
      out.write("\t\t\t");
      out.print(pregunta1.getIdPregunta());
      out.write("\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t");
      out.print(pregunta1.getTextoPregunta());
      out.write("\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t");
      out.print(pregunta1.getTipoPregunta());
      out.write("\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("                        \n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t");
}
      out.write("\n");
      out.write("\t\t\n");
      out.write("\t\t</table>   \n");
      out.write("                <a href=\"TestServlet?action=agregar&idEvaluacion=");
      out.print(evaluacion.getIdEvaluacion());
      out.write("\">Copia este Link</a>\n");
      out.write("                \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
