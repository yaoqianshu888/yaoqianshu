package com.landicorp.moneytree.action.period;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IPeriodService;

public class PeriodInsertAction extends BaseActionSupport {
    private Period period;
    private IPeriodService periodService;
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
    //跳转新增
    public String prepare() {
        return "input";
    }
    
    //新增
    public void insertPeriod() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            periodService.setHisPreiod();
            periodService.setPrePreiod();
            period.setIsNow(1);
            periodService.add(period);
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
