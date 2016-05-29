package com.landicorp.upms.action.option;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.helper.CoreValue;
import com.landicorp.core.web.option.OptionHelper;

public class OptionManageAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private int defaultPageSize;

	public String prepare() {
		OptionHelper oh = OptionHelper.getInstance();
		oh.removeOptionGroup(CoreValue.OPTION_HELPER_PAGESIZE);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "5", 5);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "10", 10);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "20", 20);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "30", 30);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "40", 40);
		oh.putOption(CoreValue.OPTION_HELPER_PAGESIZE, "50", 50);
		defaultPageSize = CoreValue.defaultPageSize;
		return INPUT;
	}

	public int getDefaultPageSize() {
		return defaultPageSize;
	}

	public void setDefaultPageSize(int defaultPageSize) {
		this.defaultPageSize = defaultPageSize;
	}

}
