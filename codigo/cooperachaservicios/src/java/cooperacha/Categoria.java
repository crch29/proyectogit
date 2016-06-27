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
public class Categoria {
    private int cod_categoria;
    private String nombre;
    private String descripcion;
    
    //setters
    
    public void setCodcategoria(int cod){
        cod_categoria=cod;
    }
    
    public void setNombre(String nom){
        nombre=nom;
    }
    
    public void setDescripcion(String des){
        descripcion=des;
    }
    
    //getters
    
    public int getCodcategoria(){
        return cod_categoria;
    }
    
    public String getNombre(){
        return nombre;
    }    
    
    public String Descripcion(){
        return descripcion;
    }
}

