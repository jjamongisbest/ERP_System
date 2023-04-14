package product;

public class Product {
	private int id;
	private String name;
	private String memo;
	private String handleDate;
	private String stock;
	private String pipeLine;
	private String price;
	private int categoryId;
	
	public Product(int id, String name, String memo, String handleDate, String stock, String pipeLine, String price,
			int categoryId) {
		this.id = id;
		this.name = name;
		this.memo = memo;
		this.handleDate = handleDate;
		this.stock = stock;
		this.pipeLine = pipeLine;
		this.price = price;
		this.categoryId = categoryId;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getMemo() {
		return memo;
	}

	public String getHandleDate() {
		return handleDate;
	}

	public String getStock() {
		return stock;
	}

	public String getPipeLine() {
		return pipeLine;
	}

	public String getPrice() {
		return price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", memo=" + memo + ", handleDate=" + handleDate + ", stock="
				+ stock + ", pipeLine=" + pipeLine + ", price=" + price + ", categoryId=" + categoryId + "]";
	}
}
