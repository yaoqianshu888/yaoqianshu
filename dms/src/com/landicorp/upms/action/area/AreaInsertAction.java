package com.landicorp.upms.action.area;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Area;

public class AreaInsertAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	private Area area;

	public String prepare() {
		return INPUT;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}
