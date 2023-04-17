package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderProduct.OrderProductDTO;
import orderProduct.controller.OrderProductDAO;
import product.Product;
import product.contoroller.ProductDAO;
import salesOrder.SalesOrder;
import salesOrder.SalesOrderDTO;
import salesOrder.controller.SalesOrderDAO;

public class OrderAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = request.getServletContext();
		SalesOrder order = (SalesOrder) application.getAttribute("basket");
		
		ProductDAO productDao = ProductDAO.getInstance();
		SalesOrderDAO orderDao = SalesOrderDAO.getInstance();
		OrderProductDAO orderProductDao = OrderProductDAO.getInstance();
		
		HashMap<Integer, Integer> basket = order.getBasket();
		ArrayList<Product> list = new ArrayList<>(basket.size());
		
		OrderProductDTO orderProductDto = null;
		for(Integer id : basket.keySet()) {
			Product product = productDao.getProductById(id);
			list.add(product);
			
			orderProductDto = new OrderProductDTO();
			orderProductDto.setProductId(product.getId());
			orderProductDto.setOrderId(order.getId());
			orderProductDto.setOrderProduct(product.getName());
			orderProductDto.setQuantity(basket.get(id));
			
			orderProductDao.createOrderProduct(orderProductDto);
		}
		
		// 주문 저장
		SalesOrderDTO orderDto = new SalesOrderDTO(order);
		orderDto.setTotal(order.getTotalPrice(list));
		
		orderDto.setStatus("Y");
		orderDao.createSalesOrder(orderDto);
		
		basket = new HashMap<Integer, Integer>();
		request.getRequestDispatcher("/").forward(request, response);
		response.sendRedirect("/");
	}
}
