package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.User;
import com.landicorp.core.entities.base.BaseEntity;

public class UserExtra extends BaseEntity {
    private Integer id;
    private User user;
    private String rebate;  //上家返点
    private String times;  //上家倍数
    private String numLimit;  //吃数上限值
    private Date finishTime;//到期时间
    
    public Date getFinishTime() {
        return finishTime;
    }
    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
   
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getRebate() {
        return rebate;
    }
    public void setRebate(String rebate) {
        this.rebate = rebate;
    }
    public String getTimes() {
        return times;
    }
    public void setTimes(String times) {
        this.times = times;
    }
    public String getNumLimit() {
        return numLimit;
    }
    public void setNumLimit(String numLimit) {
        this.numLimit = numLimit;
    }
  
    
}
