package controller;

import controller.action.Action;
<<<<<<< HEAD
import controller.action.DropCustomerAction;
import controller.action.LogoutAction;
import controller.action.RegistAction;
=======
>>>>>>> refs/remotes/origin/main
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.ProductAction;
import controller.action.RegistAction;


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
<<<<<<< HEAD
		else if(command.equals("regist")) 
=======
		else if(command.equals("regist"))
>>>>>>> refs/remotes/origin/main
			action = new RegistAction();
<<<<<<< HEAD
		else if(command.equals("dropCustomer")) 
			action = new DropCustomerAction();
=======
		else if(command.equals("product"))
			action = new ProductAction();
>>>>>>> refs/remotes/origin/main
		

		return action;
	}
}
