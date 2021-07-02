package com.vu.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vu.dao.ProductDAO;
import com.vu.entity.Product;
import com.vu.service.SessionService;

@Controller
public class siteProduct {
 @Autowired
 ProductDAO dao;
// view lên
  @RequestMapping ("/site/product")
  public String paginate(Model model,@RequestParam("p")Optional<Integer>p ) {
	  Pageable pageable = PageRequest.of(p.orElse(0),8);
	  Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		return "/site/home";
  }
  
//   tìm tìm thoe giá
	@RequestMapping("/product/sort")
	public String sort(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "site/home2";
	}
	@RequestMapping("product/sort1")
	public String sort1(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "site/home2";
	}
	/// tìm sp

	@Autowired
	SessionService session;

	@RequestMapping("/product/search-and-page")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0),8);
		//Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable); //lab6.3
		Page<Product> page = dao.findAllByNameLike("%"+kwords+"%", pageable); //lab6.5
		model.addAttribute("page", page);
		return "/site/home";
	}
	
	
}
