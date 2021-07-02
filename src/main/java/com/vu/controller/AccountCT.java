package com.vu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.vu.dao.AccountDAO;
import com.vu.dao.CategoryDAO;
import com.vu.entity.Account;
import com.vu.entity.Category;
import com.vu.entity.Product;
import com.vu.service.ParamService;


@RequestMapping("account")
@Controller
public class AccountCT {
	 @Autowired
	 ParamService paramService;
	@Autowired
	 AccountDAO dao; // làm việc với bảng Categories
	
	 @GetMapping("register")
	 public String showForm(Model model) {
		 Account item = new Account();
		 model.addAttribute("item",item);
		 return "admin/dangki";
	 }

	 @GetMapping("views")
	 public String views(Model model) {
		 List<Account> items = dao.findAll();
		 model.addAttribute("items",items);
		 return "admin/listadmin";
	 }
	 
	 @PostMapping("SaveOrUpdate")
	 public String saveorupdate(@ModelAttribute("item") Account ac, BindingResult result,Model model ,@RequestParam("image") MultipartFile multipartFile) throws IOException {
		 String filenameString= StringUtils.cleanPath(multipartFile.getOriginalFilename());
		 String uploadDrString="images/";
		 ac.setPhoto(filenameString);
		 dao.save(ac);
		 paramService.save(multipartFile, uploadDrString);
		 model.addAttribute("item", new Account());
		  return "redirect:views";
	 }
// EDIT
	     @GetMapping("/edit/{username}")
		public String edit(Model model, @PathVariable("username") String username) {
		    Account item = dao.findById(username).get();
			model.addAttribute("item", item);
			List<Account> items = dao.findAll();
			model.addAttribute("items", items);
			return "admin/dangki";
		}
	  // hàm 5
	  			@GetMapping("/delete/{username}")
	  			public String delete(@PathVariable("username") String  username) {
	  				dao.deleteById(username);
	  				return "redirect:/account/views";
	  			}
	 
}
	
