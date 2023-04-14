package salesOrder;

public class SalesOrder{

	private int id;
	private int customerId;
	private String date;
	private String total;
	private String status;
	
	public SalesOrder(int id, int custId, String date, String total, String status) {
		this.id = id;
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


}
