package salesOrder;

public class SalesOrderDTO {

	private int id;
	private int customerId;
	private String date;
	private String total;
	private String status;
	
	public SalesOrderDTO(int id, int custId, String date, String total, String status) {
		this.id = id;
		this.customerId = custId;
		this.date = date;
		this.total = total;
		this.status = status;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	
	
}
