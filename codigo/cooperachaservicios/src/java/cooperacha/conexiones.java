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
import javax.swing.*; 
import java.sql.*; 
import org.postgresql.Driver;


public class conexiones {
        public  Connection conexion; 
        public Statement sentencia; 
        public ResultSet resultado;

        //realiza la conexion con la base de datos 
public void conectar() { 
    try { 
        Class.forName("org.postgresql.Driver"); 
    } catch (Exception e) { 
        JOptionPane.showMessageDialog(null, "No se pudo cargar el puente JDBC-ODBC."); 
        return; 
    } 
    try { 
        conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cooperachadb", "postgres", "112016f2"); 
        sentencia = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
        //JOptionPane.showMessageDialog(null, "Conexión establecida"); 
    } catch (Exception er) { 
        JOptionPane.showMessageDialog(null, "Error de conexion"); 
    } 
}

    // inserta o actualiza en base de datos
    public void agregar (String cadena) throws Exception { 
        if (conexion == null) { 
            conectar(); 
        } 
        try { 
            sentencia.execute(cadena); 
        } catch (Exception er) { 
           throw new Exception();
        } 
    }
    
    // realiza una consulta a la base de datos y devuelve un resultset
    public ResultSet consultar(String consulta){
        try{
            resultado=sentencia.executeQuery(consulta);
            
        }catch(Exception e){
        
        }
    return resultado;
}
    
    // cierra la conexion
    public void cerrar(){
        try{
         sentencia.close();
        conexion.close();
        }catch(Exception er){
        
        }
        
     
        
    }
}

