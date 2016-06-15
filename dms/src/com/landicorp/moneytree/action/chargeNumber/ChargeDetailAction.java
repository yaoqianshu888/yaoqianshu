package com.landicorp.moneytree.action.chargeNumber;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.INumgroupService;

public class ChargeDetailAction extends BaseActionSupport {
    private History history;
    private IHistoryService historyService;
    private List<History> historyList;
    private INumgroupService numgroupService;
    
    public INumgroupService getNumgroupService() {
        return numgroupService;
    }
    public void setNumgroupService(INumgroupService numgroupService) {
        this.numgroupService = numgroupService;
    }
    public List<History> getHistoryList() {
        return historyList;
    }
    public void setHistoryList(List<History> historyList) {
        this.historyList = historyList;
    }
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
    
    public String detail(){
        historyList=historyService.getAllHistoryByClickNo(history);
        for(int i=0;i<historyList.size();i++){
            Numgroup numgroup=new Numgroup();
            numgroup=numgroupService.getById(historyList.get(i).getNumgroup().getId());
            historyList.get(i).setNumgroup(numgroup);
        }
        return SUCCESS;
    }
    
}
