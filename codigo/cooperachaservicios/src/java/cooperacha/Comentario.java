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
public class Comentario{
    private int cod_comentario, cod_usuario, cod_iniciativa;
    private String descripcion, fecha, estado;

    public int getCod_comentario() {
        return cod_comentario;
    }

    public void setCod_comentario(int cod_comentario) {
        this.cod_comentario = cod_comentario;
    }

    public int getCod_usuario() {
        return cod_usuario;
    }

    public void setCod_usuario(int cod_usuario) {
        this.cod_usuario = cod_usuario;
    }

    public int getCod_iniciativa() {
        return cod_iniciativa;
    }

    public void setCod_iniciativa(int cod_iniciativa) {
        this.cod_iniciativa = cod_iniciativa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
