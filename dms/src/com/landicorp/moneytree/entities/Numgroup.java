package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.User;
import com.landicorp.core.entities.base.BaseEntity;

public class Numgroup extends BaseEntity {   //群组
    private Integer id;
    private String groupName;//群组名称
    private String groupNum;  //群组号码
    private User user; //用户id
    private Integer status;//状态，逻辑删除
    private Date createTime;  //创建时间
    private String memo;  //备注
    
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getGroupName() {
        return groupName;
    }
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    public String getGroupNum() {
        return groupNum;
    }
    public void setGroupNum(String groupNum) {
        this.groupNum = groupNum;
    }
   
  
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    
}
