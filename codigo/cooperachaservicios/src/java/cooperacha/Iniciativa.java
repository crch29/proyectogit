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
public class Iniciativa {
    
    private String nombre,descripcion,tiempo,estado;
    private int cod_iniciativa,cod_categoria,cod_usuario;
    private double meta,monto;
    
    //setters
    public void setCodiniciativa(int cod){
        cod_iniciativa=cod;
    }
    
    public void setNombre(String nom){
        nombre=nom;
    }
    
    public void setDescripcion(String des){
        descripcion=des;
    }
    
    public void setTiempo(String tiem){
        tiempo=tiem;
    }
    
    public void setCodcategoria(int cat){
        cod_categoria=cat;
    }
    
    public void setCodusuario(int usu){
        cod_usuario=usu;
    }
    
    public void setEstado(String est){
        estado=est;
    }
    
    public void setMeta(double met){
        meta=met;
    }
    
    public void setMonto(double mon){
        monto=mon;
    }
    
    //getters
    
    public int getCodiniciativa(){
        return cod_iniciativa;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
    
    public String getTiempo(){
        return tiempo;
    }
    
    public int getCodcategoria(){
        return cod_categoria;
    }
    
    public int getCodusuario(){
        return cod_usuario;
    }
    
    public String getEstado(){
        return estado;
    }
    
    public double getMeta(){
        return meta;
    }
    
    public double getMonto(){
        return monto;
    }
    
    
}
