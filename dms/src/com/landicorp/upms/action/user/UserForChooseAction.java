package com.landicorp.upms.action.user;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Role;
import com.landicorp.upms.action.basicdata.SelectForChooseAction;

public class UserForChooseAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	private Role role;
	private String areaMark;
	private Integer chooseType;
	private String notChooseIds;

	public String userForChooseFrame() {
		areaMark = getLoginUser().getBelongArea().getAreaMark();
		return INPUT;
	}

	public String areaForChooseUserTree() {
		return "areaForChooseUserTree";
	}

	public String search() {
		if (chooseType != null
				&& chooseType.intValue() == SelectForChooseAction.CHOOSE_MULTI) {
			return "userMultiChooseSearch";
		} else {
			return "userSingleChooseSearch";
		}
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getAreaMark() {
		return areaMark;
	}

	public void setAreaMark(String areaMark) {
		this.areaMark = areaMark;
	}

	public Integer getChooseType() {
		return chooseType;
	}

	public void setChooseType(Integer chooseType) {
		this.chooseType = chooseType;
	}

	public String getNotChooseIds() {
		return notChooseIds;
	}

	public void setNotChooseIds(String notChooseIds) {
		this.notChooseIds = notChooseIds;
	}

}
