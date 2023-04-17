package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		ArrayList<Product> list = new ArrayList<>(order.getBasket().size());

		for(Integer id : order.getBasket().keySet())
			list.add(productDao.getProductById(id));
		
		// 주문 저장
		SalesOrderDTO orderDto = new SalesOrderDTO(order);
		orderDto.setTotal(order.getTotalPrice(list));
		orderDto.setStatus(tempPayment() ? "Y" : "N");
		orderDao.createSalesOrder(orderDto);
		
		//잠깐 보류
		
	}
	
	//테스트 결제 코드
	private boolean tempPayment() {
		Random random = new Random();
		return random.nextInt(5) != 0 ? true : false;
	}
}
