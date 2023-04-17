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
	private String code;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.keyword = request.getParameter("keyword");
		this.code = request.getParameter("code");
		
		if(this.keyword == null && this.code == null)
			return;
		
		List<Product> list = this.keyword != null ?
							getSearchProduct() : getProductListByCategory();
		
		request.setAttribute("searchProduct", list);
		request.getRequestDispatcher("productlist").forward(request, response);
	}
	
	private List<Product> getSearchProduct() {
		ProductDAO productDao = ProductDAO.getInstance();
		List<Product> productList = productDao.getProductList();
		
		return productList.stream()
						  .filter(product -> product.getName().contains(this.keyword))
						  .collect(Collectors.toList());
	}
	
	private List<Product> getProductListByCategory(){
		int categoryId = Integer.parseInt(this.code);
		ProductDAO dao = ProductDAO.getInstance();
		return dao.getProductsByCategory(categoryId);
	}

}
