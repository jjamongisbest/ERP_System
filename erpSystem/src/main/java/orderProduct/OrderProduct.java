package orderProduct;

public class OrderProduct {
	private int detailsId;
	private int productId;
	private int orderId;
	private String orderProduct;
	private String quantity;
	
	public OrderProduct(int detailsId, int productId, int orderId, String orderProduct, String quantity) {
		this.detailsId = detailsId;
		this.productId = productId;
		this.orderId = orderId;
		this.orderProduct = orderProduct;
		this.quantity = quantity;
	}

	public int getDetailsId() {
		return detailsId;
	}

	public int getProductId() {
		return productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public String getOrderProduct() {
		return orderProduct;
	}

	public String getQuantity() {
		return quantity;
	}
	
	
	
}
