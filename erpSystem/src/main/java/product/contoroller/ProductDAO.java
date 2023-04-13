package product.contoroller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import product.Product;
import product.ProductDTO;
import util.DBManager;

public class ProductDAO {
	private static final ProductDAO instance = new ProductDAO();

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private ProductDAO() {}

	public static ProductDAO getInstance() {
		return instance;
	}
	//Create
	public void createProduct(ProductDTO productDto) {
		this.conn = DBManager.getConnection();

		if(this.conn == null)
			return;

		String sql = "insert into product "+
				"(product_id, product_name, product_memo, product_handle_date, product_stock, product_pipe_line, product_price, product_category_id)"+
				"values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, 	productDto.getId());
			this.pstmt.setString(2, productDto.getName());
			this.pstmt.setString(3, productDto.getMemo());
			this.pstmt.setString(4, productDto.getHandleDate());
			this.pstmt.setString(5, productDto.getStock());
			this.pstmt.setString(6, productDto.getPipeLine());
			this.pstmt.setString(7, productDto.getPrice());
			this.pstmt.setInt(8, 	productDto.getCategoryId());

			this.pstmt.execute();
		} catch (SQLException e) {
			System.out.println("error by CREATE");
			e.printStackTrace();
		}

		DBManager.closeConnection(this.conn, this.pstmt);
	}

	//Read
	public Product getProductById(int id) {
		Product product = null;
		this.conn = DBManager.getConnection();

		if(this.conn == null)
			return null;

		String sql = "SELECT * FROM product WHERE product_id=?";

		try {
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, id);
			this.rs = this.pstmt.executeQuery();

			while(this.rs.next()) {
				int productId 	 =this.rs.getInt(1);
				String name		 =this.rs.getString(2);
				String memo		 =this.rs.getString(3);
				String handleDate=this.rs.getString(4);
				String stock	 =this.rs.getString(5);
				String pipeLine	 =this.rs.getString(6);
				String price	 =this.rs.getString(7);
				int categoryId	 =this.rs.getInt(8);
				product = new Product(productId, name, memo, handleDate, stock, pipeLine, price, categoryId);
			}

		} catch (SQLException e) {
			System.out.println("error by READ");
			e.printStackTrace();
		}
		DBManager.closeConnection(this.conn, this.pstmt, this.rs);

		return product;
	}

	//Update
	public void setProduct(ProductDTO productDto) {
		this.conn = DBManager.getConnection();

		if(this.conn == null)
			return;

		String sql = "UPDATE product SET"+
				" product_id=?, product_name=?, product_memo=?, product_handle_date=?, product_stock=?, product_pipe_line=?, product_price=?, product_category_id=?";

		try {
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, 	productDto.getId());
			this.pstmt.setString(2, productDto.getName());
			this.pstmt.setString(3, productDto.getMemo());
			this.pstmt.setString(4, productDto.getHandleDate());
			this.pstmt.setString(5, productDto.getStock());
			this.pstmt.setString(6, productDto.getPipeLine());
			this.pstmt.setString(7, productDto.getPrice());
			this.pstmt.setInt(8, 	productDto.getCategoryId());

			this.pstmt.execute();
		} catch (SQLException e) {
			System.out.println("error by UPDATE");
			e.printStackTrace();
		}
		DBManager.closeConnection(this.conn, this.pstmt);
	}

	//Delete
	public void removeProductById(int id) {
		this.conn = DBManager.getConnection();

		if(this.conn == null)
			return;

		String sql = "DELETE FROM product WHERE product_id=?";

		try {
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, id);
			this.pstmt.execute();
		} catch (SQLException e) {
			System.out.println("error by DELETE");
			e.printStackTrace();
		}
		DBManager.closeConnection(this.conn, this.pstmt);
	}
}
