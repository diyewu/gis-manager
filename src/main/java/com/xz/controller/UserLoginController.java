package com.xz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xz.entity.UserLogin;
import com.xz.service.UserLoginService;

@RequestMapping("userlogin")
@Controller
public class UserLoginController {
	
	@Autowired
	private UserLoginService userLoginService;
	/**
	 * 测试地址： http://localhost:8080/userlogin/getUser?id=1
	 * @param id
	 * @return
	 */
	@RequestMapping("getUser")
	@ResponseBody
	public UserLogin getUser(String id) {
		return userLoginService.getUserById(id);
	}
}
