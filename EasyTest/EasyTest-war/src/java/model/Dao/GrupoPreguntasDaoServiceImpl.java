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
public class GrupoPreguntasDaoServiceImpl implements GrupoPreguntasDaoService {

    GrupoPreguntasDaoImpl grupoPreguntasDaoImpl = new GrupoPreguntasDaoImpl();
    
    @Override
    public List<Grupopreguntas> getAll() {
        return grupoPreguntasDaoImpl.getAll();
    }

    @Override
    public Grupopreguntas getbyId(int idGrupopreguntas) {
        return grupoPreguntasDaoImpl.getbyId(idGrupopreguntas);
    }

    @Override
    public void guardar(Grupopreguntas grupopreguntas) {
        grupoPreguntasDaoImpl.guardar(grupopreguntas);
    }

    @Override
    public void eliminar(Grupopreguntas grupopreguntas) {
        grupoPreguntasDaoImpl.eliminar(grupopreguntas);
    }
    
}
