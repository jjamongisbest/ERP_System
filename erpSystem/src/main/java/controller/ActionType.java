package controller;

import controller.action.Action;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.RegistAction;

public enum ActionType {
	
	LOG_IN ("login",   new LoginAction()),
	LOG_OUT("logout",  new LogoutAction()),
	REGIST ("regist",  new RegistAction())
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
