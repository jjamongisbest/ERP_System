package controller;

import controller.action.Action;
import controller.action.BasketAction;
import controller.action.BoardAction;
import controller.action.BoardDeleteAction;
import controller.action.BoardModifyAction;
import controller.action.CustomerLogAction;
import controller.action.DropCustomerAction;
import controller.action.GetSalesTotal;
import controller.action.DropItemAction;
import controller.action.GetMonthlySalesTotal;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.OrderConfirmAction;
import controller.action.ProductAction;
import controller.action.ProductDetailAction;
import controller.action.RegistAction;

public enum ActionType {
	
	LOG_IN ("login",   new LoginAction()),
	LOG_OUT("logout",  new LogoutAction()),
	REGIST ("regist",  new RegistAction()),
	BASKET ("basket",  new BasketAction()),
	PRODUCT("product", new ProductAction()),
	BOARD  ("board",   new BoardAction()),
	CUSTOMER_LOG("customerlog",		new CustomerLogAction()),
	PRODUCT_DETAIL("productDetail", new ProductDetailAction()),
	ORDER_CONF("orderConfirmation", new OrderConfirmAction()),
	GET_SALES_TOTAL("salesTotal" , new GetSalesTotal()),
	GET_MONTH_SALES_TOTAL("monthlyTotal", new GetMonthlySalesTotal())
	;
	
	private String command;
	private Action action;
	
	ActionType(String command, Action action){
		this.command = command;
		this.action = action;
	}
	
	public static Action getAction(String command) {
		for(ActionType type : values()) {
			if(type.command.equals(command))
				return type.action;
		}
		return null;  
	}
}
