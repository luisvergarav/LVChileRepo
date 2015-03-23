package model.Entitys;
// Generated 07-07-2014 01:00:13 AM by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Taller generated by hbm2java
 */
public class Taller  implements java.io.Serializable {


     private Integer idTaller;
     private Institucion institucion;
     private TipoTaller tipoTaller;
     private int cupos;
     private String codigo;
     private String nombreTaller;
     private Date inicioTaller;
     private Date terminoTaller;
     private String claseTaller;
     private int primero;
     private BigDecimal monto;
     private int segundo;
     private int tercero;
     private int cuarto;
     private int quinto;
     private int sexto;
     private int septimo;
     private int octavo;
     private int pmedio;
     private int smedio;
     private int tmedio;
     private int cmedio;
     private int prekinder;
     private int kinder;
     private int jardin;
     private Set seccions = new HashSet(0);
     private Set pagadas = new HashSet(0);
     private Set gratises = new HashSet(0);
     private Semestre semestre;
     private int inscritos;
     private String genero;

    public Taller() {

    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    
    
    public int getInscritos() {
        return inscritos;
    }

    public void setInscritos(int inscritos) {
        this.inscritos = inscritos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    
    

    public Semestre getSemestre() {
        return semestre;
    }

    public void setSemestre(Semestre semestre) {
        this.semestre = semestre;
    }

    
	
    public Taller(Institucion institucion, TipoTaller tipoTaller, int cupos, String nombreTaller, Date inicioTaller, Date terminoTaller, String claseTaller, int primero, BigDecimal monto, int segundo, int tercero, int cuarto, int quinto, int sexto, int septimo, int octavo, int pmedio, int smedio, int tmedio, int cmedio, int prekinder, int kinder, int jardin) {
        this.institucion = institucion;
        this.tipoTaller = tipoTaller;
        this.cupos = cupos;
        this.nombreTaller = nombreTaller;
        this.inicioTaller = inicioTaller;
        this.terminoTaller = terminoTaller;
        this.claseTaller = claseTaller;
        this.primero = primero;
        this.monto = monto;
        this.segundo = segundo;
        this.tercero = tercero;
        this.cuarto = cuarto;
        this.quinto = quinto;
        this.sexto = sexto;
        this.septimo = septimo;
        this.octavo = octavo;
        this.pmedio = pmedio;
        this.smedio = smedio;
        this.tmedio = tmedio;
        this.cmedio = cmedio;
        this.prekinder = prekinder;
        this.kinder = kinder;
        this.jardin = jardin;
    }
    public Taller(Institucion institucion, TipoTaller tipoTaller, int cupos, String nombreTaller, Date inicioTaller, Date terminoTaller, String claseTaller, int primero, BigDecimal monto, int segundo, int tercero, int cuarto, int quinto, int sexto, int septimo, int octavo, int pmedio, int smedio, int tmedio, int cmedio, int prekinder, int kinder, int jardin, Set seccions, Set pagadas, Set gratises) {
       this.institucion = institucion;
       this.tipoTaller = tipoTaller;
       this.cupos = cupos;
       this.nombreTaller = nombreTaller;
       this.inicioTaller = inicioTaller;
       this.terminoTaller = terminoTaller;
       this.claseTaller = claseTaller;
       this.primero = primero;
       this.monto = monto;
       this.segundo = segundo;
       this.tercero = tercero;
       this.cuarto = cuarto;
       this.quinto = quinto;
       this.sexto = sexto;
       this.septimo = septimo;
       this.octavo = octavo;
       this.pmedio = pmedio;
       this.smedio = smedio;
       this.tmedio = tmedio;
       this.cmedio = cmedio;
       this.prekinder = prekinder;
       this.kinder = kinder;
       this.jardin = jardin;
       this.seccions = seccions;
       this.pagadas = pagadas;
       this.gratises = gratises;
    }
   
    public Integer getIdTaller() {
        return this.idTaller;
    }
    
    public void setIdTaller(Integer idTaller) {
        this.idTaller = idTaller;
    }
    public Institucion getInstitucion() {
        return this.institucion;
    }
    
    public void setInstitucion(Institucion institucion) {
        this.institucion = institucion;
    }
    public TipoTaller getTipoTaller() {
        return this.tipoTaller;
    }
    
    public void setTipoTaller(TipoTaller tipoTaller) {
        this.tipoTaller = tipoTaller;
    }
    public int getCupos() {
        return this.cupos;
    }
    
    public void setCupos(int cupos) {
        this.cupos = cupos;
    }
    public String getNombreTaller() {
        return this.nombreTaller;
    }
    
    public void setNombreTaller(String nombreTaller) {
        this.nombreTaller = nombreTaller;
    }
    public Date getInicioTaller() {
        return this.inicioTaller;
    }
    
    public void setInicioTaller(Date inicioTaller) {
        this.inicioTaller = inicioTaller;
    }
    public Date getTerminoTaller() {
        return this.terminoTaller;
    }
    
    public void setTerminoTaller(Date terminoTaller) {
        this.terminoTaller = terminoTaller;
    }
    public String getClaseTaller() {
        return this.claseTaller;
    }
    
    public void setClaseTaller(String claseTaller) {
        this.claseTaller = claseTaller;
    }
    public int getPrimero() {
        return this.primero;
    }
    
    public void setPrimero(int primero) {
        this.primero = primero;
    }
    public BigDecimal getMonto() {
        return this.monto;
    }
    
    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }
    public int getSegundo() {
        return this.segundo;
    }
    
    public void setSegundo(int segundo) {
        this.segundo = segundo;
    }
    public int getTercero() {
        return this.tercero;
    }
    
    public void setTercero(int tercero) {
        this.tercero = tercero;
    }
    public int getCuarto() {
        return this.cuarto;
    }
    
    public void setCuarto(int cuarto) {
        this.cuarto = cuarto;
    }
    public int getQuinto() {
        return this.quinto;
    }
    
    public void setQuinto(int quinto) {
        this.quinto = quinto;
    }
    public int getSexto() {
        return this.sexto;
    }
    
    public void setSexto(int sexto) {
        this.sexto = sexto;
    }
    public int getSeptimo() {
        return this.septimo;
    }
    
    public void setSeptimo(int septimo) {
        this.septimo = septimo;
    }
    public int getOctavo() {
        return this.octavo;
    }
    
    public void setOctavo(int octavo) {
        this.octavo = octavo;
    }
    public int getPmedio() {
        return this.pmedio;
    }
    
    public void setPmedio(int pmedio) {
        this.pmedio = pmedio;
    }
    public int getSmedio() {
        return this.smedio;
    }
    
    public void setSmedio(int smedio) {
        this.smedio = smedio;
    }
    public int getTmedio() {
        return this.tmedio;
    }
    
    public void setTmedio(int tmedio) {
        this.tmedio = tmedio;
    }
    public int getCmedio() {
        return this.cmedio;
    }
    
    public void setCmedio(int cmedio) {
        this.cmedio = cmedio;
    }
    public int getPrekinder() {
        return this.prekinder;
    }
    
    public void setPrekinder(int prekinder) {
        this.prekinder = prekinder;
    }
    public int getKinder() {
        return this.kinder;
    }
    
    public void setKinder(int kinder) {
        this.kinder = kinder;
    }
    public int getJardin() {
        return this.jardin;
    }
    
    public void setJardin(int jardin) {
        this.jardin = jardin;
    }
    public Set getSeccions() {
        return this.seccions;
    }
    
    public void setSeccions(Set seccions) {
        this.seccions = seccions;
    }
    public Set getPagadas() {
        return this.pagadas;
    }
    
    public void setPagadas(Set pagadas) {
        this.pagadas = pagadas;
    }
    public Set getGratises() {
        return this.gratises;
    }
    
    public void setGratises(Set gratises) {
        this.gratises = gratises;
    }




}

