package com.bookstore.controller.admin;

import java.util.List;

import com.bookstore.dao.UserDAO;
import com.bookstore.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.model.Category;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin/category-manage")
public class AdminCategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private UserDAO userDAO;

	@GetMapping("")
	public String getCategoryManage(Model model, HttpServletRequest request) {
		List<Category> categoryList = categoryDAO.findAll();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("total", categoryList.size());
		return "admin/category-manage";
	}

	@RequestMapping(value ="/add", method = RequestMethod.GET)
	public String getAddCategoryForm(Model model, HttpServletRequest request){
		Category category = new Category();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		model.addAttribute("category",category);
		return "admin/category-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String saveCategory(@Valid @ModelAttribute("category")Category category,
							   BindingResult bindingResult, Model model, HttpServletRequest request){
		if(bindingResult.hasErrors()){
			model.addAttribute("bindingError","Vui lòng không để trống");
			return getAddCategoryForm(model,request);
		}
		boolean result = categoryDAO.add(category);
		if(result == false){
			model.addAttribute("bindingError","Thêm lỗi");
			return getAddCategoryForm(model, request);
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		return "redirect:/admin/category-manage";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateCategoryForm(@RequestParam("id")int id, Model model, HttpServletRequest request){
		Category category = categoryDAO.findBy(id);
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		model.addAttribute("category",category);
		return "admin/category-update";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateCategory(@Valid @ModelAttribute("category") Category category,
								 BindingResult bindingResult, Model model,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			model.addAttribute("bindingError","Vui lòng không để trống");
			return updateCategoryForm(category.getId(),model,request);
		}
		boolean result = categoryDAO.updateCategory(category);
		if(result==false){
			model.addAttribute("bindingError","Thêm lỗi");
			return updateCategoryForm(category.getId(),model,request);
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user",user);
		return "redirect:/admin/category-manage";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCategory(@RequestParam("id")int id, Model model){
		boolean result = categoryDAO.deleteCategory(id);
		if(result==false){
			model.addAttribute("bindingError", "Xóa lỗi");
			return "redirect:/admin/category-manage";
		}
		return "redirect:/admin/category-manage";
	}

}
