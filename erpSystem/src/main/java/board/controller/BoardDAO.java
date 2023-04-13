package board.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

import board.Board;
import board.BoardDTO;
import util.DBManager;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	// C

	public void createBoard(BoardDTO dto) {
		Board board = new Board(dto);

		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String sql = "INSERT INTO board VALUES (?,?,?,?,?,?,?)";

			try {

				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, board.getId());
				this.pstmt.setString(2, board.getTitle());
				this.pstmt.setString(3, board.getMain());
				this.pstmt.setString(4, board.getModifiedDate());
				this.pstmt.setString(5, board.getReigisteredDate());
				this.pstmt.setInt(6, board.getWriter());
				this.pstmt.setInt(7, board.getCategoryId());

				this.pstmt.execute();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// R

	public Board getBoardById(int id) {
		Board board = null;
		this.conn = DBManager.getConnection();
		if (this.conn != null) {
			String sql = "SELECT * FROM board WHERE board_id = ?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, id);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String title = this.rs.getString(2);
					String main = this.rs.getString(3);
					String modiDate = this.rs.getString(4);
					String regiDate = this.rs.getString(5);
					int writer = this.rs.getInt(6);
					int category = this.rs.getInt(7);

					board = new Board(id, title, main, modiDate, regiDate, writer, category);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt, this.rs);
			}
		}

		return board;
	}

	// U
	public void updateBoard(BoardDTO dto) {
		Board board = new Board(dto);
		this.conn = DBManager.getConnection();
		
		if (this.conn != null) {
			String sql = "UPDATE board SET board_title =?, board_main=?, board_modified_date=?, board_category_id=? WHERE board_id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				
				this.pstmt.setString(1, dto.getTitle());
				this.pstmt.setString(2, dto.getMain());
				this.pstmt.setString(3, dto.getModifiedDate());
				this.pstmt.setInt(4, dto.getCategoryId());
				this.pstmt.setInt(5, board.getId());
				
				this.pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt, this.rs);
			}
		}
	}
	
	// D
	public void deleteBoard(BoardDTO dto) {
		this.conn = DBManager.getConnection();
		if(this.conn != null) {
			String sql = "DELETE FROM board WHERE board_id =?";
			
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				
				this.pstmt.setInt(1, dto.getId());
				
				this.pstmt.execute();		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.closeConnection(this.conn, this.pstmt, this.rs);
			}
		}
		
	}
	

}
