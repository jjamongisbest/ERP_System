package customer.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	public Customer readCustomerByid(int customerId) {
		Customer customer = null;
		
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "SELECT * FROM customer WHERE customer_id=?";

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
	public ArrayList<Customer> readCustomer() {
		ArrayList<Customer> list = new ArrayList<Customer>();
		
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "SELECT * FROM customer";

			try {
				this.pstmt = conn.prepareStatement(str);
				
			
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					int id = this.rs.getInt(1);
					int gradeId = this.rs.getInt(2);
					String name = this.rs.getString(3);
					String address = this.rs.getString(4);
					String phone = this.rs.getString(5);
					String gender = this.rs.getString(6);
								
					list.add(new Customer(id, gradeId, name, address, phone, gender));
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt, rs);
			}
		}
		
		return list;
	}
	

	// U
	public void updateCustomer(CustomerDTO CustomerDto) {
		Customer customer = new Customer(CustomerDto);

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String str = "UPDATE customer SET customer_grade_id=?, customer_name=?,customer_address=?,customer_phone=?,customer_gender=? WHERE customer_id=?";

			try {
				this.pstmt = conn.prepareStatement(str);

				this.pstmt.setInt(1, customer.getGradeId());
				this.pstmt.setString(2, customer.getName());
				this.pstmt.setString(3, customer.getAddress());
				this.pstmt.setString(4, customer.getPhone());
				this.pstmt.setString(5, customer.getGender());
				this.pstmt.setInt(6, customer.getId());

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
			String str = "DELETE FROM customer WHERE customer_id=?";

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