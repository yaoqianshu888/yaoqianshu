package com.landicorp.upms.action.user;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.code.kaptcha.Constants;
import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.User;
import com.landicorp.core.helper.CoreValue;
import com.landicorp.core.util.StringUtil;

public class UserLoginAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String isSendToOtherServer;
	private String sessionId;
	private User user;
	private String actionName;
	private String nameSpace;
	private String method;
	private String code;

	// chain跳转到coreLogin进行登录校验
	@SuppressWarnings("unused")
	public String login() throws Exception {
		String sessionCode = (String) getSession().get(Constants.KAPTCHA_SESSION_KEY);
//		if (StringUtil.isEmpty(sessionCode)) {
//			setError("验证码错误");
//			return INPUT;
//		}
		if (CoreValue.debugMode == true) {
			if ("0000".equals(code)) {
				return "coreLogin";
			}
		}
//		if (sessionCode != null && !sessionCode.equalsIgnoreCase(code)) {
//			setError("验证码错误,请重新输入");
//			return INPUT;
//		}
		getSession().remove(Constants.KAPTCHA_SESSION_KEY);
		if (StringUtil.isEmpty(nameSpace)) {
			return SUCCESS;
		}
		return "coreLogin";
	}

	// coreLogin登录校验后的处理
	public String execute() throws Exception {
		if (!StringUtil.isEmpty(getError())) { // 登录失败
			return INPUT;
		}
		// 登录成功
		return SUCCESS;
	}

	// chain跳转到coreLogout进行退出处理
	public String logout() {
		return "coreLogout";
	}

	// 退出后的界面控制
	public String logoutControl() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session != null) {
			session.invalidate();
		}
		return INPUT;
	}


	public String getIsSendToOtherServer() {
		return isSendToOtherServer;
	}

	public String getSessionId() {
		return sessionId;
	}

	public User getUser() {
		return user;
	}

	public void setIsSendToOtherServer(String isSendToOtherServer) {
		this.isSendToOtherServer = isSendToOtherServer;
	}


	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNameSpace() {
		return nameSpace;
	}

	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
