package com.landicorp.moneytree.action.numgroup;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.INumgroupService;

public class NumgroupUpdateAction extends BaseActionSupport {
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
    
    public String prepare()
    {
        numgroup=numgroupService.getById(numgroup.getId());
        return INPUT;
    }
    
    //修改群组信息
    public void updateNumgroup() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            Numgroup insertPrDoc=numgroupService.getById(numgroup.getId());
            insertPrDoc.setGroupName(numgroup.getGroupName());
            insertPrDoc.setMemo(numgroup.getMemo());
            numgroupService.update(insertPrDoc);
            returnValue="修改成功";
            code=1;
            //setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="修改失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
