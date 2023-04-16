package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.BoardDAO;

public class BoardDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO boardDao = BoardDAO.getInstance();
		
		int id = Integer.valueOf(request.getParameter("id"));
		int categoryId = Integer.valueOf(request.getParameter("categoryId"));
		
		boardDao.deleteBoard(id);
		
		if (categoryId == 11)
			response.sendRedirect("announce");
		else if (categoryId == 12)
			response.sendRedirect("inquiry");
		else if (categoryId == 13)
			response.sendRedirect("review");
		
	}

}
