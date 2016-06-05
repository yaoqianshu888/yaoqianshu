package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class Period extends BaseEntity {  //期数
    private Integer id;
    private String period;  //期数
    private String lotteryResult; //开奖结果
    private String chargeNumber; //收数情况
    private Date lotteryTime;  //开奖时间
    private Integer isNow;  //是否当前期  1-->是
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getPeriod() {
        return period;
    }
    public void setPeriod(String period) {
        this.period = period;
    }
  
    public String getLotteryResult() {
        return lotteryResult;
    }
    public void setLotteryResult(String lotteryResult) {
        this.lotteryResult = lotteryResult;
    }
    public String getChargeNumber() {
        return chargeNumber;
    }
    public void setChargeNumber(String chargeNumber) {
        this.chargeNumber = chargeNumber;
    }
    public Date getLotteryTime() {
        return lotteryTime;
    }
    public void setLotteryTime(Date lotteryTime) {
        this.lotteryTime = lotteryTime;
    }
    public Integer getIsNow() {
        return isNow;
    }
    public void setIsNow(Integer isNow) {
        this.isNow = isNow;
    }
    
}
