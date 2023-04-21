package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.CustomerDAO;
import customerGrade.CustomerGrade;
import customerGrade.controller.CustomerGradeDAO;

public class GetRegistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CustomerDAO customerDao = CustomerDAO.getInstance();
		int id = customerDao.getCustomerId();
		
		CustomerGradeDAO customerGradeDao = CustomerGradeDAO.getinstance();
		CustomerGrade customerGrade = customerGradeDao.getCustomerGradeById(1);
		int gradeId = customerGrade.getGradeId();
	
		request.setAttribute("id", id);
		request.setAttribute("gradeId", gradeId);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("?content=regist");		
		dispatcher.forward(request, response);
	}

}
