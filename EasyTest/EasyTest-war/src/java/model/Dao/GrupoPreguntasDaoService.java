/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import java.util.List;
import model.entities.Grupopreguntas;

/**
 *
 * @author VASS13
 */
public interface GrupoPreguntasDaoService {
           public List<Grupopreguntas> getAll();
    public Grupopreguntas getbyId(int idGrupopreguntas);
    public void guardar(Grupopreguntas grupopreguntas);
    public void eliminar(Grupopreguntas grupopreguntas);
    
}
