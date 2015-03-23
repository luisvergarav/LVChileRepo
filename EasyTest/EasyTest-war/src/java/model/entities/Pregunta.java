package model.entities;
// Generated 01-12-2014 01:13:15 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Pregunta generated by hbm2java
 */
public class Pregunta  implements java.io.Serializable {


     private Integer idPregunta;
     private Grupopreguntas grupopreguntas;
     private String textoPregunta;
     private String tipoPregunta;
     private Boolean obligatorio;
     private Set evaluacionpreguntases = new HashSet(0);
     private Set alternativases = new HashSet(0);

    public Pregunta() {
    }

	
    public Pregunta(String textoPregunta, String tipoPregunta) {
        this.textoPregunta = textoPregunta;
        this.tipoPregunta = tipoPregunta;
    }
    public Pregunta(Grupopreguntas grupopreguntas, String textoPregunta, String tipoPregunta, Boolean obligatorio, Set evaluacionpreguntases, Set alternativases) {
       this.grupopreguntas = grupopreguntas;
       this.textoPregunta = textoPregunta;
       this.tipoPregunta = tipoPregunta;
       this.obligatorio = obligatorio;
       this.evaluacionpreguntases = evaluacionpreguntases;
       this.alternativases = alternativases;
    }
   
    public Integer getIdPregunta() {
        return this.idPregunta;
    }
    
    public void setIdPregunta(Integer idPregunta) {
        this.idPregunta = idPregunta;
    }
    public Grupopreguntas getGrupopreguntas() {
        return this.grupopreguntas;
    }
    
    public void setGrupopreguntas(Grupopreguntas grupopreguntas) {
        this.grupopreguntas = grupopreguntas;
    }
    public String getTextoPregunta() {
        return this.textoPregunta;
    }
    
    public void setTextoPregunta(String textoPregunta) {
        this.textoPregunta = textoPregunta;
    }
    public String getTipoPregunta() {
        return this.tipoPregunta;
    }
    
    public void setTipoPregunta(String tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }
    public Boolean getObligatorio() {
        return this.obligatorio;
    }
    
    public void setObligatorio(Boolean obligatorio) {
        this.obligatorio = obligatorio;
    }
    public Set getEvaluacionpreguntases() {
        return this.evaluacionpreguntases;
    }
    
    public void setEvaluacionpreguntases(Set evaluacionpreguntases) {
        this.evaluacionpreguntases = evaluacionpreguntases;
    }
    public Set getAlternativases() {
        return this.alternativases;
    }
    
    public void setAlternativases(Set alternativases) {
        this.alternativases = alternativases;
    }




}


