package com.xz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xz.dao.TuserMapper;
import com.xz.entity.Tuser;
import com.xz.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	
	@Autowired
	private TuserMapper tuserMapper;
	
	@Override
	public void addUser(Tuser user) {
		tuserMapper.insertSelective(user);
	}

	@Override
	public Tuser getUserById(Long id) {
		return tuserMapper.selectByPrimaryKey(id);
	}

}
