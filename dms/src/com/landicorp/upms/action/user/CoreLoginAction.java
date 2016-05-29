package com.landicorp.upms.action.user;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.User;
import com.landicorp.core.entities.webservice.Request;
import com.landicorp.core.entities.webservice.RequestParam;
import com.landicorp.core.entities.webservice.Response;
import com.landicorp.core.entities.webservice.UserLogin;
import com.landicorp.core.exception.ParamException;
import com.landicorp.core.helper.CoreValue;
import com.landicorp.core.util.BaseDataFormatUtil;
import com.landicorp.core.util.HttpUtil;
import com.landicorp.core.util.SessionUtil;
import com.landicorp.core.util.StringUtil;
import com.landicorp.core.util.UserLoginFormatUtil;
import com.landicorp.core.util.WebserviceUtil;
import com.landicorp.core.web.session.SessionListener;
import com.landicorp.core.webservice.base.UserLoginInfo;

public class CoreLoginAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String USER_LOGIN_ADDRESS = "webservice/coreWebserviceHandler.action";
	private String isSendToOtherServer;
	private String sessionId;
	private String actionName;
	private String nameSpace;
	private String method;
	private User user;

	public String execute() {
		try {
			RequestParam requestParam = new RequestParam();
			requestParam.setRequestCode("1001");
			
			UserLogin bean = new UserLogin();
			bean.setIsSendToOtherServer(isSendToOtherServer);
			bean.setUser(user);
			String result = getWebserviceResult(requestParam, bean);
			
			if (!StringUtil.isEmpty(result)) {
				addError("登陆失败!用户名或密码错误!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(e instanceof ParamException){
				addError(e.getMessage());
			}else{
				addError("系统异常，请与管理员联系!");
			}
		}
		return SUCCESS;
	}
	
	private String getWebserviceResult(RequestParam requestParam, UserLogin userLogin) {
		Request<UserLogin> request = new Request<UserLogin>();

		request.setRequestParam(requestParam);
		request.setData(userLogin);
		
		BaseDataFormatUtil<UserLogin> dataFormatUtil = UserLoginFormatUtil.getInstance();
		Document doc = WebserviceUtil.formatRequest(request, dataFormatUtil);
		// 发送webservice请求
		try {
			String rootPath = "http://" + getRequest().getServerName()+ ":"+ getRequest().getServerPort()
								+ getRequest().getContextPath() + "/";
			String responseXml = HttpUtil.getResult(rootPath + USER_LOGIN_ADDRESS, "UTF-8", doc.asXML().getBytes());
			
			Response<UserLogin> response = WebserviceUtil.formatXmlToResponse(responseXml, dataFormatUtil);
			
			UserLoginInfo info = new UserLoginInfo();
			info.user = response.getData().getUser();
			info.markRight = response.getData().getMarkRight();
			info.urlRight = response.getData().getUrlRight();
			
			String key = UUID.randomUUID().toString();
			Cookie ck = new Cookie(CoreValue.FLAG_USER_COOKIE, key);
			ck.setPath(getRequest().getContextPath());
			getSession().put(CoreValue.FLAG_USER_COOKIE, key);
			getResponse().addCookie(ck);
			systemCache.add(key, UserLoginInfo.serialize(info));
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		return "";
	}

	public void loginControlOtherServer() {
		if (user.getId() != null) {
			//user = userService.getById(user.getId());
		}
		HttpSession session = getSession(sessionId);
		if (session != null) {
			SessionListener.userAliasLoginCheck(session, user);
		}
	}

	// pos端单一登录同步控制
	public void posLoginControlOtherServer() {
		if (user.getId() != null) {
			//user = userService.getById(user.getId());
		}
		HttpSession session = getSession(sessionId);
		if (session != null) {
			SessionListener.userAliasLoginCheck(session, user);
		}
	}

	public String logout() throws Exception {
		User user = getLoginUser();
		String key = (String) getSession().get(CoreValue.FLAG_USER_COOKIE);
		systemCache.delete(key);
		SessionUtil.clearAttributes(getRequest().getSession());
		getRequest().getSession().removeAttribute(CoreValue.FLAG_USER_COOKIE);
		getResponse().reset();
		if (user != null) {
			getLogger().info("User:" + (user).getUserAlias() + " is logout.");
		} else {
			getLogger().info("Logout with nobody.");
		}
		return "logout";
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
	
}
