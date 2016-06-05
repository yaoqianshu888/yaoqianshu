package com.landicorp.moneytree.action.apprentice;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.service.IApprenticeService;

public class ApprenticeDeleteAction extends BaseActionSupport {
    private Integer[] delete;
    private IApprenticeService apprenticeService;
    public Integer[] getDelete() {
        return delete;
    }
    public void setDelete(Integer[] delete) {
        this.delete = delete;
    }
    public IApprenticeService getApprenticeService() {
        return apprenticeService;
    }
    public void setApprenticeService(IApprenticeService apprenticeService) {
        this.apprenticeService = apprenticeService;
    }
    
    
    //逻辑删除下家
    public void deleteApprentice() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            apprenticeService.deleteApprentice(delete);
            returnValue="修改成功";
            code=1;
            setWindowReturnValue(returnValue);
        }catch (Exception e) {
            reason="修改失败";
        }
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
    
}
