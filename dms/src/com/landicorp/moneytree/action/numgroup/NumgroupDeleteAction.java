package com.landicorp.moneytree.action.numgroup;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.service.INumgroupService;

public class NumgroupDeleteAction extends BaseActionSupport {
    private Integer[] delete;
    private INumgroupService numgroupService;
    public Integer[] getDelete() {
        return delete;
    }
    public void setDelete(Integer[] delete) {
        this.delete = delete;
    }
    public INumgroupService getNumgroupService() {
        return numgroupService;
    }
    public void setNumgroupService(INumgroupService numgroupService) {
        this.numgroupService = numgroupService;
    }

    //逻辑删除群组
    public void deleteNumgroup() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            numgroupService.deleteNumgroup(delete);
            returnValue="修改成功";
            code=1;
            setWindowReturnValue(returnValue);
        }catch (Exception e) {
            reason="修改失败";
        }
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
