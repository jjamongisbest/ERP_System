package customer.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import customer.Customer;
import customer.CustomerDTO;
import util.DBManager;

public class CustomerDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private CustomerDAO() {
	}

	private static CustomerDAO instance = new CustomerDAO();

	public static CustomerDAO getinstnace() {
		return instance;
	}

	// C
	public void createCustomer(CustomerDTO CustomerDto) {
		Customer customer = new Customer(CustomerDto);

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "INSERT INTO customer VALUES(?,?,?,?,?,?)";

			try {
				this.pstmt = conn.prepareStatement(str);

				this.pstmt.setInt(1, customer.getId());
				this.pstmt.setInt(2, customer.getGradeId());
				this.pstmt.setString(3, customer.getName());
				this.pstmt.setString(4, customer.getAddress());
				this.pstmt.setString(5, customer.getPhone());
				this.pstmt.setString(6, customer.getGender());

				this.pstmt.execute();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt);
			}
		}
	}
	// R
	public Customer readCustomer(int customerId) {
		Customer customer = null;
		
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "SELECT * FROM customer WHERE id=?";

			try {
				this.pstmt = conn.prepareStatement(str);
				
				this.pstmt.setInt(1, customerId);
				this.rs = this.pstmt.executeQuery();
				
				int id = this.rs.getInt(1);
				int gradeId = this.rs.getInt(2);
				String name = this.rs.getString(3);
				String address = this.rs.getString(4);
				String phone = this.rs.getString(5);
				String gender = this.rs.getString(6);
				
				customer = new Customer(id, gradeId, name, address, phone, gender);		

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt, rs);
			}
		}
		
		return customer;
	}

	// U
	public void updateCustomer(CustomerDTO CustomerDto) {
		Customer customer = new Customer(CustomerDto);

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "UPDATE customer SET name=?,address=?,phone=?,gender=? WHERE id=?";

			try {
				this.pstmt = conn.prepareStatement(str);

				this.pstmt.setString(1, customer.getName());
				this.pstmt.setString(2, customer.getAddress());
				this.pstmt.setString(3, customer.getPhone());
				this.pstmt.setString(4, customer.getGender());
				this.pstmt.setInt(5, customer.getId());

				this.pstmt.execute();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt);
			}
		}
	}

	// D
	public void deleteCustomer(CustomerDTO CustomerDto) {
		Customer customer = new Customer(CustomerDto);

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "DELETE FROM customer WHERE id=?";

			try {
				this.pstmt = conn.prepareStatement(str);

				
				this.pstmt.setInt(1, customer.getId());

				this.pstmt.execute();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt);
			}
		}
	}

}
