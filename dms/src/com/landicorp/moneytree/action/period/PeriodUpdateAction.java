package com.landicorp.moneytree.action.period;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IPeriodService;

public class PeriodUpdateAction extends BaseActionSupport {
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
    public String prepare()
    {
        period=periodService.getById(period.getId());
        return INPUT;
    }
    
    //修改期数信息
    public void updatePeriod() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            Period insertPrDoc=periodService.getById(period.getId());
            insertPrDoc.setPeriod(period.getPeriod());
            insertPrDoc.setLotteryTime(period.getLotteryTime());
            insertPrDoc.setLotteryResult(period.getLotteryResult());
            periodService.update(insertPrDoc);
            returnValue="修改成功";
            code=1;
            //setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="修改失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
