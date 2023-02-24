package com.booklog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booklog.dao.ApiDAO;
import com.vos.web.ApiDTO;
@Service
public class PublicDataService {
	
	@Autowired
	ApiDAO apiDAO;
	
	public ApiDTO getPublicApi() {
		return apiDAO.getPublicApi();
	}

}
