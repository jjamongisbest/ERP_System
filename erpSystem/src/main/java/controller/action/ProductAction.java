package controller.action;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.contoroller.ProductDAO;

public class ProductAction implements Action{
	
	private String keyword;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.keyword = request.getParameter("keyword");
		
		if(this.keyword == null)
			return;
		
		request.setAttribute("searchProduct", getSearchProduct());
		request.getRequestDispatcher("/").forward(request, response);
	}
	
	private List<Product> getSearchProduct() {
		ProductDAO productDao = ProductDAO.getInstance();
		List<Product> productList = productDao.getProductList();
		
		return productList.stream()
						  .filter(product -> product.getName().contains(this.keyword))
						  .collect(Collectors.toList());
	}

}
