package com.xz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xz.entity.Tuser;
import com.xz.service.UserService;

@RequestMapping("user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 测试地址： http://localhost:8080/user/getUser?id=1
	 * @param id
	 * @return
	 */
	@RequestMapping("getUser")
	@ResponseBody
	public Tuser getUser(Long id) {
		Tuser user = userService.getUserById(id);
		return user;
	}
	
	
	/**
	 * 测试地址： http://localhost:8080/user/addUser?username=你的名字
	 * @param user
	 */
	@RequestMapping("addUser")
	@ResponseBody
	public void addUser(Tuser user) {
		userService.addUser(user);
	}
	
}
