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
		String salesOrderStatus = request.getParameter("salesOrderStatus");
		
		
		SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();
		

		
		if(salesOrderStatus.equals("N")) {
			salesOrderStatus = "Y";
		}
		else if (salesOrderStatus.equals("Y")) {
			salesOrderStatus = "D";
		}
	
		
		salesOrderDao.updateOrderSatatus(salesOrderId, salesOrderStatus);
		
		response.sendRedirect("orderconfirmation");
	}

}
