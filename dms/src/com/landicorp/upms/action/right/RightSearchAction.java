package com.landicorp.upms.action.right;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Right;

public class RightSearchAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Right right;
	private Integer upRightId;
	
	public String searchRightsForRightTree() {
		return "rightTree";
	}

	public String searchRightByUpRightId() {
		return "rightSearch";
	}

	public String getRightDetail() {
		return "rightDetail";
	}
	
	public Right getRight() {
		return right;
	}

	public void setRight(Right right) {
		this.right = right;
	}

	public Integer getUpRightId() {
		return upRightId;
	}

	public void setUpRightId(Integer upRightId) {
		this.upRightId = upRightId;
	}

}
