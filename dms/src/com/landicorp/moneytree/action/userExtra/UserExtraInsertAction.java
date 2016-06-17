package com.landicorp.moneytree.action.userExtra;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.User;
import com.landicorp.core.service.IUserService;
import com.landicorp.core.util.DateUtil;
import com.landicorp.moneytree.entities.UserExtra;
import com.landicorp.moneytree.service.IUserExtraService;

public class UserExtraInsertAction extends BaseActionSupport {
    private UserExtra userExtra;
    private IUserExtraService userExtraService;
    private User user;
    private IUserService userService;
    
    public IUserService getUserService() {
        return userService;
    }
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public UserExtra getUserExtra() {
        return userExtra;
    }
    public void setUserExtra(UserExtra userExtra) {
        this.userExtra = userExtra;
    }
    public IUserExtraService getUserExtraService() {
        return userExtraService;
    }
    public void setUserExtraService(IUserExtraService userExtraService) {
        this.userExtraService = userExtraService;
    }
    
    public String prepare(){
        user=userService.getById(user.getId());
        userExtra=userExtraService.getByUserId(user.getId());
        
        return INPUT;
    }
    
    //添加吃数最大值和当期时间
    public void insertUserExtra() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            UserExtra userExtra1=userExtraService.getByUserId(user.getId());
            if(userExtra1==null){
                userExtra.setUser(user);
                userExtraService.add(userExtra);
            }else {
                userExtra.setUser(user);
                userExtraService.update(userExtra);
            }
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\"}]");
    }
    
    //得到用户的倍数和返点
    public void getRebateAndTimes() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        int code=0;
        try {
            userExtra=userExtraService.getByUserId(getSessionUser().getId());
            if(userExtra==null){
                userExtra=new UserExtra();
            }
            user=userService.getById(getSessionUser().getId());
            code=1;
        } catch (Exception e) {
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(user.getLastLoginTime());
        response.getWriter().write("[{\"lastLoginTime\":\""+dateString+"\",\"rebate\":\""+userExtra.getRebate()+"\",\"times\":\""+userExtra.getTimes()+"\"}]");
    }
    
    //跳转设置上家返点与倍数界面
    public String toSetRebateTimes(){
        user=getSessionUser();
        userExtra=userExtraService.getByUserId(user.getId());
        return "rebatetimes";
    }
    
    //设置上家返点与倍数
    public void setRebateTimes() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8"); 
        String reason="";
        int code=0;
        String returnValue="";
        try {
            UserExtra userExtra1=userExtraService.getByUserId(user.getId());
            if(userExtra1==null){
                userExtra.setUser(user);
                userExtraService.add(userExtra);
            }else {
                userExtra.setUser(user);
                userExtraService.update(userExtra);
            }
            returnValue="新增成功";
            code=1;
            setWindowReturnValue(returnValue);
        } catch (Exception e) {
            reason="新增失败";
        }
        
        
        response.getWriter().write("[{\"code\":\""+code+"\",\"reason\":\""+reason+"\",\"returnValue\":\""+returnValue+"\"}]");
    }
    
    //判断该用户是否即将到期
    public void isExpire() throws IOException{
        HttpServletResponse response = ServletActionContext.getResponse(); 
        response.setCharacterEncoding("UTF-8");
        int code=0;
        try {
            user=getSessionUser();
            userExtra=userExtraService.getByUserId(user.getId());
            Date nowDate=new Date();
            int n=DateUtil.getDaysBetween(nowDate,userExtra.getFinishTime());
            if(n>=0 && n<=5){
                code=1;
            }
        } catch (Exception e) {
            
        }
        response.getWriter().write("[{\"code\":\""+code+"\"}]");
    }
    
}
