package orderProduct;

public class OrderProductDTO {
	private int detailsId;
	private int productId;
	private int orderId;
	private String orderProduct;
	private String quantity;
	
	public OrderProductDTO(int detailsId, int productId, int orderId, String orderProduct, String quantity) {
		this.detailsId = detailsId;
		this.productId = productId;
		this.orderId = orderId;
		this.orderProduct = orderProduct;
		this.quantity = quantity;
	}
	

	public int getDetailsId() {
		return detailsId;
	}

	public void setDetailsId(int detailId) {
		this.detailsId = detailId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(String orderProduct) {
		this.orderProduct = orderProduct;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	
	
}
