package com.landicorp.moneytree.action.history;

import java.util.ArrayList;
import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IApprenticeService;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.INumgroupService;
import com.landicorp.moneytree.service.IPeriodService;

public class HistorySearchAction extends BaseActionSupport {
	private History history;
	private IHistoryService historyService;

	private Period nowPeriod;
	private Period prePeriod;
	private IPeriodService periodService;

	private IApprenticeService apprenticeService;

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

	public Period getPrePeriod() {
		return prePeriod;
	}

	public void setPrePeriod(Period prePeriod) {
		this.prePeriod = prePeriod;
	}

	public IPeriodService getPeriodService() {
		return periodService;
	}

	public void setPeriodService(IPeriodService periodService) {
		this.periodService = periodService;
	}

	public IApprenticeService getApprenticeService() {
		return apprenticeService;
	}

	public void setApprenticeService(IApprenticeService apprenticeService) {
		this.apprenticeService = apprenticeService;
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
		getPager().setPageSize(20);
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
					if (i == 0) {
						Period period = periodService.getById(historyList.get(i).getPeriod().getId());
						historyList.get(i).setPeriod(period);
						Apprentice apprentice = apprenticeService.getById(historyList.get(i).getApprentice().getId());
						historyList.get(i).setApprentice(apprentice);
					}
					histories2.add(historyList.get(i));
				} else {
					histories.add(histories2);
					temHistory = historyList.get(i);
					histories2 = new ArrayList<History>();

					Numgroup tempNumgroup = numgroupService.getById(historyList.get(i).getNumgroup().getId()); // 得到群组信息
					historyList.get(i).setNumgroup(tempNumgroup);
					Period period = periodService.getById(historyList.get(i).getPeriod().getId());
					historyList.get(i).setPeriod(period);
					Apprentice apprentice = apprenticeService.getById(historyList.get(i).getApprentice().getId());
					historyList.get(i).setApprentice(apprentice);

					histories2.add(historyList.get(i));
				}

				if (i == historyList.size() - 1) { // 当为最后一个数时，直接添加
					histories.add(histories2);
				}
			}
		}

		// 得到上一期和当前期
		prePeriod = periodService.getPrePeriod();
		nowPeriod = periodService.getNowPeriod();
	}

	/**
	 * 根据条件获取历史记录
	 * 
	 * @return
	 */
	public String getHistoryByHistory() {

		if (!"".equals(history.getApprentice().getApprenticeName())) {
			List<Apprentice> apprenticeList = new ArrayList<Apprentice>();
			Apprentice apprentice = new Apprentice();
			apprentice.setUser(getSessionUser());
			apprentice.setApprenticeName(history.getApprentice().getApprenticeName());
			apprenticeList = apprenticeService.getApprenticeListByApprentice(apprentice, null);
			if (apprenticeList.size() != 0) {
				history.setApprentice(apprenticeList.get(0));
			} else {
				return SUCCESS;
			}
		}
		if (!"".equals(history.getPeriod().getPeriod())) {
			List<Period> periodList = new ArrayList<Period>();
			Period period = new Period();
			period.setPeriod(history.getPeriod().getPeriod());
			periodList = periodService.getPeriodListByPeriod(period, null);
			if (periodList.size() != 0) {
				history.setPeriod(periodList.get(0));
			} else {
				return SUCCESS;
			}
		}
		getPager().setPageSize(20);

		List<History> historyList = historyService.getHistoryListByHistory(history, getPager());
		getAllHistories(historyList);

		return SUCCESS;
	}

}
