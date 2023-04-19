package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;

//../Service

public class Service extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Service() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		ActionFactory factory = ActionFactory.getInstance();
		Action action = factory.getAction(command);
		
		request.setAttribute("content", command);
		
		if(action != null) {
			action.execute(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}