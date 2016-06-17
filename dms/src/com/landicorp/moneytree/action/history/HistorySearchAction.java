package com.landicorp.moneytree.action.history;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.INumgroupService;
import com.landicorp.moneytree.service.IPeriodService;

public class HistorySearchAction extends BaseActionSupport {
	private History history;
	private IHistoryService historyService;

	private Period nowPeriod;
	private IPeriodService periodService;

	private List<List<History>> histories;
	private INumgroupService numgroupService;

	public History getHistory() {
		return history;
	}

	public void setHistory(History history) {
		this.history = history;
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

	public List<List<History>> getHistories() {
		return histories;
	}

	public void setHistories(List<List<History>> histories) {
		this.histories = histories;
	}

	public INumgroupService getNumgroupService() {
		return numgroupService;
	}

	public void setNumgroupService(INumgroupService numgroupService) {
		this.numgroupService = numgroupService;
	}

	/**
	 * 获取所有历史记录，默认action
	 * 
	 * @return
	 */
	public String getAllHistory() {

		history = new History();

		List<History> historyList = historyService.getAllHistory(history, getPager());
		getAllHistories(historyList);

		return SUCCESS;
	}

	private void getAllHistories(List<History> historyList) {

		histories = new ArrayList<List<History>>();
		if (historyList.size() > 0) {
			History temHistory = historyList.get(0); // 临时存放进行对比
			List<History> histories2 = new ArrayList<History>(); // 存放每组相同点击号
			for (int i = 0; i < historyList.size(); i++) {
				if (temHistory.getClickNo().equals(historyList.get(i).getClickNo())) {
					Numgroup tempNumgroup = numgroupService.getById(historyList.get(i).getNumgroup().getId()); // 得到群组信息
					historyList.get(i).setNumgroup(tempNumgroup);
					histories2.add(historyList.get(i));
				} else {
					histories.add(histories2);
					temHistory = historyList.get(i);
					histories2 = new ArrayList<History>();

					Numgroup tempNumgroup = numgroupService.getById(historyList.get(i).getNumgroup().getId()); // 得到群组信息
					historyList.get(i).setNumgroup(tempNumgroup);
					histories2.add(historyList.get(i));
				}

				if (i == historyList.size() - 1) { // 当为最后一个数时，直接添加
					histories.add(histories2);
				}
			}
		}
	}

	/**
	 * 根据条件获取历史记录
	 * 
	 * @return
	 */
	public String getHistoryByHistory() {
		Period tempPeriod = new Period();
		Apprentice tempApprentice = new Apprentice();
		history = new History();

		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 获取参数
		Map<String, String[]> map = request.getParameterMap();
		for (Entry<String, String[]> me : map.entrySet()) {
			String name = me.getKey();
			String[] v = me.getValue();
			if (v[0].equals("") || v[0] == null) {
				continue;
			}
			if (name.equals("periodValue")) {
				tempPeriod.setPeriod(v[0]);
				history.setPeriod(tempPeriod);
			}
			if (name.equals("apprenticeName")) {
				tempApprentice.setApprenticeName(v[0]);
				history.setApprentice(tempApprentice);
			}
		}

		List<History> historyList = historyService.getHistoryListByHistory(history, getPager());
		getAllHistories(historyList);

		return SUCCESS;
	}
	
}
