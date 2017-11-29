package com.xz.service;

import com.xz.entity.Tuser;

public interface UserService {

	void addUser(Tuser user);
	
	Tuser getUserById(Long id);
	
}
