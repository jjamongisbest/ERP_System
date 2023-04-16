package salesOrder;

import java.util.HashMap;
import java.util.List;

import product.Product;
import util.MoneyManager;

public class SalesOrder{

	private int id;
	private int customerId;
	private String date;
	private String total;
	private String status;
	
	public HashMap<Integer, Integer> basket = new HashMap<>();
	
	public SalesOrder(int id, int custId, String date, String total, String status) {
		this.id = id;
		this.customerId = custId;
		this.date = date;
		this.total = total;
		this.status = status;
	}
	
	public SalesOrder(int custId, String date, String total, String status) {
		this.customerId = custId;
		this.date = date;
		this.total = total;
		this.status = status;
	}
	
	public SalesOrder(SalesOrderDTO dto) {
		this.id = dto.getId();
		this.customerId = dto.getCustomerId();
		this.date = dto.getDate();
		this.total = dto.getTotal();
		this.status = dto.getStatus();
	}

	public int getId() {return id;}
	public int getCustomerId() {return customerId;}
	public String getDate() {return date;}
	public String getTotal() {return total;}
	public String getStatus() {return status;}

	public void insertBasket(int id, int quantity) {
		Integer count = basket.get(id);
		if(count == null)
			count = 0;
		
		basket.put(id, quantity+count);
	}
	
	public HashMap<Integer, Integer> getBasket(){
		return this.basket;
	}
	
	public String getTotalPrice(List<Product> list) {
		if(list == null)
			return null;
		
		for(int i = 0; i < list.size(); i++) {
			Product product = list.get(i);
			int quantity = basket.get(product.getId());
			this.total = MoneyManager.sumMoney(this.total,
						 MoneyManager.multipleMoney(product.getPrice(), quantity));
		}
		return this.total;
	}
	
}
