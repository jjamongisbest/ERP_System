package controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.Customer;
import sales_order.SalesOrderDTO;
import sales_order.controller.SalesOrderDAO;

public class OrderAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();

		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();

		Customer customer = (Customer) session.getAttribute("log");
		LocalDate now = LocalDate.now();

		int id = salesOrderDao.getSalesOrderId();
		int customerId = customer.getId();
		String date = String.valueOf(now);
		// int total = application에 있는 addPrice
		String total = "1";
		String status = null;

		boolean isRun = order();
		if (isRun) {
			status = "Y";
			
			application.removeAttribute("basket");
			request.setAttribute("message", "결제 성공하였습니다");
		} else {
			status = "N";
			
			request.setAttribute("message", "잔액이 부족합니다");
		}

		SalesOrderDTO salesOrderDto = new SalesOrderDTO(id, customerId, date, total, status);

		salesOrderDao.createSalesOrder(salesOrderDto);

	}

	private boolean order() {
		boolean isRun = true;

		Random random = new Random();

		int temp = random.nextInt(5);

		if (temp == 0) {
			isRun = false;
		}

		return isRun;
	}

}
