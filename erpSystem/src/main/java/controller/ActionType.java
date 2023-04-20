package controller;

import controller.action.Action;
import controller.action.BoardAction;
import controller.action.BoardDeleteAction;
import controller.action.BoardModifyAction;
import controller.action.CartAction;
import controller.action.DropCustomerAction;
import controller.action.DropItemAction;
import controller.action.GetBoardListAction;
import controller.action.GetMonthlySalesTotal;
import controller.action.GetMypageAction;
import controller.action.GetSalesTotal;
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
	
	PRODUCT("productlist", new ProductAction()),
	BOARD  ("board",  	   new BoardAction()),
	ORDER  ("order",   	   new OrderAction()),
	
	BOARD_MODIFY("boardModify",     new BoardModifyAction()),
	BOARD_DELETE("boardDelete",     new BoardDeleteAction()),
	
	DROP_CUSTOMER("dropCustomer",   new DropCustomerAction()),
	DROP_ITEM("dropitem", 			new DropItemAction()),
	
	PRODUCT_DETAIL("productdetail", 	  new ProductDetailAction()),
	ORDER_CONF("orderconfirmation", 	  new OrderConfirmAction()),
	SALES_TOTAL("salesTotal", 			  new GetSalesTotal()),
	
	GET_MONTH_SALES_TOTAL("monthlyTotal", new GetMonthlySalesTotal()),
	GET_BOARD_LIST("boardlist",			  new GetBoardListAction()),
	GET_MYPAGE("getmypage", 			  new GetMypageAction())

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


