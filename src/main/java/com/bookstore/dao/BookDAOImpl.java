package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Book;
import com.bookstore.model.Category;
import com.bookstore.model.Publisher;

/*
 * Lớp làm việc trực tiếp với DB
 */

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Autowired 				//nhúng bean DriverManagerDataSource đã khởi tạo vào dataSource
	private DataSource dataSource;
	@Autowired 
	private CategoryDAO categoryDAO;
	@Autowired
	private PublisherDAO publisherDAO;
	
	private Connection conn = null;
	private Statement statement = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;

	private int publisherId = -1;
	private int categoryId = -1;
	
	/*
	 *  Constant for table 
	*/


	@Override
	public Book findBy(int bookId) {
		Book theBook = new Book();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, " +
					"b.total, b.price, b.year, b.description,"
					+ " pl.name, ct.name, b.num_purchase, b.rating"
					+ " FROM book AS b, publisher as pl, category as ct"
					+ " WHERE (b.category_id = ct.id or b.category_id is null)" +
					" and (b.publisher_id = pl.id or b.publisher_id is null) and b.id = ?");
			preStatement.setInt(1, bookId);
			result = preStatement.executeQuery();
			if (result.next()) {
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				theBook.setNumPurchase(result.getInt(11));
				theBook.setRating(result.getInt(12));
				return theBook;
			} else {
				return null;
			}

		} catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<Book> findAdmin(String bookName, String category, String publisher){
		List<Book> books = new ArrayList<Book>();
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, " +
					"b.description,pl.name, ct.name, b.num_purchase, b.rating " +
					"FROM book AS b, publisher as pl, category as ct" +
					" where ";

			if( bookName.length() == 0){
				sql+= "true and ";
			}else{
				sql += " MATCH(b.name) AGAINST ( \"*"+bookName+"*\" IN NATURAL LANGUAGE MODE) and ";
			}

			if(category.length() == 0){
				sql+=" b.category_id = ct.id and ";
			}else{
				sql+=" b.category_id = ct.id and MATCH(ct.name) AGAINST ( \"*"+category+"*\" IN NATURAL LANGUAGE MODE) and ";
			}

			if(publisher.length() == 0){
				sql+=" b.publisher_id = pl.id ";
			}else{
				sql+=" b.publisher_id = pl.id and MATCH(pl.name) AGAINST ( \"*"+publisher+"*\" IN NATURAL LANGUAGE MODE)" ;
			}
			System.out.println(sql);
			preStatement = conn.prepareStatement(sql);
			result = preStatement.executeQuery();
			while (result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				theBook.setNumPurchase(result.getInt(11));
				theBook.setRating(result.getInt(12));
				books.add(theBook);
			}
		} catch (SQLException e){
			return null;
		}
		return books;
	}
	@Override
	public List<Book> findAll() {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			statement = conn.createStatement();
			result = statement.executeQuery("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name"
					+ " FROM book AS b "
					+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
					+ " INNER JOIN category AS ct ON b.category_id = ct.id");
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				books.add(theBook);
			}
			result = statement.executeQuery("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name"
					+ " FROM book AS b ,publisher AS pl"
					+ " WHERE b.category_id IS null and b.publisher_id = pl.id");
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory("Chưa xác định thể loại");
				books.add(theBook);
			}
			result = statement.executeQuery("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, ct.name"
					+ " FROM book AS b, category AS ct"
					+ " where b.publisher_id IS null and b.category_id = ct.id");
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setCategory(result.getString(9));
				theBook.setPublisher("Chưa xác định NXB");
				books.add(theBook);
			}
			result = statement.executeQuery("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description"
					+ " FROM book AS b "
					+ " where b.category_id IS null and b.publisher_id IS null ");
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher("Chưa xác định NXB");
				theBook.setCategory("Chưa xác định thể loại");
				books.add(theBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return books;
	}
	
	
	public boolean saveBook(Book book) {
		
		try {
			conn = dataSource.getConnection();
			
			Publisher publisher = publisherDAO.findBy(book.getPublisher());

			Category category = categoryDAO.findBy(book.getCategory());
			
			preStatement = conn.prepareStatement("INSERT INTO book(name, author, publisher_id, category_id, image, price, description,year, total)"
					+ " VALUES(?,?,?,?,?,?,?,?,?)");
			preStatement.setString(1, book.getName());
			preStatement.setString(2, book.getAuthor());
			preStatement.setInt(3, publisher.getId());
			preStatement.setInt(4, category.getId());
			preStatement.setString(5,  book.getImage());
			preStatement.setInt(6, book.getPrice());
			preStatement.setString(7,  book.getDescription());
			preStatement.setInt(8, book.getYear());
			preStatement.setInt(9, book.getTotalInStock());
			
			int affected  = preStatement.executeUpdate();
			if (affected == 0) {
				return false;
			} else {
				return true;
			}
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean deleteBook(int id) {
		String delete = "DELETE FROM book where id = ?";
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(delete);
			preStatement.setInt(1, id);
			if(preStatement.executeUpdate() > 0) 
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean updateBook(Book book) {
		publisherId = getId("publisher",book.getPublisher());
		categoryId = getId("category",book.getCategory());
		String update = "UPDATE book SET name = ?,author = ?,publisher_id = ?,category_id = ?,image = ?,total = ?,price = ?,year = ?,"
				+ "description = ?"
				+ " WHERE id = ?";
		System.out.println("id book update" + book.getId());
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(update);
			preStatement.setString(1, book.getName());
			preStatement.setString(2,book.getAuthor());
			preStatement.setInt(3,publisherId);
			preStatement.setInt(4,categoryId);
			preStatement.setString(5, book.getImage());
			preStatement.setInt(6,book.getTotalInStock());
			preStatement.setInt(7,book.getPrice());
			preStatement.setInt(8,book.getYear());
			preStatement.setString(9,book.getDescription());
			preStatement.setInt(10, book.getId());
			if(preStatement.executeUpdate() > 0) 
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	

	@Override
	public int getId(String nameTable,String str) {
		int id = -1;
		String select = "SELECT * FROM " + nameTable;
		String insert = "INSERT INTO "+nameTable+"(name) VALUES(?)";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			result = preStatement.executeQuery();
			while(result.next()) {
				if(result.getString(2).equals(str))
					id = result.getInt(1);
			}
			if (id == -1) {
				preStatement = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
				preStatement.setString(1,str);
				preStatement.execute();
				result = preStatement.getGeneratedKeys();
				while(result.next()) {
					id = result.getInt(1);
				}
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return id;

	}

	@Override
	public void updateQuantity(Book book) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("UPDATE book SET total = ? WHERE id = ?");
			preStatement.setInt(1, book.getTotalInStock());
			preStatement.setInt(2, book.getId());
			preStatement.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Book> topNewBook(int number) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating "
					+ " FROM book AS b "
					+ " ORDER BY created_at DESC"
					+ " LIMIT ?");
			preStatement.setInt(1, number);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setImage(result.getString(3));
				theBook.setPrice(result.getInt(4));
				theBook.setRating(result.getInt(5));
				books.add(theBook);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return books;
	}

	@Override
	public List<Book> topPurchaseBook(int number) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating "
					+ " FROM book AS b "
					+ " ORDER BY num_purchase DESC"
					+ " LIMIT ?");
			preStatement.setInt(1, number);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setImage(result.getString(3));
				theBook.setPrice(result.getInt(4));
				theBook.setRating(result.getInt(5));

				books.add(theBook);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return books;
	}

	@Override
	public List<Book> searchByName(String bookName,String type) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			if(type == "name") {
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating FROM book as b"
						+ " WHERE MATCH(name) AGAINST (? IN NATURAL LANGUAGE MODE)"
						+ "ORDER  BY b.name ASC");
			} else if (type == "price"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating FROM book as b"
						+ " WHERE MATCH(name) AGAINST (? IN NATURAL LANGUAGE MODE)"
						+ "ORDER  BY b.price ASC");
			} else if ( type == "popular"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating FROM book as b"
						+ " WHERE MATCH(name) AGAINST (? IN NATURAL LANGUAGE MODE)"
						+ "ORDER  BY b.num_purchase ASC");
			}
			preStatement.setString(1, "*"+bookName+"*");
			result = preStatement.executeQuery();
			while(result.next()) {

					Book theBook = new Book();
					theBook.setId(result.getInt(1));
					theBook.setName(result.getString(2));
					theBook.setImage(result.getString(3));
					theBook.setPrice(result.getInt(4));
					theBook.setRating(result.getInt(5));
					books.add(theBook);
					
				}
			if (books.size() == 0) {
				System.out.println("Full text search không có kết quả");
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating "
						+ " FROM book AS b WHERE b.name LIKE ?"
						+ " ORDER BY name ASC");
				preStatement.setString(1, "%"+bookName+"%");
				result = preStatement.executeQuery();
				
				while(result.next()) {
					Book theBook = new Book();
					theBook.setId(result.getInt(1));
					theBook.setName(result.getString(2));
					theBook.setImage(result.getString(3));
					theBook.setPrice(result.getInt(4));
					theBook.setRating(result.getInt(5));
					books.add(theBook);
				}
			}
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return books;
	}

	@Override
	public boolean updateAfterOrderBook(Book book) {
		publisherId = getId("publisher",book.getPublisher());
		categoryId = getId("category",book.getCategory());
		String update = "UPDATE book SET total = ?, num_purchase = ?"
				+ " WHERE id = ?";
		System.out.println("id book update after order" + book.getId());
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(update);
			preStatement.setInt(1, book.getTotalInStock());
			preStatement.setInt(2, book.getNumPurchase());
			preStatement.setInt(3, book.getId());
			if(preStatement.executeUpdate() > 0) 
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Book> findByCategory(int categoryId, String type) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			if(type == "name") {
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE ct.id = ?"
						+ "ORDER BY b.name asc");
			} else if (type == "price"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE ct.id = ?"
						+ "ORDER BY b.price ASC");
			} else if ( type == "popular"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE ct.id = ?"
						+ "ORDER BY b.num_purchase ASC");
			}
			preStatement.setInt(1, categoryId);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				theBook.setRating(result.getInt(11));
				books.add(theBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return books;
	}

	@Override
	public List<Book> findByPublisher(int publisherId, String type) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
//			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
//					+ " FROM book AS b "
//					+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
//					+ " INNER JOIN category AS ct ON b.category_id = ct.id"
//					+ "	WHERE pl.id = ?");
			if(type == "name") {
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE pl.id = ?"
						+ "ORDER BY b.name ASC");
			} else if (type == "price"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE pl.id = ?"
						+ "ORDER BY b.price ASC");
			} else if ( type == "popular"){
				preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
						+ " FROM book AS b "
						+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
						+ " INNER JOIN category AS ct ON b.category_id = ct.id"
						+ "	WHERE pl.id = ?"
						+ "ORDER BY b.num_purchase ASC");
			}
			preStatement.setInt(1, publisherId);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				theBook.setRating(result.getInt(11));

				books.add(theBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return books;
	}

	@Override
	public List<Book> topInterestingBook(int number) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.image,b.price, b.rating "
					+ " FROM book AS b "
					+ " ORDER BY rating DESC"
					+ " LIMIT ?");
			preStatement.setInt(1, number);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setImage(result.getString(3));
				theBook.setPrice(result.getInt(4));
				theBook.setRating(result.getInt(5));

				books.add(theBook);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return books;
	}

	@Override
	public List<Book> findByCategory(int categoryId, int number) {
		List<Book> books = new ArrayList<Book>();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, b.description, pl.name, ct.name, b.rating"
					+ " FROM book AS b "
					+ " INNER JOIN publisher AS pl ON b.publisher_id = pl.id"
					+ " INNER JOIN category AS ct ON b.category_id = ct.id"
					+ "	WHERE ct.id = ?"
					+ "	LIMIT ?");
			preStatement.setInt(1, categoryId);
			preStatement.setInt(2, number);
			result = preStatement.executeQuery();
			while(result.next()) {
				Book theBook = new Book();
				theBook.setId(result.getInt(1));
				theBook.setName(result.getString(2));
				theBook.setAuthor(result.getString(3));
				theBook.setImage(result.getString(4));
				theBook.setTotalInStock(result.getInt(5));
				theBook.setPrice(result.getInt(6));
				theBook.setYear(result.getInt(7));
				theBook.setDescription(result.getString(8));
				theBook.setPublisher(result.getString(9));
				theBook.setCategory(result.getString(10));
				theBook.setRating(result.getInt(11));

				books.add(theBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return books;
	}
}

