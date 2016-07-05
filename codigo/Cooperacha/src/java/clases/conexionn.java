/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author carlosrene
 */
public class conexionn {
    
    public Connection getconexion(){
         Connection conexion=null;
        try{
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cooperachadb", "postgres", "112016f2"); 
        }catch(Exception e){
            e.printStackTrace();
        }
        return conexion;
    }
}
