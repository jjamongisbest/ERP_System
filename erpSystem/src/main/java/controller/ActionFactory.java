package controller;

import controller.action.Action;
import controller.action.LogoutAction;

public class ActionFactory {
	private static final ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("logout"))
			action = new LogoutAction();
		
		
		return action;
	}
}
