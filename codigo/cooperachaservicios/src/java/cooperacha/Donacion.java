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
public class Donacion {
    private int cod_donacion;
    private int cod_usuario;
    private int cod_recompensa;
    private int cod_iniciativa;
    private String fecha;
    private double monto;
    private String aprobacion;
    
    public void setCod_donacion(int coddona){
        cod_donacion=coddona;
    }
    
     public void setCod_usuario(int coduser){
        cod_usuario=coduser;
    }
     
     public void setCod_iniciativa(int cod){
        cod_iniciativa=cod;
    } 
     
     public void setCod_recompensa(int cod){
        cod_recompensa=cod;
    } 
    
     public void setFecha(String fech){
        fecha=fech;
    } 
    
      public void setMonto(double mont){
        monto=mont;
    }
    
    public void setAprobacion(String ap){
        aprobacion=ap;
    }
      
    public int getCod_donacion(){
        return cod_donacion;
    }  
    
    public int getCod_usuario(){
        return cod_usuario;
    }    
    
    public int getCod_iniciativa(){
        return cod_iniciativa;
    }    
    
    public int getCod_recompensa(){
        return cod_recompensa;
    }    
    
    public String getFecha(){
        return fecha;
    }    
    
    public double getMonto(){
        return monto;
    }  
    
    public String getAprobacion(){
        return aprobacion;
    } 
}
