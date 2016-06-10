package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.User;
import com.landicorp.core.entities.base.BaseEntity;

public class History extends BaseEntity {
    private Integer id;
    private User user;  //用户id
    private Period period;  //期数id
    private Apprentice apprentice;  //下家id
    private String chargeNumber;  //该群组收的钱数
    private Numgroup numgroup;  //群组号码id
    private Date createTime;  //生成时间
    private Date lastModifyTime;  //最后修改时间
    private String clickNo;//当前点击号
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
    public Period getPeriod() {
        return period;
    }
    public void setPeriod(Period period) {
        this.period = period;
    }
    public Apprentice getApprentice() {
        return apprentice;
    }
    public void setApprentice(Apprentice apprentice) {
        this.apprentice = apprentice;
    }
    public String getChargeNumber() {
        return chargeNumber;
    }
    public void setChargeNumber(String chargeNumber) {
        this.chargeNumber = chargeNumber;
    }
    public Numgroup getNumgroup() {
        return numgroup;
    }
    public void setNumgroup(Numgroup numgroup) {
        this.numgroup = numgroup;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public Date getLastModifyTime() {
        return lastModifyTime;
    }
    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }
    public String getClickNo() {
        return clickNo;
    }
    public void setClickNo(String clickNo) {
        this.clickNo = clickNo;
    }
  
    
}
