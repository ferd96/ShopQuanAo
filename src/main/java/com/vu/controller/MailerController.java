package com.vu.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vu.bean.MailInfo;
import com.vu.service.MailerService;



@Controller
public class MailerController {
	@Autowired
	MailerService mailer;


	// lab7.3
	
	@RequestMapping("/mailer/demo3")
	public String demo3(Model model) {
		// 1. mail người nhận
		//mailer.queue("caophucthinh24@gmail.com", "Subject..hi NGOC TRINH", "Body...hi NGOC TRINH");
		MailInfo mailinfo = new MailInfo();
		model.addAttribute("mailinfo", mailinfo);
		return "mail/mail1";
	}
	
	//@ResponseBody
	@RequestMapping("/mailer/send")
	public String send(Model model, MailInfo mailinfo) throws MessagingException {
		// 1. mail người nhận
		mailer.send(mailinfo.getTo(), mailinfo.getSubject(), mailinfo.getBody());
		model.addAttribute("mail", mailinfo);
		return "mail/send";
	}
	
	
}
