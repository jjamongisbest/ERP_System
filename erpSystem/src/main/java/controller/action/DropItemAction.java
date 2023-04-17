package controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import salesOrder.SalesOrder;

public class DropItemAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		SalesOrder order = (SalesOrder) application.getAttribute("basket");
		
		if(order == null)
			return;
		
		String tmp = request.getParameter("target");
		int productId = Integer.parseInt(tmp);
		order.getBasket().remove(productId);
	
		response.sendRedirect("order");
	}

}
