package com.landicorp.moneytree.action.chargeNumber;

import java.util.List;



import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.IApprenticeService;
import com.landicorp.moneytree.service.INumgroupService;

public class ChargeNumberAction extends BaseActionSupport {
    private Apprentice apprentice;
    private List<Apprentice> apprenticeList;
    private List<Numgroup> numgroupList;
    private INumgroupService numgroupService;
    
    public List<Numgroup> getNumgroupList() {
        return numgroupList;
    }

    public void setNumgroupList(List<Numgroup> numgroupList) {
        this.numgroupList = numgroupList;
    }

    public INumgroupService getNumgroupService() {
        return numgroupService;
    }

    public void setNumgroupService(INumgroupService numgroupService) {
        this.numgroupService = numgroupService;
    }

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

    public String  chargeNumber(){
        apprentice=new Apprentice();
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getAllApprentice(apprentice, getPager());
        
        Numgroup numgroup=new Numgroup();
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getAllNumgroupNoPager(numgroup);
        
        return SUCCESS;
    }
    
    public String searchApprenticeByInfo(){
     
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getApprenticeListByApprentice(apprentice, getPager());
        
        return SUCCESS;
    }
}
