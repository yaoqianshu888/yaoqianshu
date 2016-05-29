package com.landicorp.upms.action.area; 

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.upms.action.basicdata.SelectForChooseAction;

public class AreaForChooseAction extends BaseActionSupport { 
    private static final long serialVersionUID = 1L; 
	private Integer chooseType;
	private String notChooseIds;
	private Integer superAreaId; 
  
	public String areaForChooseFrame() {
		return "areaForChooseFrame";
	}
	
	public String areaForChooseTree() {
		return "areaForChooseTree";
	}

	public String search() {
		if (chooseType!=null&&chooseType.intValue() == SelectForChooseAction.CHOOSE_MULTI) {
			return "areaMultiChooseSearch";
		} else {
			return "areaSingleChooseSearch";
		}
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

	public Integer getSuperAreaId() {
		return superAreaId;
	}

	public void setSuperAreaId(Integer superAreaId) {
		this.superAreaId = superAreaId;
	}

}

