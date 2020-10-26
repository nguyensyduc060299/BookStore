package com.bookstore.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.PublisherDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Category;
import com.bookstore.model.Publisher;
@Controller
@RequestMapping("/admin/book-manage")
public class AdminBookController {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PublisherDAO publisherDAO;
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value="", method = RequestMethod.GET)
	public String showBookManage(@RequestParam("bookName")String bookName,@RequestParam("category")String category,
								 @RequestParam("publisher")String publisher, Model model, HttpServletRequest request) {
		List<Book> books = bookDAO.findAdmin(bookName,category,publisher);
		List<Category> categories = categoryDAO.findAll();
		List<Publisher> publishers = publisherDAO.findAll();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("books", books);
		model.addAttribute("categories", categories);
		model.addAttribute("publishers", publishers);
		model.addAttribute("totalBook", books.size());
		return "admin/book-manage";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String getAddBookForm(Model model,HttpServletRequest request) {
		List<Category> categories = categoryDAO.findAll();
		List<Publisher> publishers = publisherDAO.findAll();
		Book theBook = new Book();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("book", theBook);
		model.addAttribute("mode", "add");
		model.addAttribute("categories", categories);
		model.addAttribute("publishers", publishers);
		return "admin/book-add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String saveBook(@Valid @ModelAttribute("book") Book theBook,
							BindingResult bindingResult, Model model,HttpServletRequest request) {
		if (bindingResult.hasErrors() ) {
			model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
			return getAddBookForm(model,request);
		}

		boolean result = bookDAO.saveBook(theBook);
		if (result == false) {
			model.addAttribute("bindingError", "Thêm sách lỗi");
			return getAddBookForm(model,request);
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		return "redirect:/admin/book-manage?bookName=&category=&publisher=";
	}

	@RequestMapping(value="/update", method=RequestMethod.GET) 
	public String getUpdateBookForm(@RequestParam("id") int bookID, Model model,HttpServletRequest request) {
		Book book = bookDAO.findBy(bookID);
		List<Category> categories = categoryDAO.findAll();
		List<Publisher> publishers = publisherDAO.findAll();
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		User user = userDAO.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("book", book);
		model.addAttribute("categories", categories);
		model.addAttribute("publishers", publishers);
		return "admin/book-update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateBook(@RequestParam("id") int id, @Valid @ModelAttribute("book") Book theBook,
							BindingResult bindingResult, Model model,HttpServletRequest request) {
		theBook.setId(id);
		if (bindingResult.hasErrors() ) {
			model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
			return getUpdateBookForm(theBook.getId(),model,request);
		}

		boolean result = bookDAO.updateBook(theBook);
		if (result == false) {
			model.addAttribute("bindingError", "Cập nhật sách lỗi");
			return getUpdateBookForm(theBook.getId(),model,request);
		}
		return "redirect:/admin/book-manage?bookName=&category=&publisher=";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteBook(@RequestParam("id") int id) {
		boolean result = bookDAO.deleteBook(id);
		if (result == false) {
			System.out.println("Xóa lỗi");
		} 
		return "redirect:/admin/book-manage?bookName=&category=&publisher=";
	}
}
