package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClearCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 주문을 하고
		
		
		
		// 카트비우기
															
		RequestDispatcher dispatcher = request.getRequestDispatcher("?content=cartlist");
		dispatcher.forward(request, response);
	}

}
