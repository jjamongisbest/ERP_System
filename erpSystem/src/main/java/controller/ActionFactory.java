package controller;

import controller.action.Action;
import controller.action.LogoutAction;
import controller.action.LoginAction;


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
		else if(command.equals("login"))
			action = new LoginAction();

		
		return action;
	}
}
