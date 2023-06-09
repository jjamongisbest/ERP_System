package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetBoardWrite implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		request.setAttribute("categoryId", categoryId);
		
		request.getRequestDispatcher("?content=boardwrite").forward(request, response);
	}

}
