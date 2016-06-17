package com.landicorp.moneytree.action.eat;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Eat;
import com.landicorp.moneytree.service.IEatService;

public class EatInsertAction extends BaseActionSupport {
    private Eat eat;
    private IEatService eatService;
    public Eat getEat() {
        return eat;
    }
    public void setEat(Eat eat) {
        this.eat = eat;
    }
    public IEatService getEatService() {
        return eatService;
    }
    public void setEatService(IEatService eatService) {
        this.eatService = eatService;
    }
    
    //跳转新增
    public String prepare() {
        return "input";
    }
    
    //新增
    public void insertEat() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            eat.setStatus(1);
            eat.setUser(getSessionUser());
            eat.setCreateTime(new Date());
            eat.setCreator(getSessionUser());
            eat.setLastModifyTime(new Date());
            eat.setLastModifier(getSessionUser());
            eatService.add(eat);
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }

}
