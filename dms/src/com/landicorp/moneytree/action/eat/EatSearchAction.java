package com.landicorp.moneytree.action.eat;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Eat;
import com.landicorp.moneytree.service.IEatService;

public class EatSearchAction extends BaseActionSupport {
	private Eat eat;
	private List<Eat> eatList;
	private IEatService eatService;

	public Eat getEat() {
		return eat;
	}

	public void setEat(Eat eat) {
		this.eat = eat;
	}

	public List<Eat> getEatList() {
		return eatList;
	}

	public void setEatList(List<Eat> eatList) {
		this.eatList = eatList;
	}

	public IEatService getEatService() {
		return eatService;
	}

	public void setEatService(IEatService eatService) {
		this.eatService = eatService;
	}

	public String getAllEat() {
		eat = new Eat();
		eat.setUser(getSessionUser());
		eatList = eatService.getAllEat(eat, getPager());
		
		return SUCCESS;
	}

	public String searchEatByInfo() {
		eat.setUser(getSessionUser());
		eatList = eatService.getEatListByEat(eat, getPager());

		return SUCCESS;
	}

	public String detail() {
		eat = eatService.getById(eat.getId());
		return "detail";
	}
}
