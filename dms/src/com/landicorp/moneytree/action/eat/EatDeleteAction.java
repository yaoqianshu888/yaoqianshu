package com.landicorp.moneytree.action.eat;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.service.IEatService;

public class EatDeleteAction extends BaseActionSupport {
	private Integer[] delete;
	private IEatService eatService;

	public Integer[] getDelete() {
		return delete;
	}

	public void setDelete(Integer[] delete) {
		this.delete = delete;
	}

	public IEatService getEatService() {
		return eatService;
	}

	public void setEatService(IEatService eatService) {
		this.eatService = eatService;
	}

	// 逻辑删除下家
	public void deleteEat() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		String reason = "";
		int code = 0;
		String returnValue = "";
		try {
			eatService.deleteEat(delete);
			returnValue = "修改成功";
			code = 1;
			setWindowReturnValue(returnValue);
		} catch (Exception e) {
			reason = "修改失败";
		}

		response.getWriter().write(
				"[{\"code\":\"" + code + "\",\"reason\":\"" + reason + "\",\"returnValue\":\"" + returnValue + "\"}]");
	}

}
