package controller;

import controller.action.Action;
import controller.action.BasketAction;
import controller.action.BoardAction;
import controller.action.BoardDeleteAction;
import controller.action.BoardModifyAction;
import controller.action.DropCustomerAction;
import controller.action.DropItemAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.OrderAction;
import controller.action.OrderConfirmAction;
import controller.action.ProductAction;
import controller.action.ProductDetailAction;
import controller.action.RegistAction;

public class ActionFactory {
	private static final ActionFactory instance = new ActionFactory();

	private ActionFactory() {
	}

	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		return ActionType.getAction(command);
	}
	
}
