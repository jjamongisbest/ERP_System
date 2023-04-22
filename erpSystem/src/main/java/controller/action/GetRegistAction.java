package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Param;

import customer.Customer;
import customer.controller.CustomerDAO;
import customerGrade.CustomerGrade;
import customerGrade.controller.CustomerGradeDAO;

public class GetRegistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("log");
		if(customer == null) {
			CustomerDAO customerDao = CustomerDAO.getInstance();
			int id = customerDao.getCustomerId();
			
			CustomerGradeDAO customerGradeDao = CustomerGradeDAO.getinstance();
			CustomerGrade customerGrade = customerGradeDao.getCustomerGradeById(1);
			int gradeId = customerGrade.getGradeId();
		
			System.out.println("겟");
			
			request.setAttribute("id", id);
			request.setAttribute("gradeId", gradeId);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("?content=regist");		
			dispatcher.forward(request, response);
		}else {
			int id = customer.getId();
			String password = customer.getPassword();
			String name = customer.getName();
			String address = customer.getAddress();
			String phone = customer.getPhone();
			String url = "&password="+password;
			RequestDispatcher dispatcher = request.getRequestDispatcher("?content=regist&id="+id+url);		
			dispatcher.forward(request, response);
		}
		
		
		
		
	}

}
