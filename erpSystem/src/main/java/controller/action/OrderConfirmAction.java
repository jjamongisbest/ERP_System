package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import salesOrder.controller.SalesOrderDAO;

public class OrderConfirmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int salesOrderId = Integer.parseInt(request.getParameter("salesOrderId"));
		
		System.out.println(salesOrderId);
		
		SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();
		
		salesOrderDao.update(salesOrderId);
		
		response.sendRedirect("index.jsp");
	}

}
