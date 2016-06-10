package com.landicorp.moneytree.action.period;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IPeriodService;

public class PeriodSearchAction extends BaseActionSupport {
    private Period period;
    private IPeriodService periodService;
    private List<Period> periodList;
    public Period getPeriod() {
        return period;
    }
    public void setPeriod(Period period) {
        this.period = period;
    }
    public IPeriodService getPeriodService() {
        return periodService;
    }
    public void setPeriodService(IPeriodService periodService) {
        this.periodService = periodService;
    }
    public List<Period> getPeriodList() {
        return periodList;
    }
    public void setPeriodList(List<Period> periodList) {
        this.periodList = periodList;
    }
    public String getAllPeriod(){
        period=new Period();
        periodList=periodService.getAllPeriod(period,getPager());
        return SUCCESS;
    }
    
    public String searchPeriodByInfo(){
        periodList=periodService.getPeriodListByPeriod(period, getPager());
        
        return SUCCESS;
    }
    
    public String detail(){
        period=periodService.getById(period.getId());
        return "detail";
    }
}
