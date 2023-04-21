package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.controller.CartDAO;

public class DeleteCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("product"));
		int custId = Integer.parseInt(request.getParameter("cust"));
		
		CartDAO dao = CartDAO.getInstance();
		
		dao.deleteCartByProductId(productId);
		int total = dao.getTotalPriceByCustomerId(custId);
		
		request.setAttribute("total", total);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("?content=cartlist");		
		dispatcher.forward(request, response);
	}

}
