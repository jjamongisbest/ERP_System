package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardCategory.BoardCategory;
import boardCategory.controller.BoardCategoryDAO;
import productCategory.ProductCategory;
import productCategory.controller.ProductCategoryDAO;

public class GetMainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String init = "1";
		ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
		ArrayList<ProductCategory> catelist = dao.getProductCategoryList();
		

		BoardCategoryDAO boardcateDao = BoardCategoryDAO.getInstance();
		ArrayList<BoardCategory> list = boardcateDao.getBoardCategoryAll();
		
		session.setAttribute("catelist", catelist);
		session.setAttribute("list", list);
		session.setAttribute("init", init);
		request.removeAttribute("content");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("main");		
		dispatcher.forward(request, response);
	}

}
