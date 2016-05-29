package com.landicorp.upms.action.checkstandversion;

import java.text.ParseException;
import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.CheckstandVersion;

public class CheckstandVersionSearchAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CheckstandVersion checkstandVersion;
	private List<CheckstandVersion> checkstanVersionList;

	public String query() throws ParseException {
		return SUCCESS;
	}

	public String detail() {
		return "detail";
	}

	public List<CheckstandVersion> getCheckstanVersionList() {
		return checkstanVersionList;
	}

	public void setCheckstanVersionList(List<CheckstandVersion> checkstanVersionList) {
		this.checkstanVersionList = checkstanVersionList;
	}

	public CheckstandVersion getCheckstandVersion() {
		return checkstandVersion;
	}

	public void setCheckstandVersion(CheckstandVersion checkstandVersion) {
		this.checkstandVersion = checkstandVersion;
	}

}
