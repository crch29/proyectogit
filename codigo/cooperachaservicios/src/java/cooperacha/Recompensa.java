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
public class Recompensa {
     private int cod_recompensa;
    private int stock;
    private double precio_unidad;
    private String descripcion;
    private String estado;
    private String tipo;
    private int cod_iniciativa;
    
    public void setCod_recompensa(int cod){
        cod_recompensa=cod;
    }
    
    public void setStock(int stock1){
        stock=stock1;
    }
    
    public void setPrecio_unidad(double precio){
        precio_unidad=precio;
    }
    
    public void setDescripcion(String desc){
        descripcion=desc;
    }
    
    public void setEstado(String estad){
        estado=estad;
    }
    
    public void setTipo(String tip){
        tipo=tip;
    }
    
    
    public void setCod_iniciativa(int cod){
        cod_iniciativa=cod;
    }
    
    public int getCod_recompensa(){
        return cod_recompensa;
    }
    
    public int getStock(){
        return stock;
    }
    
    public double getPrecio_unidad(){
        return precio_unidad;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
    
    public String getEstado(){
        return estado;
    }
    
    public String getTipo(){
        return tipo;
    }
    
    public int getCod_iniciativa(){
        return cod_iniciativa;
    }
}
