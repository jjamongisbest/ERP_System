package product;

public class ProductDTO {
	private int id;
	private String name;
	private String memo;
	private String handleDate;
	private String stock;
	private String pipeLine;
	private String price;
	private int categoryId;
	
	public ProductDTO(int id, String name, String memo, String handleDate, String stock, String pipeLine, String price,
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
	
	public ProductDTO(Product product) {
		this.id = product.getId();
		this.name = product.getName();
		this.memo = product.getMemo();
		this.handleDate = product.getHandleDate();
		this.stock = product.getStock();
		this.pipeLine = product.getPipeLine();
		this.price = product.getPrice();
		this.categoryId = product.getCategoryId();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getHandleDate() {
		return handleDate;
	}

	public void setHandleDate(String handleDate) {
		this.handleDate = handleDate;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getPipeLine() {
		return pipeLine;
	}

	public void setPipeLine(String pipeLine) {
		this.pipeLine = pipeLine;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
