package com.landicorp.moneytree.action.apprentice;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.service.IApprenticeService;

public class ApprenticeInsertAction extends BaseActionSupport {
    private Apprentice apprentice;
    private IApprenticeService apprenticeService;
    public Apprentice getApprentice() {
        return apprentice;
    }
    public void setApprentice(Apprentice apprentice) {
        this.apprentice = apprentice;
    }
    public IApprenticeService getApprenticeService() {
        return apprenticeService;
    }
    public void setApprenticeService(IApprenticeService apprenticeService) {
        this.apprenticeService = apprenticeService;
    }
    
    //跳转新增
    public String prepare() {
        return "input";
    }
    
    //新增
    public void insertApprentice() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            apprentice.setStatus(1);
            apprentice.setUser(getSessionUser());
            apprentice.setCreateTime(new Date());
            apprentice.setCreator(getSessionUser());
            apprentice.setLastModifyTime(new Date());
            apprentice.setLastModifier(getSessionUser());
            apprenticeService.add(apprentice);
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }

}
