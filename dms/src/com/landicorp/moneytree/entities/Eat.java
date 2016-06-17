package com.landicorp.moneytree.entities;

import java.util.Date;

import com.landicorp.core.entities.User;
import com.landicorp.core.entities.base.BaseEntity;

public class Eat extends BaseEntity { // 吃数值
	public Integer id;
	public Integer eatValue; // 下家名
	public User user; // 用户id
	public Integer status; // 状态：激活（新增），delete（删除）、禁用
	public Date createTime;// 创建时间
	private Date lastModifyTime;// 最后修改时间
	private User creator;// 创建者
	private User lastModifier;// 最后修改人
	private String memo; // 备注

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEatValue() {
		return eatValue;
	}

	public void setEatValue(Integer eatValue) {
		this.eatValue = eatValue;
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

}
