package com.grupo2.springboot.backend.apirest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo2.springboot.backend.apirest.entity.AdministradorVo;
import com.grupo2.springboot.backend.apirest.services.administrador.IAdministradorService;

@RestController
@RequestMapping("/api")
public class AdministradorRestController {
	
	@Autowired
	private IAdministradorService administradorService;
	
	// http://localhost:8080/api/administradores
	@GetMapping("/administradores")
	public List<AdministradorVo>index(){
		return administradorService.findAll();
	}

}
