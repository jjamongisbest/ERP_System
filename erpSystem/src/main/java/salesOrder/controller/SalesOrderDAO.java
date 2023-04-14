package salesOrder.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import salesOrder.SalesOrder;
import salesOrder.SalesOrderDTO;
import util.DBManager;

public class SalesOrderDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SalesOrderDAO() {
	}

	private static SalesOrderDAO instance = new SalesOrderDAO();

	public static SalesOrderDAO getInstance() {
		return instance;
	}

	// C
	public void createSalesOrder(SalesOrderDTO dto) {
		SalesOrder order = new SalesOrder(dto);

		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String sql = "INSERT INTO sales_order VALUES(?,?,?,?,?)";

			try {
				this.pstmt = this.conn.prepareStatement(sql);

				this.pstmt.setInt(1, order.getId());
				this.pstmt.setInt(2, order.getCustomerId());
				this.pstmt.setString(3, order.getDate());
				this.pstmt.setString(5, order.getTotal());
				this.pstmt.setString(6, order.getStatus());
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt);				
			}
		}
	}
	
	public int getSalesOrderId() {
		int salesOrderId = -1;
		
		this.conn=DBManager.getConnection();
		if(this.conn != null) {
			String str = "SELECT MAX(customer_id) FROM sales_order";
			
			try {
				this.pstmt = this.conn.prepareStatement(str);
				this.rs = this.pstmt.executeQuery();
				
				while(this.rs.next()) {
					salesOrderId = this.rs.getInt(1);					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(conn, pstmt, rs);
			}	
		}
		return salesOrderId + 1;
	}

	// R
	public SalesOrder getSalesOrderById(int id) {
		SalesOrder order = null;
		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String sql = "SELECT * FROM sales_order WHERE order_id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, id);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					int custId = this.rs.getInt(2);
					String date = this.rs.getString(3);
					String total = this.rs.getString(4);
					String status = this.rs.getString(5);

					order = new SalesOrder(id, custId, date, total, status);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt, this.rs);
			}
		}
		return order;
	}
	
	public ArrayList<SalesOrder> getSalesOrderByCustomerID(int custId) {
		ArrayList<SalesOrder> list = new ArrayList<SalesOrder>();
		
		this.conn = DBManager.getConnection();
		
		if (this.conn != null) {
			String sql = "SELECT * FROM sales_order WHERE customer_id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, custId);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					int orderId = this.rs.getInt(1);
					String date = this.rs.getString(3);
					String total = this.rs.getString(4);
					String status = this.rs.getString(5);

					SalesOrder order = new SalesOrder(orderId, custId, date, total, status);
					list.add(order);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt, this.rs);
			}
		}
		return list;
	}

}
