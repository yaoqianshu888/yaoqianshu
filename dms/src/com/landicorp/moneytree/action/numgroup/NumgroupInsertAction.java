package com.landicorp.moneytree.action.numgroup;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.INumgroupService;

public class NumgroupInsertAction extends BaseActionSupport {
    private Numgroup numgroup;
    private INumgroupService numgroupService;
    public Numgroup getNumgroup() {
        return numgroup;
    }
    public void setNumgroup(Numgroup numgroup) {
        this.numgroup = numgroup;
    }
    public INumgroupService getNumgroupService() {
        return numgroupService;
    }
    public void setNumgroupService(INumgroupService numgroupService) {
        this.numgroupService = numgroupService;
    }
  //跳转新增
    public String prepare() {
        return "input";
    }
    
    
    //新增
    public void insertNumgroup() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            numgroup.setStatus(1);
            numgroup.setUser(getSessionUser());
            numgroup.setCreateTime(new Date());
            numgroupService.add(numgroup);
            
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }

}
