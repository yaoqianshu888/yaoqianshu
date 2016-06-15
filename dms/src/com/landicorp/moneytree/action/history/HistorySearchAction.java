package com.landicorp.moneytree.action.history;

import java.util.ArrayList;
import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.User;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IApprenticeService;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.IPeriodService;

public class HistorySearchAction extends BaseActionSupport {
	private History history;
	private List<History> historyList;
	private IHistoryService historyService;

	private Period nowPeriod;
	private IPeriodService periodService;

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
	}

	public List<History> getHistoryList() {
		return historyList;
	}

	public void setHistoryList(List<History> historyList) {
		this.historyList = historyList;
	}

	public IHistoryService getHistoryService() {
		return historyService;
	}

	public void setHistoryService(IHistoryService historyService) {
		this.historyService = historyService;
	}

	public Period getNowPeriod() {
		return nowPeriod;
	}

	public void setNowPeriod(Period nowPeriod) {
		this.nowPeriod = nowPeriod;
	}

	public IPeriodService getPeriodService() {
		return periodService;
	}

	public void setPeriodService(IPeriodService periodService) {
		this.periodService = periodService;
	}

	public String getAllHistory() {

		return SUCCESS;
	}
}
