package com.grupo2.springboot.backend.apirest.services.administrador;

import java.util.List;

import com.grupo2.springboot.backend.apirest.entity.AdministradorVo;

public interface IAdministradorService {
	
	public List<AdministradorVo> findAll();

}
