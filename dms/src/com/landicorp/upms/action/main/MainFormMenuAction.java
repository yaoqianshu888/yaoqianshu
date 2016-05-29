package com.landicorp.upms.action.main;

import java.util.Map;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Right;
import com.landicorp.core.webservice.base.UserLoginInfo;

public class MainFormMenuAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<Integer, Right> sessionMenu;

	public String execute() {
		UserLoginInfo loginInfo = getLoginInfo();
		if (loginInfo == null) {
			return ERROR;
		}
		return SUCCESS;
	}

	public Map<Integer, Right> getSessionMenu() {
		return sessionMenu;
	}

	public void setSessionMenu(Map<Integer, Right> sessionMenu) {
		this.sessionMenu = sessionMenu;
	}

}
