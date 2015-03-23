package model.Entitys;
// Generated 07-07-2014 01:00:13 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Pagada generated by hbm2java
 */
public class Pagada  implements java.io.Serializable {


     private PagadaId id;
     private Taller taller;
     private Semestre semestre;
     private Alumno alumno;
     private Pago pago;
     private Date inscripcionFechaInscripcion;
     private String numOrdenInscripcion;
     private int transaccion;
     private char estado;
     private int fracaso;
     
     
    public Pagada() {
    }

    public int getFracaso() {
        return fracaso;
    }

    public void setFracaso(int fracaso) {
        this.fracaso = fracaso;
    }

    
    
    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    
    
    public int getTransaccion() {
        return transaccion;
    }

    public void setTransaccion(int transaccion) {
        this.transaccion = transaccion;
    }

    
    
    public Pagada(PagadaId id, Taller taller, Semestre semestre, Alumno alumno, Pago pago, Date inscripcionFechaInscripcion, String numOrdenInscripcion) {
       this.id = id;
       this.taller = taller;
       this.semestre = semestre;
       this.alumno = alumno;
       this.pago = pago;
       this.inscripcionFechaInscripcion = inscripcionFechaInscripcion;
       this.numOrdenInscripcion = numOrdenInscripcion;
    }
   
    public PagadaId getId() {
        return this.id;
    }
    
    public void setId(PagadaId id) {
        this.id = id;
    }
    public Taller getTaller() {
        return this.taller;
    }
    
    public void setTaller(Taller taller) {
        this.taller = taller;
    }
    public Semestre getSemestre() {
        return this.semestre;
    }
    
    public void setSemestre(Semestre semestre) {
        this.semestre = semestre;
    }
    public Alumno getAlumno() {
        return this.alumno;
    }
    
    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }
    public Pago getPago() {
        return this.pago;
    }
    
    public void setPago(Pago pago) {
        this.pago = pago;
    }
    public Date getInscripcionFechaInscripcion() {
        return this.inscripcionFechaInscripcion;
    }
    
    public void setInscripcionFechaInscripcion(Date inscripcionFechaInscripcion) {
        this.inscripcionFechaInscripcion = inscripcionFechaInscripcion;
    }
    public String getNumOrdenInscripcion() {
        return this.numOrdenInscripcion;
    }
    
    public void setNumOrdenInscripcion(String numOrdenInscripcion) {
        this.numOrdenInscripcion = numOrdenInscripcion;
    }




}


