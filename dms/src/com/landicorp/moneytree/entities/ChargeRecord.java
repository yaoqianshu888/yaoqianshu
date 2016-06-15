package com.landicorp.moneytree.entities;

import com.landicorp.core.entities.base.BaseEntity;

/**
 * 收数情况记录bean，用以英葵分析
 * 
 * @author lixuyu
 *
 */
public class ChargeRecord extends BaseEntity {
	public Integer id;
	public String chargeMoney;// 购买的钱数，eg：100
	public String chargeNumber;// 购买的号码 eg：1，3，5，7 这4个号码共100
	public Integer groupId;// 购买的群组id
	public Integer apprenticeId;// 下家id

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getChargeMoney() {
		return chargeMoney;
	}

	public void setChargeMoney(String chargeMoney) {
		this.chargeMoney = chargeMoney;
	}

	public String getChargeNumber() {
		return chargeNumber;
	}

	public void setChargeNumber(String chargeNumber) {
		this.chargeNumber = chargeNumber;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getApprenticeId() {
		return apprenticeId;
	}

	public void setApprenticeId(Integer apprenticeId) {
		this.apprenticeId = apprenticeId;
	}

}
