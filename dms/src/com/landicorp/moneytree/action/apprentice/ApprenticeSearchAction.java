package com.landicorp.moneytree.action.apprentice;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.service.IApprenticeService;

public class ApprenticeSearchAction extends BaseActionSupport {
    private Apprentice apprentice;
    private List<Apprentice> apprenticeList;
    private IApprenticeService apprenticeService;
    public Apprentice getApprentice() {
        return apprentice;
    }
    public void setApprentice(Apprentice apprentice) {
        this.apprentice = apprentice;
    }
    public List<Apprentice> getApprenticeList() {
        return apprenticeList;
    }
    public void setApprenticeList(List<Apprentice> apprenticeList) {
        this.apprenticeList = apprenticeList;
    }
    public IApprenticeService getApprenticeService() {
        return apprenticeService;
    }
    public void setApprenticeService(IApprenticeService apprenticeService) {
        this.apprenticeService = apprenticeService;
    }
    
    public String getAllApprentice(){
        apprentice=new Apprentice();
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getAllApprentice(apprentice,getPager());
        return SUCCESS;
    }
    
    public String searchApprenticeByInfo(){
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getApprenticeListByApprentice(apprentice, getPager());
        
        return SUCCESS;
    }
    
    public String detail(){
        apprentice=apprenticeService.getById(apprentice.getId());
        return "detail";
    }
}
