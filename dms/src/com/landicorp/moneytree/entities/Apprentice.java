package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.User;
import com.landicorp.core.entities.base.BaseEntity;

public class Apprentice extends BaseEntity{  //下家
    public Integer id;
    public String apprenticeName;  //下家名
    public User user;  //用户id
    public Integer status;  //状态：激活（新增），delete（删除）、禁用
    public String wordRebate;  //字返点
    public Date createTime;// 创建时间
    private Date lastModifyTime;// 最后修改时间
    private User creator;// 创建者
    private User lastModifier;// 最后修改人
    private String memo;  //备注
    private String wordTimes;//字倍数
    private String zodiacRebate;//包肖返点
    private String zodiacTimes;  //包肖倍数
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getApprenticeName() {
        return apprenticeName;
    }
    public void setApprenticeName(String apprenticeName) {
        this.apprenticeName = apprenticeName;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
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
    public User getCreator() {
        return creator;
    }
    public void setCreator(User creator) {
        this.creator = creator;
    }
    public User getLastModifier() {
        return lastModifier;
    }
    public void setLastModifier(User lastModifier) {
        this.lastModifier = lastModifier;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public String getWordRebate() {
        return wordRebate;
    }
    public void setWordRebate(String wordRebate) {
        this.wordRebate = wordRebate;
    }
    public String getWordTimes() {
        return wordTimes;
    }
    public void setWordTimes(String wordTimes) {
        this.wordTimes = wordTimes;
    }
    public String getZodiacRebate() {
        return zodiacRebate;
    }
    public void setZodiacRebate(String zodiacRebate) {
        this.zodiacRebate = zodiacRebate;
    }
    public String getZodiacTimes() {
        return zodiacTimes;
    }
    public void setZodiacTimes(String zodiacTimes) {
        this.zodiacTimes = zodiacTimes;
    }
    @Override
    public String toString() {
        return "Apprentice [id=" + id + ", apprenticeName=" + apprenticeName + ", user=" + user + ", status=" + status
                        + ", wordRebate=" + wordRebate + ", createTime=" + createTime + ", lastModifyTime=" + lastModifyTime
                        + ", creator=" + creator + ", lastModifier=" + lastModifier + ", memo=" + memo + ", wordTimes="
                        + wordTimes + ", zodiacRebate=" + zodiacRebate + ", zodiacTimes=" + zodiacTimes + "]";
    }
   
    
}
