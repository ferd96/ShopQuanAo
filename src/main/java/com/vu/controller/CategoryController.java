package com.vu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vu.dao.CategoryDAO;
import com.vu.entity.Category;

//import antlr.collections.List;

@Controller
public class CategoryController {
	// tiêm CaregoryDAO vào
		@Autowired
		CategoryDAO dao; // làm việc với bảng Categories
		// localhost:8080/category/index
		@RequestMapping("/category/index")
		public String index(Model model) {
			// tạo 1 đối tượng danh mục: item
			Category item = new Category();
			model.addAttribute("item", item);
			// lấy ra các danh sách danh mục ... gọi hàm fillAll()
			List<Category> items = dao.findAll();
			model.addAttribute("items", items);
			return "admin/home"; // view lên trang index

		}

		// hàm 2
		@RequestMapping("/category/edit/{id}")
		public String edit(Model model, @PathVariable("id") String id) {
			Category item = dao.findById(id).get();
			model.addAttribute("item", item);
			List<Category> items = dao.findAll();
			model.addAttribute("items", items);
			return "admin/home";
		}

		// hàm 3
		@RequestMapping("/category/create")
		public String create(Category item) {
			dao.save(item);
			return "redirect:/category/index";
		}

		// hàm 4
		@RequestMapping("/category/update")
		public String update(Category item) {
			dao.save(item);
			return "redirect:/category/edit/" + item.getId();
		}

		// hàm 5
		@RequestMapping("/category/delete/{id}")
		public String delete(@PathVariable("id") String id) {
			dao.deleteById(id);
			return "redirect:/category/index";
		}
	
}

