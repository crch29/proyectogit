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
public class Usuario {
    
    private String nickname, contraseña, nombre, fecha_nac, direccion, estado;
    private int cod_usuario, telefono, cod_rol, cod_formapago;
    
    //setters
    public void setCodusuario(int cod){
        cod_usuario=cod;
    }
    
    public void setNickname(String nom){
        nickname=nom;
    }
    
    public void setContraseña(String contra){
        contraseña=contra;
    }
    
    public void setNombre(String nom){
        nombre=nom;
    }
    
    public void setFechanac(String fecha){
        fecha_nac=fecha;
    }
    
    public void setDireccion(String direc){
        direccion=direc;
    }
    
    public void setTelefono(int tel){
        telefono=tel;
    }
    
    public void setEstado(String est){
        estado=est;
    }
    
    public void setCodrol(int rol){
        cod_rol=rol;
    }
    
    public void setCodformapago(int pago){
        cod_formapago=pago;
    }
    
    // getters
    
    public int getCodusuario(){
        return cod_usuario;
    }
    
    public String getNickname(){
        return nickname;
    }
    
    public String getContraseña(){
        return contraseña;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public String getFechanac(){
        return fecha_nac;
    }
    
    public String getDireccion(){
        return direccion;
    }
    
    public int getTelefono(){
        return telefono;
    }
    
    public String getEstado(){
        return estado;
    }
    
    public int getCodrol(){
        return cod_rol;
    }
    
    public int getCodformapago(){
        return cod_formapago;
    }
   
}
