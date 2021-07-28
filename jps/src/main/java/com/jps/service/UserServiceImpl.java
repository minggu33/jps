package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO udao;
	
}
