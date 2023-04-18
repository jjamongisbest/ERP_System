package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.CustomerDTO;
import customer.controller.CustomerDAO;

public class RegistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		int gradeId = Integer.parseInt(request.getParameter("gradeId"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		
		
		CustomerDTO CustomerDto = new CustomerDTO(id, gradeId, name, address, phone, gender, password);
		
		CustomerDAO customerDao = CustomerDAO.getinstnace();
		
		customerDao.createCustomer(CustomerDto);
		response.sendRedirect("/");
		
	}

}
