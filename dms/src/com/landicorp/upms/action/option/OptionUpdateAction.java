package com.landicorp.upms.action.option;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Option;

public class OptionUpdateAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Option option;
	private Integer defaultPageSize;

	public String prepare() {
		return INPUT;
	}

	public int getDefaultPageSize() {
		return defaultPageSize;
	}

	public void setDefaultPageSize(int defaultPageSize) {
		this.defaultPageSize = defaultPageSize;
	}

	public Option getOption() {
		return option;
	}

	public void setOption(Option option) {
		this.option = option;
	}

}
