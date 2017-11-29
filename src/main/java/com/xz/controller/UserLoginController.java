package com.xz.controller;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xz.entity.UserLogin;
import com.xz.model.json.JsonModel;
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
	
	@RequestMapping("checkUser")
	@ResponseBody
	public JsonModel checkUser(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String name = request.getParameter("userName");
		String pwd = request.getParameter("userPwd");
		UserLogin user = new UserLogin();
		user.setUserName(name);
		user.setUserPassword(pwd);
		UserLogin userLogin = userLoginService.checkUserExist(user);
		session.setAttribute("isLogin", "0");
		session.setAttribute("userName", userLogin.getUserName());
		List<UserLogin> list = new ArrayList<UserLogin>();
		Map<String, String> condition = new HashMap<String, String>();
		condition.put("userName", userLogin.getUserName());
		condition.put("userPwd", userLogin.getUserPassword());
		session.setAttribute("userRole", userLogin.getUserRole());
		// TODO: userRoleId
		session.setAttribute("userRoleId", "1");
		session.setAttribute("userId", userLogin.getId());
		return new JsonModel(true, userLogin);
	}
	
	/**
	 * 功能：公共方法用于响应前台请求
	 * 
	 * @param response
	 * @param data
	 */
	private void printData(HttpServletResponse response, String data) {
		try {
			// System.out.println(data);
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = new PrintWriter(new OutputStreamWriter(
					response.getOutputStream(), "UTF-8"));
			out.println(data);
			out.close();
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
