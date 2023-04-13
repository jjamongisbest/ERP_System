package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.Customer;
import customer.controller.CustomerDAO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");

		System.out.println("ID : " + id);
		
		CustomerDAO dao = CustomerDAO.getinstnace();
		Customer cus = dao.readCustomerByid(id);
	
	}

}
