package com.landicorp.moneytree.action.chargeNumber;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.INumgroupService;

public class ChargeUpdateAction extends BaseActionSupport {
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
    public List<History> getHistoryList() {
        return historyList;
    }
    public void setHistoryList(List<History> historyList) {
        this.historyList = historyList;
    }
    
    public String prepare(){
        historyList=historyService.getAllHistoryByClickNo(history);
        for(int i=0;i<historyList.size();i++){
            Numgroup numgroup=new Numgroup();
            numgroup=numgroupService.getById(historyList.get(i).getNumgroup().getId());
            historyList.get(i).setNumgroup(numgroup);
        }
        return "input";
    }
    public void updateCharge() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        HttpServletRequest request=ServletActionContext.getRequest();
        request.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            Map<String,String[]> map = request.getParameterMap();
            for(Entry<String, String[]> me : map.entrySet()){
                String name = me.getKey();
                String [] v = me.getValue();
                history=new History();
                history.setChargeNumber(v[0]);
                history.setId(Integer.valueOf(name));
                history.setLastModifyTime(new Date());
                
               
                historyService.update(history);
            }
            returnValue="修改成功";
            code=1;
            //setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="修改失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
