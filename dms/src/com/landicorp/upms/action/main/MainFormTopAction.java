package com.landicorp.upms.action.main;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.webservice.base.UserLoginInfo;

public class MainFormTopAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;

	public String execute() {
		UserLoginInfo loginInfo = getLoginInfo();
		userName = loginInfo.user.getUserName();
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
