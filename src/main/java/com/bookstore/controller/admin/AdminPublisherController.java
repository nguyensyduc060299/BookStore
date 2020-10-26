package com.bookstore.controller.admin;

import java.util.List;

import com.bookstore.dao.UserDAO;
import com.bookstore.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.PublisherDAO;
import com.bookstore.model.Publisher;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller 
@RequestMapping("/admin/publisher-manage")
public class AdminPublisherController {
	
	@Autowired
	PublisherDAO publisherDAO;
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("") 
	public String showAllPublisher(Model model, HttpServletRequest request ) {
		List<Publisher> publishers = publisherDAO.findAll();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("publishers", publishers);
		
		return "admin/publisher-manage";
	}
	@RequestMapping(value ="/add", method = RequestMethod.GET)
	public String getAddPublisherForm(Model model, HttpServletRequest request){
		Publisher publisher = new Publisher();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		model.addAttribute("publisher",publisher);
		return "admin/publisher-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String savePublisher(@Valid @ModelAttribute("publisher")Publisher publisher,
								BindingResult bindingResult, Model model, HttpServletRequest request){
		if(bindingResult.hasErrors()){
			model.addAttribute("bindingError","Vui lòng không để trống");
			return getAddPublisherForm(model,request);
		}
		int result = publisherDAO.add(publisher);
		if(result == -1){
			model.addAttribute("bindingError","Thêm lỗi");
			return getAddPublisherForm(model, request);
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		return "redirect:/admin/publisher-manage";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updatePublisherForm(@RequestParam("id")int id, Model model, HttpServletRequest request){
		Publisher publisher = publisherDAO.findBy(id);
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		model.addAttribute("publisher",publisher);
		return "admin/publisher-update";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePublisher(@Valid @ModelAttribute("publisher") Publisher publisher,
								 BindingResult bindingResult, Model model,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			model.addAttribute("bindingError","Vui lòng không để trống");
			return updatePublisherForm(publisher.getId(),model,request);
		}
		boolean result = publisherDAO.update(publisher);
		if(result==false){
			model.addAttribute("bindingError","Cập nhật lỗi");
			return updatePublisherForm(publisher.getId(),model,request);
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		return "redirect:/admin/publisher-manage";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deletePublisher(@RequestParam("id")int id, Model model){
		boolean result = publisherDAO.delete(id);
		if(result==false){
			model.addAttribute("bindingError", "Xóa lỗi");
			return "redirect:/admin/publisher-manage";
		}
		return "redirect:/admin/publisher-manage";
	}

}

