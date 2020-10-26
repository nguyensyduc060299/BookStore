package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Book;

public interface BookDAO {
	Book findBy(int bookId);
	List<Book> findAll();
	List<Book> findAdmin(String bookName, String category, String publisher);
	List<Book> topNewBook(int number);
	List<Book> topPurchaseBook(int number);
	List<Book> topInterestingBook(int number);
	List<Book> searchByName(String bookName,String type);
	List<Book> findByCategory(int categoryId, String type);
	List<Book> findByCategory(int categoryId, int number);

	List<Book> findByPublisher(int publisherId, String type);
	
	void updateQuantity(Book book);
	boolean saveBook(Book book); 
	boolean deleteBook(int id);
	boolean updateBook(Book book);
	boolean updateAfterOrderBook(Book book);
	int getId(String tableName,String str);
	
	
}
