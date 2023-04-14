package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.Customer;
import customer.CustomerDTO;
import customer.controller.CustomerDAO;

public class DropCustomerAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id = 0;
		String password = "";

		try {
			id = Integer.parseInt(request.getParameter("id"));
			password = request.getParameter("password");
		} catch (NumberFormatException e) {
			request.setAttribute("message", "ID는 숫자로 입력해주세요.");
			request.getRequestDispatcher("dropCustomer").forward(request, response);
			return;
		}
		
		CustomerDAO customerDao = CustomerDAO.getinstnace();
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("log");
		
		if(customer != null && password.equals(customer.getPassword())) {
			int gradeId = customer.getGradeId();
			String name = customer.getName();
			String address = customer.getAddress();
			String phone = customer.getPhone();
			String gender = customer.getGender();
			
			CustomerDTO customerDto = new CustomerDTO(id, gradeId, name, address, phone, gender, password);
			customerDao.deleteCustomer(customerDto);
			response.sendRedirect("index.jsp");
		}
		else {
			request.setAttribute("message", "회원 정보가 올바르지 않습니다.");
	        request.getRequestDispatcher("dropCustomer").forward(request, response);
		}
	}
}
