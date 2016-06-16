package com.landicorp.moneytree.action.eat;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Eat;
import com.landicorp.moneytree.service.IEatService;

public class EatUpdateAction extends BaseActionSupport {
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
    
    public String prepare()
    {
        eat=eatService.getById(eat.getId());
        return INPUT;
    }
    
    //修改下家信息
    public void updateEat() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            Eat insertPrDoc=eatService.getById(eat.getId());
            insertPrDoc.setEatValue(eat.getEatValue());
            insertPrDoc.setMemo(eat.getMemo());
            insertPrDoc.setLastModifier(getSessionUser());
            insertPrDoc.setLastModifyTime(new Date());
            eatService.update(insertPrDoc);
            returnValue="修改成功";
            code=1;
            //setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="修改失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
