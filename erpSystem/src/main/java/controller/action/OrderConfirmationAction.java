package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import salesOrder.SalesOrder;
import salesOrder.controller.SalesOrderDAO;

public class OrderConfirmationAction implements Action {

	private int keyword;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.keyword = Integer.valueOf(request.getParameter("keyword"));

		if (this.keyword == 0)
			return;

		request.setAttribute("searchOrder", getSearchOrder());
		request.getRequestDispatcher("/orderConfirmation").forward(request, response);

	}

	private List<SalesOrder> getSearchOrder() {
		SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();
		List<SalesOrder> salesOrderList = salesOrderDao.getSalesOrderByCustomerID(keyword);

		
		
		return salesOrderList;
		

	}
}
