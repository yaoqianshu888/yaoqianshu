package com.landicorp.upms.action.right;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Right;

public class RightInsertAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	private Right right;

	public String prepare() {
		return INPUT;
	}

	public Right getRight() {
		return right;
	}

	public void setRight(Right right) {
		this.right = right;
	}

}
