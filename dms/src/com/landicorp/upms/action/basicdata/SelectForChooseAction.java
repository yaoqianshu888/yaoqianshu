package com.landicorp.upms.action.basicdata;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.util.StringUtil;

public class SelectForChooseAction extends BaseActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1413802914359616772L;
	public static final int CHOOSE_SINGLE = 1;
	public static final int CHOOSE_MULTI = 2;
	
	private static final String URL_SUBSTITUTION = "$"; 

	private String selectAction;

	@Override
	public String execute() throws Exception {
		if (StringUtil.isEmpty(selectAction)) {
			addError("请传入选择页面的url");
		}else{
			selectAction = selectAction.replace(URL_SUBSTITUTION, "&");
		}
		return SUCCESS;
	}

	public String chooseContainer() {
		return "chooseContainer";
	}

	public String getSelectAction() {
		return selectAction;
	}

	public void setSelectAction(String selectAction) {
		this.selectAction = selectAction;
	}

}
