package com.landicorp.moneytree.action.chargeNumber;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.service.IHistoryService;

public class ChargeDeleteAction extends BaseActionSupport {
    private String[] delete;
    private IHistoryService historyService;
    public String[] getDelete() {
        return delete;
    }
    public void setDelete(String[] delete) {
        this.delete = delete;
    }
    public IHistoryService getHistoryService() {
        return historyService;
    }
    public void setHistoryService(IHistoryService historyService) {
        this.historyService = historyService;
    }
    public void deleteCharge() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            historyService.deleteByClickNo(delete);
            historyService.deleteTmpByClickNo(delete);
            returnValue="修改成功";
            code=1;
            setWindowReturnValue(returnValue);
        }catch (Exception e) {
            reason="修改失败";
        }
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
