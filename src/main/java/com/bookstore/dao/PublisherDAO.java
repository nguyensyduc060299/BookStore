package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Publisher;


public interface PublisherDAO {
	List<Publisher> findAll();
	Publisher findBy(int id);
	Publisher findBy(String publisherName);
	int add(Publisher publisher);
	boolean delete(int id);
	boolean update(Publisher publisher);
}
