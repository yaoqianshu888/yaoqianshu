package com.landicorp.moneytree.action.numgroup;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.INumgroupService;

public class NumgroupSearchAction extends BaseActionSupport {
    private Numgroup numgroup;
    private List<Numgroup> numgroupList;
    private INumgroupService numgroupService;
    public Numgroup getNumgroup() {
        return numgroup;
    }
    public void setNumgroup(Numgroup numgroup) {
        this.numgroup = numgroup;
    }
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
    public String getAllNumgroup(){
        numgroup=new Numgroup();
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getAllNumgroup(numgroup, getPager());
        return SUCCESS;
    }
    
    public String searchNumgroupByInfo(){
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getNumgroupListByNumgroup(numgroup, getPager());
        
        return SUCCESS;
    }
    
    public String detail(){
        numgroup=numgroupService.getById(numgroup.getId());
        return "detail";
    }
}
