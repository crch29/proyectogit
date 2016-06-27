/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cooperacha;

/**
 *
 * @author carlosrene
 */
public class Moderador {
    
    private int cod_moderador, cod_iniciativa, cod_usuario;
    private String estado;
    
    public void setCodmoderador(int mod){
        cod_moderador=mod;
    }
    
    public void setCodiniciativa(int ini){
        cod_iniciativa=ini;
    }
    
    public void setCodusuario(int usuario){
        cod_usuario=usuario;
    }
    
    public void setEstado(String estad){
        estado=estad;
    }
    
    public int getCodmoderador(){
        return cod_moderador;
    }
    
    public int getCodiniciativa(){
        return cod_iniciativa;
    }
    
    public int getCodusuario(){
        return cod_usuario;
    }
    
    
    public String getEstado(){
        return estado;
    }
    
}
