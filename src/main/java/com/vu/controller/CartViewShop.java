package com.vu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vu.dao.*;
import com.vu.entity.Account;
import com.vu.entity.Item;
import com.vu.entity.Order;
import com.vu.entity.OrderDetail;
import com.vu.service.MailerService;
import com.vu.service.ParamService;
import com.vu.service.SessionService;
import com.vu.service.ShoppingCartService;


@Controller
public class CartViewShop {
	@Autowired
	MailerService mailer;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	OrderDAO oderDAO;
	@Autowired
	AccountDAO accountDao;
	@Autowired
	ShoppingCartService cart; // 1. tiêm Spring Bean đã viết ở bài trước
	@Autowired
	SessionService 	sessionService;
	@Autowired
	ParamService paramService;
	@Autowired
	AccountDAO dao;
	//2. xem giỏ hàng
	@Autowired
	ProductDAO productDAO;
	@RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("Total",cart.getAmount());
		model.addAttribute("cart", cart);
		model.addAttribute("user",accountDao);
	
		return "site/shop-cart"; //3. view lên trang giỏ hảng index
	}
	
	///////////////////////////////////
	
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart/view"; // hiển thị giỏ hàng
	}
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, 
	@RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}
	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}
	
	//// Check out
	@RequestMapping("/checkout")
	public String checkout() {
		String username = sessionService.get("username");
		String  address = paramService.getString("address","");
		if(username==null) {
			return "redirect:/account/login";
		}
		Account  account = null;
		if (accountDao.findById(username).isPresent()) {
//			  Laaysc ac dau"
			account = accountDao.findById(username).get();
			Order order = new Order();
			order.setAccount(account);
			order.setAddress(address);
			order.setCreateDate(new Date());
			// Tao ra listdetail
			List<OrderDetail> orderDetails = new ArrayList<>();
                  /// duyet tat ca trong
			for(Item pd:cart.getItems()) {
				OrderDetail od = new OrderDetail();
				od.setOrder(order);
				productDAO.findById(pd.getId()).ifPresent(p->{
					od.setProduct(p);
				});
				od.setPrice(pd.getPrice());
				od.setQuantity(pd.getQty());
				orderDetails.add(od);
				
			}
			order.setOrderDetails(orderDetails);
			oderDAO.save(order);
			for(OrderDetail dt: orderDetails) {
				orderDetailDAO.save(dt);
			}
			cart.clear();
		}
		return "redirect:/cart/view";
	}
	@RequestMapping("/forgotpassword")
	public String fogotPost(Model model) throws MessagingException  {
		model.addAttribute("cart", cart);
		
		model.addAttribute("total", cart.getAmount());

		String username = paramService.getString("username", "");
		String email = paramService.getString("email", "");

		Account account = dao.findById(username).orElse(null);
		if (account == null) {
			
		} else {
			if (account.getEmail().equals(email)) {
				mailer.send(email, "Dev shop re-issues the password", "Your password is: " + account.getPassword());
				
			
			}
		}

		return "forgotpass"; // view len trang login
	}

}
