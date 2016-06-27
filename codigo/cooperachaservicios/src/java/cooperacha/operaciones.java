/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cooperacha;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.util.*;
import java.sql.*;
import cooperacha.Categoria;
import cooperacha.Usuario;
import cooperacha.Iniciativa;
import cooperacha.Recompensa;

/**
 *
 * @author carlosrene
 */
@WebService(serviceName = "operaciones")
public class operaciones {

    ResultSet rs;

    /**
     * METODO QUE REALIZA CONSULTAS DE UNA LISTA DE VALORES PARA LOS JCOMBOBOX
     */
    @WebMethod(operationName = "consultarListas")
    public List consultarListas(@WebParam(name = "tabla") String tabla, @WebParam(name = "campo") String campo) {
         List<String> lista= new ArrayList<String>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from %s",tabla));

            while(rs.next()){
            lista.add(rs.getString(campo));
            }

            }catch(Exception e){

            }
            return lista;
    }


    /**
     * Web service operation
     */
    @WebMethod(operationName = "ingresarIniciativa")
    public void ingresarIniciativa(@WebParam(name = "nombre") String nombre, @WebParam(name = "descripcion") String descripcion, @WebParam(name = "meta") String meta, @WebParam(name = "tiempo") String tiempo, @WebParam(name = "cod_categoria") String cod_categoria, @WebParam(name = "cod_usuario") String cod_usuario) {
        String instruccion = String.format("insert into Iniciativa(nombre,descripcion,tiempo,cod_categoria,cod_usuario,meta) values('%s','%s','%s',%s,%s,%s);",nombre,descripcion,tiempo,cod_categoria,cod_usuario,meta);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "validarusuario")
    public String[] validarusuario(@WebParam(name = "nickname") String nickname, @WebParam(name = "contrasena") String contrasena) {
        String valido="valido";
        String invalido="invalido";
        String cod_usuario=null;
        String[] listadatos=new String[2];
        Usuario usuario = new Usuario();
                try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select nickname, contraseña, cod_usuario from Usuario where nickname='%s'", nickname));
                 while(rs.next()){
                     usuario.setNickname(rs.getString("nickname"));
                     usuario.setContraseña(rs.getString("contraseña"));
                     cod_usuario=String.valueOf(rs.getInt("cod_usuario"));
                     
                 }
                
            }catch(Exception e){
                 
            }
        if((nickname.equals(usuario.getNickname()))&&(contrasena.equals(usuario.getContraseña()))){
             listadatos[0]=valido;
             listadatos[1]=cod_usuario;
        }else{
            listadatos[0]=invalido;
        }
        return listadatos;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "busquedainiciativa")
    public List<Iniciativa> busquedainiciativa(@WebParam(name = "clave") String clave) {
         ArrayList<Iniciativa> listai= new ArrayList<Iniciativa>();
            String clave1= "%"+clave+"%";
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Iniciativa where nombre like '%s';", clave1));
                 while(rs.next()){
              Iniciativa iniciativa=new Iniciativa();
              iniciativa.setCodiniciativa(rs.getInt("cod_iniciativa"));
              iniciativa.setNombre(rs.getString("nombre"));
              iniciativa.setDescripcion(rs.getString("descripcion"));
              iniciativa.setTiempo(rs.getString("tiempo"));
              iniciativa.setCodcategoria(rs.getInt("cod_categoria"));
              iniciativa.setCodusuario(rs.getInt("cod_usuario"));
              iniciativa.setEstado(rs.getString("estado"));
              iniciativa.setMeta(rs.getDouble("meta"));
              iniciativa.setMonto(rs.getDouble("monto"));
              listai.add(iniciativa);
            }
            }catch(Exception e){
                 
            }
            
            return listai;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultaIniciativasPublicadas")
    public List<Iniciativa> consultaIniciativasPublicadas() {
        List<Iniciativa> listai= new ArrayList<Iniciativa>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar("select * from Iniciativa where estado='true';");
                 while(rs.next()){
              Iniciativa iniciativa=new Iniciativa();
              iniciativa.setCodiniciativa(rs.getInt("cod_iniciativa"));
              iniciativa.setNombre(rs.getString("nombre"));
              iniciativa.setDescripcion(rs.getString("descripcion"));
              iniciativa.setTiempo(rs.getString("tiempo"));
              iniciativa.setCodcategoria(rs.getInt("cod_categoria"));
              iniciativa.setCodusuario(rs.getInt("cod_usuario"));
              iniciativa.setEstado(rs.getString("estado"));
              iniciativa.setMeta(rs.getDouble("meta"));
              iniciativa.setMonto(rs.getDouble("monto"));
              listai.add(iniciativa);
            }
            }catch(Exception e){
                 
            }
            
            return listai;
    }

    /**
     * metodo utilizado para jsp mostrarIniciativa
     */
    @WebMethod(operationName = "mostrarIniciativa")
    public List<Iniciativa> mostrarIniciativa(@WebParam(name = "cod_iniciativa") int cod_iniciativa) {
        List<Iniciativa> listai= new ArrayList<Iniciativa>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Iniciativa where cod_iniciativa=%d;", cod_iniciativa));
                 while(rs.next()){
              Iniciativa iniciativa=new Iniciativa();
              iniciativa.setCodiniciativa(rs.getInt("cod_iniciativa"));
              iniciativa.setNombre(rs.getString("nombre"));
              iniciativa.setDescripcion(rs.getString("descripcion"));
              iniciativa.setTiempo(rs.getString("tiempo"));
              iniciativa.setCodcategoria(rs.getInt("cod_categoria"));
              iniciativa.setCodusuario(rs.getInt("cod_usuario"));
              iniciativa.setEstado(rs.getString("estado"));
              iniciativa.setMeta(rs.getDouble("meta"));
              iniciativa.setMonto(rs.getDouble("monto"));
              listai.add(iniciativa);
            }
            }catch(Exception e){
                 
            }
            
            return listai;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultaRecompensaIniciativa")
    public List<Recompensa> consultaRecompensaIniciativa(@WebParam(name = "cod_iniciativa") int cod_iniciativa) {
        List<Recompensa> listar= new ArrayList<Recompensa>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Recompensa where cod_iniciativa=%d;", cod_iniciativa));
                 while(rs.next()){
              Recompensa recompensa=new Recompensa();
              recompensa.setCod_recompensa(rs.getInt("cod_recompensa"));
              recompensa.setStock(rs.getInt("stock"));
              recompensa.setDescripcion(rs.getString("descripcion"));
              recompensa.setEstado(rs.getString("estado"));
              recompensa.setTipo(rs.getString("tipo"));
              recompensa.setCod_iniciativa(rs.getInt("cod_iniciativa"));
              recompensa.setPrecio_unidad(rs.getDouble("precio_unidad"));
              listar.add(recompensa);
            }
            }catch(Exception e){
                 
            }
            
            return listar;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "insertarDonacion")
    public void insertarDonacion(@WebParam(name = "fecha") String fecha, @WebParam(name = "cod_usuario") String cod_usuario, @WebParam(name = "cod_iniciativa") String cod_iniciativa, @WebParam(name = "cod_recompensa") String cod_recompensa, @WebParam(name = "monto") String monto) {
       String instruccion = String.format("insert into Donacion(fecha,cod_usuario,cod_iniciativa,cod_recompensa,monto) values('%s',%s,%s,%s,%s);",fecha,cod_usuario,cod_iniciativa,cod_recompensa,monto);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "actualizarIniciativaDonacion")
    public void actualizarIniciativaDonacion(@WebParam(name = "cod_iniciativa") String cod_iniciativa, @WebParam(name = "monto") String monto) {
       String instruccion = String.format("update Iniciativa set monto=monto+%s where cod_iniciativa=%s;",monto,cod_iniciativa);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ingresarIniciativaborrador")
    public void ingresarIniciativaborrador(@WebParam(name = "nombre") String nombre, @WebParam(name = "descripcion") String descripcion, @WebParam(name = "tiempo") String tiempo, @WebParam(name = "cod_categoria") String cod_categoria, @WebParam(name = "cod_usuario") String cod_usuario, @WebParam(name = "meta") String meta, @WebParam(name = "estado") String estado) {
         String instruccion = String.format("insert into Iniciativa(nombre,descripcion,tiempo,cod_categoria,cod_usuario,meta,estado) values('%s','%s','%s',%s,%s,%s,'%s');",nombre,descripcion,tiempo,cod_categoria,cod_usuario,meta,estado);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultarUsuario")
    public List<Usuario> consultarUsuario(@WebParam(name = "cod_usuario") String cod_usuario) {
       List<Usuario> listau= new ArrayList<Usuario>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Usuario where cod_usuario=%s;",cod_usuario));
                 while(rs.next()){
              Usuario usuario=new Usuario();
              usuario.setNickname(rs.getString("nickname"));
              usuario.setContraseña(rs.getString("contraseña"));
              usuario.setDireccion(rs.getString("direccion"));
              usuario.setTelefono(rs.getInt("telefono"));
              listau.add(usuario);
            }
            }catch(Exception e){
                 
            }
            
            return listau;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "actualizarUsuario")
    public void actualizarUsuario(@WebParam(name = "contrasena") String contrasena, @WebParam(name = "direccion") String direccion, @WebParam(name = "telefono") String telefono, @WebParam(name = "cod_usuario") String cod_usuario) {
        String instruccion = String.format("update Usuario set contraseña='%s', direccion='%s', telefono=%s where cod_usuario=%s;",contrasena,direccion,telefono,cod_usuario);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultarInicitativaporusuario")
    public List<Iniciativa> consultarInicitativaporusuario(@WebParam(name = "cod_usuario") String cod_usuario) {
        List<Iniciativa> listai= new ArrayList<Iniciativa>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Iniciativa where cod_usuario=%s;", cod_usuario));
                 while(rs.next()){
              Iniciativa iniciativa=new Iniciativa();
              iniciativa.setCodiniciativa(rs.getInt("cod_iniciativa"));
              iniciativa.setNombre(rs.getString("nombre"));
              iniciativa.setDescripcion(rs.getString("descripcion"));
              iniciativa.setTiempo(rs.getString("tiempo"));
              iniciativa.setCodcategoria(rs.getInt("cod_categoria"));
              iniciativa.setCodusuario(rs.getInt("cod_usuario"));
              iniciativa.setEstado(rs.getString("estado"));
              iniciativa.setMeta(rs.getDouble("meta"));
              iniciativa.setMonto(rs.getDouble("monto"));
              listai.add(iniciativa);
            }
            }catch(Exception e){
                 
            }
            
            return listai;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ingresarModerador")
    public void ingresarModerador(@WebParam(name = "cod_iniciativa") String cod_iniciativa, @WebParam(name = "cod_usuario") String cod_usuario) {
        String instruccion = String.format("insert into Moderador(cod_iniciativa,cod_usuario) values(%s,%s);",cod_iniciativa,cod_usuario);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultareliminarborrador")
    public List<Iniciativa> consultareliminarborrador(@WebParam(name = "cod_usuario") String cod_usuario) {
        List<Iniciativa> listai= new ArrayList<Iniciativa>();
            try{
                conexiones con=new conexiones();
                con.conectar();
                rs=con.consultar(String.format("select * from Iniciativa where (cod_usuario=%s and estado='false');", cod_usuario));
                 while(rs.next()){
              Iniciativa iniciativa=new Iniciativa();
              iniciativa.setCodiniciativa(rs.getInt("cod_iniciativa"));
              iniciativa.setNombre(rs.getString("nombre"));
              iniciativa.setDescripcion(rs.getString("descripcion"));
              iniciativa.setTiempo(rs.getString("tiempo"));
              iniciativa.setCodcategoria(rs.getInt("cod_categoria"));
              iniciativa.setCodusuario(rs.getInt("cod_usuario"));
              iniciativa.setEstado(rs.getString("estado"));
              iniciativa.setMeta(rs.getDouble("meta"));
              iniciativa.setMonto(rs.getDouble("monto"));
              listai.add(iniciativa);
            }
            }catch(Exception e){
                 
            }
            
            return listai;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "eliminarIniciativaborrador")
    public void eliminarIniciativaborrador(@WebParam(name = "cod_iniciativa") String cod_iniciativa) {
        String instruccion = String.format("delete from Iniciativa where cod_iniciativa=%s;",cod_iniciativa);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ingresarRecompensa")
    public void ingresarRecompensa(@WebParam(name = "stock") String stock, @WebParam(name = "descripcion") String descripcion, @WebParam(name = "tipo") String tipo, @WebParam(name = "cod_iniciativa") String cod_iniciativa, @WebParam(name = "precio") String precio) {
       String instruccion = String.format("insert into Recompensa(stock,descripcion,tipo,cod_iniciativa,precio) values(%s,'%s','%s',%s,%s);",stock,descripcion,tipo,cod_iniciativa,precio);
        try{
            conexiones con= new conexiones();
            con.agregar(instruccion);
            
        }catch(Exception e){
        
        }
    }
}
