/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Dao;

import model.Entities.Respuesta;
import model.Entities.Test;

/**
 *
 * @author VASS13
 */
public class RespuestaDaoServiceImpl implements RespuestaDaoService {
RespuestaDaoImpl respuestaDaoImpl = new RespuestaDaoImpl();
    
     @Override
    public void guardar(Respuesta respuesta) {
        respuestaDaoImpl.guardar(respuesta);
    }
    
}
