package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.controller.CartDAO;
import product.Product;
import product.contoroller.ProductDAO;

public class DeleteCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("product"));
		int custId = Integer.parseInt(request.getParameter("cust"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		CartDAO dao = CartDAO.getInstance();
		ProductDAO pdao = ProductDAO.getInstance();
		Product product = pdao.getProductById(productId);
		
		dao.deleteCartByProductId(productId);
		int total = dao.getTotalPriceByCustomerId(custId);
		
		total -= product.getPrice() * count;
		
		request.setAttribute("total", total);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("?content=cartlist");		
		dispatcher.forward(request, response);
	}

}
