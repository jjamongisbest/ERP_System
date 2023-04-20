package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.Customer;
import customer.controller.CustomerDAO;

public class DropCustomerAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("log");
		
		String password = request.getParameter("password");
		
		if(customer != null && customer.getPassword().equals(password)) {			
			deleteCustomer(customer);
			session.removeAttribute("log");
			response.sendRedirect("/");
		}
		else {
			request.setAttribute("message", "회원 정보가 올바르지 않습니다.");
	        request.getRequestDispatcher("/").forward(request, response);
		}
	}
	
	private void deleteCustomer(Customer customer) {
		CustomerDAO customerDao = CustomerDAO.getInstance();
		customerDao.deleteCustomerToAll(customer.getId());
	}
}
