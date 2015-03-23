/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.lowagie.text.Cell;
import com.lowagie.text.Chunk;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.view.document.AbstractPdfView;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Set;
import model.Entitys.Alumno;
import model.Entitys.Diasseccion;
import model.Entitys.Seccion;
import model.Entitys.Semestre;

/**
 *
 * @author Luis
 */
public class informeSeccionesAlumnoPdf extends AbstractPdfView{
 
 

	@Override
	protected void buildPdfDocument(Map model, Document document,
		PdfWriter writer, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
 
		Alumno alumno = (Alumno) model.get("alumno");
                Semestre semestre = (Semestre) model.get("semestre");
                
                
                Font font1 = new Font(Font.COURIER    , 12, Font.BOLD, Color.RED);
                Font font2 = new Font(Font.COURIER    , 10, Font.BOLD,Color.gray);
                
                // Image imagen = Image.getInstance(new URL("http://190.96.70.134:8080/TalleresOnline/resources/img/logo.jpg"));       
                //imagen.setAlignment(Element.ALIGN_LEFT);        
                //document.add(imagen);
                //imagen.setAbsolutePosition(0f, 0f);
                //imagen.scaleAbsolute(50, 50);
                Paragraph p1  = new Paragraph("Colegio Santa Cruz de Chicureo",font2);
                p1.setAlignment(Element.ALIGN_LEFT);
                document.add(p1);
                                
                p1 = new Paragraph("Fecha : " + new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()), font2);                
                p1.setAlignment(Element.ALIGN_RIGHT);
                document.add(p1);
                document.add(new Chunk(Chunk.NEWLINE));
                document.add(new Chunk(Chunk.NEWLINE));
                p1 = new Paragraph("Informe Secciones por Alumno " , font2);                
                p1.setAlignment(Element.ALIGN_CENTER);
                document.add(p1);
                document.add(new Chunk(Chunk.NEWLINE));
                document.add(new Chunk(Chunk.NEWLINE));
                
                document.add(new Paragraph("Alumno : " + alumno.getPrimerNombre()  + " " +  
                alumno.getSegundoNombre() + " " + alumno.getApellidoPaterno() + " " + alumno.getApellidoMaterno(),font2));
                document.add(new Paragraph("Curso : " + alumno.getCurso() + "-" + alumno.getNivel().toUpperCase(), font2));                                
                document.add(new Paragraph("Semestre : " + semestre.getPeriodo() + "/" + semestre.getAnoPeriodo(), font2));                                
                document.add(new Paragraph("-----------------------------------------------------------------",font2));
                document.add(new Chunk(Chunk.NEWLINE));
                document.add(new Paragraph("Secciones Inscritas :", font2));                
                document.add(new Chunk(Chunk.NEWLINE));
                document.add(new Chunk(Chunk.NEWLINE));
                
                                        
                for (Seccion seccion :(Set<Seccion>) alumno.getAlumnoseccions()) {
		
                    document.add(new Paragraph(" Seccion: " + seccion.getCodSeccion() + " " + seccion.getNombreSeccion() 
                            ,font2));
                    
                    document.add(new Chunk(Chunk.NEWLINE));
                    
                    Table table = new Table(4);
 
                table.setBorder(0);
                table.setPadding(2);
                Cell celda = new Cell();
                celda.setBorder(0);
                celda.setBorderWidthBottom(1);
                
                
                celda.addElement(new Paragraph("Dia",font2));
                
                table.addCell(celda);
		
                celda = new Cell();
                celda.setBorder(0);
                celda.setBorderWidthBottom(1);
                
                celda.addElement(new Paragraph("Hora Inicio".toString(),font2));                
                
                table.addCell(celda);
                
                
                celda = new Cell();
                celda.setBorder(0);
                celda.setBorderWidthBottom(1);
                
                celda.addElement(new Paragraph("Hora Termino".toString(),font2));
                
                table.addCell(celda);
                
                celda = new Cell();
                celda.setBorder(0);
                celda.setWidth(50);                
                celda.setBorderWidthBottom(1);
                
                celda.addElement(new Paragraph("Lugar",font2));
                
                table.addCell(celda);
                table.setSpacing(1);
                    
                    
                    
                     for(Diasseccion dias : (Set<Diasseccion>) seccion.getDiasseccions()){
                         celda = new Cell();
                        
                        celda.setBorder(0);
                        
                        
                        celda.addElement(new Paragraph(dias.getDiaTaller(),font2));
                        table.addCell(celda);
                        
                       celda = new Cell();
                        
                        celda.setBorder(0);
                        
                        celda.addElement(new Paragraph(dias.getHoraInicio().toString(),font2));
			table.addCell(celda);
                        
                         celda = new Cell();
                        
                        celda.setBorder(0);
                        
                        celda.addElement(new Paragraph(dias.getHoraFin().toString(),font2));
                        table.addCell(celda);
                        
                        celda = new Cell();
                        
                        celda.setBorder(0);
                        
                        celda.addElement(new Paragraph(dias.getLugar(),font2));
                        
                        table.addCell(celda);
                     
                         
                     }
                     document.add(table);
                document.add(new Chunk(Chunk.NEWLINE));
                document.add(new Chunk(Chunk.NEWLINE));
                }
                
		
        }

}
