package com.vu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vu.dao.AccountDAO;
import com.vu.entity.Account;
import com.vu.service.CookieService;
import com.vu.service.ParamService;
import com.vu.service.SessionService;


@Controller
public class logincontroll  {
	
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	
	@GetMapping("/account/login")
	public String login() {
		return "admin/login";
	}
	@PostMapping("/account/login")
	public String login(Model model,
			@RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			Account user = dao.getOne(username);
			if(!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
				String uri = session.get("security-uri");
				if(uri != null) {
					return "redirect:" + uri;
				} else 
				{
					if(user.isAdmin()) {
						session.set("username", user.getUsername());
						model.addAttribute("message", "Login successfylly");
						return "redirect:/category/index";
					}
					else {
						session.set("username", user.getUsername());
						model.addAttribute("message", "Login successfylly");
						return "redirect:/site/product";
						
						
					}
				
					
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "account/login";
	
//		return "redirect:/product/page";
}
	
	
	//Đăng xuất
		@GetMapping("/logout")
		public String logout(Model model) {
			session.set("username",null);
			return "admin/login"; // view len trang login 
		}
	
	/*
	 * @RequestMapping("/login") public String index() {
	 * 
	 * return "admin/login"; }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * @Autowired SessionService SessionService;
	 * 
	 * @Autowired AccountDAO dao;
	 * 
	 * @Autowired CookieService CookieService;
	 * 
	 * @Autowired ParamService ParamService;
	 * 
	 * @RequestMapping("login1") public String Login (Model model) { String username
	 * = ParamService.getString("username",""); String password =
	 * ParamService.getString("password", ""); boolean remember =
	 * ParamService.getBoolean("remember", false); Account account =
	 * dao.findById(username).orElse(null); if
	 * (username.equalsIgnoreCase(account.getUsername())&&(password.equalsIgnoreCase
	 * (account.getPassword()))) {
	 * 
	 * SessionService.set("name", account.getFullname()); if (remember) {
	 * CookieService.add("user", username, 10); CookieService.add("pass", password,
	 * 10); }else { CookieService.remove(username); CookieService.remove(password);
	 * } if (account.isAdmin()) { return "redirect:/product/index";
	 * 
	 * }else { return "redirect:/site/product"; } } return "redirect:/login";
	 * 
	 * }
	 */
}
