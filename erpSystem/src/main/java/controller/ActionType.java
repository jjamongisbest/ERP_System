package controller;

import controller.action.Action;
import controller.action.BoardAction;
import controller.action.BoardDeleteAction;
import controller.action.BoardModifyAction;
import controller.action.CartAction;
import controller.action.DropCustomerAction;
import controller.action.DropItemAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.OrderAction;
import controller.action.OrderConfirmAction;
import controller.action.ProductAction;
import controller.action.ProductDetailAction;
import controller.action.RegistAction;

public enum ActionType {
	
	LOG_IN ("login",   new LoginAction()),
	LOG_OUT("logout",  new LogoutAction()),
	
	REGIST ("regist",  new RegistAction()),
	BASKET ("basket",  new CartAction()),
	
	PRODUCT("product", new ProductAction()),
	BOARD  ("board",   new BoardAction()),
	ORDER  ("order",   new OrderAction()),
	
	BOARD_MODIFY("boardModify",     new BoardModifyAction()),
	BOARD_DELETE("boardDelete",     new BoardDeleteAction()),
	
	DROP_CUSTOMER("dropCustomer",   new DropCustomerAction()),
	DROP_ITEM("dropitem", 			new DropItemAction()),
	
	PRODUCT_DETAIL("productDetail", new ProductDetailAction()),
	ORDER_CONF("orderConfirmation", new OrderConfirmAction())
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
