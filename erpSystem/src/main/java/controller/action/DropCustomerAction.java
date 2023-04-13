package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.Customer;
import customer.controller.CustomerDAO;

public class DropCustomerAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		CustomerDAO customerDao = CustomerDAO.getinstnace();
		HttpSession session = request.getSession();


		response.sendRedirect("index.jsp");
		
	}

}
