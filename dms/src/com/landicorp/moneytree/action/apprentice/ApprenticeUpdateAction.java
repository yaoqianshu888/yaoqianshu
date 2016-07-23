package com.landicorp.moneytree.action.apprentice;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.service.IApprenticeService;

public class ApprenticeUpdateAction extends BaseActionSupport {
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
    
    public String prepare()
    {
        apprentice=apprenticeService.getById(apprentice.getId());
        return INPUT;
    }
    
    //修改下家信息
    public void updateApprentice() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";   
        try {
            Apprentice insertPrDoc=apprenticeService.getById(apprentice.getId());
            
            insertPrDoc.setApprenticeName(apprentice.getApprenticeName());
            insertPrDoc.setMemo(apprentice.getMemo());
            insertPrDoc.setWordRebate(apprentice.getWordRebate());
            insertPrDoc.setWordTimes(apprentice.getWordTimes());
            insertPrDoc.setZodiacRebate(apprentice.getZodiacRebate());
            insertPrDoc.setZodiacTimes(apprentice.getZodiacTimes());
            insertPrDoc.setMainZodiacRebate(apprentice.getMainZodiacRebate());
            insertPrDoc.setMainZodiacTimes(apprentice.getMainZodiacTimes());
            insertPrDoc.setRedRebate(apprentice.getRedRebate());
            insertPrDoc.setRedTimes(apprentice.getRedTimes());
            insertPrDoc.setGreenRebate(apprentice.getGreenRebate());
            insertPrDoc.setGreenTimes(apprentice.getGreenTimes());
            insertPrDoc.setBlueRebate(apprentice.getBlueRebate());
            insertPrDoc.setBlueTimes(apprentice.getBlueTimes());
            insertPrDoc.setOddRebate(apprentice.getOddRebate());
            insertPrDoc.setOddTimes(apprentice.getOddTimes());
            insertPrDoc.setEvenRebate(apprentice.getEvenRebate());
            insertPrDoc.setEvenTimes(apprentice.getEvenTimes());
            insertPrDoc.setSort(apprentice.getSort());
            insertPrDoc.setLastModifier(getSessionUser());
            insertPrDoc.setLastModifyTime(new Date());
            apprenticeService.update(insertPrDoc);
            returnValue="修改成功";
            code=1;
            //setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="修改失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
}
