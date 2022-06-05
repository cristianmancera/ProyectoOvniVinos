package com.grupo2.springboot.backend.apirest.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="administrador")
public class AdministradorVo implements Serializable{

	@Id
	
	//Al no ser autogenerado no se le coloca la anotacion 
	//@GeneratedValue(strategy=GenerationType=?)
	private String correoAdmin;
	
	@Column(name="nombreAdmin")
	private String nombreAdmin;
	
	@Column(name="apellidoAdmin")
	private String apellidoAdmin; 
	
	@Column(name="direccionAdmin")
	private String direccionAdmin; 
	
	@Column(name="telefonoAdmin")
	private String telefonoAdmin; 
	
	@Column(name="passwordAdmin")
	private String passwordAdmin;
	
	
	public String getCorreoAdmin() {
		return correoAdmin;
	}
	public void setCorreoAdmin(String correoAdmin) {
		this.correoAdmin = correoAdmin;
	}
	public String getNombreAdmin() {
		return nombreAdmin;
	}
	public void setNombreAdmin(String nombreAdmin) {
		this.nombreAdmin = nombreAdmin;
	}
	public String getApellidoAdmin() {
		return apellidoAdmin;
	}
	public void setApellidoAdmin(String apellidoAdmin) {
		this.apellidoAdmin = apellidoAdmin;
	}
	public String getDireccionAdmin() {
		return direccionAdmin;
	}
	public void setDireccionAdmin(String direccionAdmin) {
		this.direccionAdmin = direccionAdmin;
	}
	public String getTelefonoAdmin() {
		return telefonoAdmin;
	}
	public void setTelefonoAdmin(String telefonoAdmin) {
		this.telefonoAdmin = telefonoAdmin;
	}
	public String getPasswordAdmin() {
		return passwordAdmin;
	}
	public void setPasswordAdmin(String passwordAdmin) {
		this.passwordAdmin = passwordAdmin;
	} 
	
	private static final long serialVersionUID = 1L;
}
