package com.landicorp.moneytree.entities;

import com.landicorp.core.entities.base.BaseEntity;

/**
 * 下家情况记录bean，用以下家数据统计分析
 * 
 * @author lixuyu
 *
 */
public class ApprenticeData extends BaseEntity {

	private Integer apprenticeId;// 下家ID
	private String apprenticeName;// 下家名称
	private float buyMoney;// 下注金额
	private float winTimesMoney;// 中奖金额
	private float winRebateMoney;// 返点金额
	private float payMoney;// 应支付给下家的金额

	public Integer getApprenticeId() {
		return apprenticeId;
	}

	public void setApprenticeId(Integer apprenticeId) {
		this.apprenticeId = apprenticeId;
	}

	public String getApprenticeName() {
		return apprenticeName;
	}

	public void setApprenticeName(String apprenticeName) {
		this.apprenticeName = apprenticeName;
	}

	public float getBuyMoney() {
		return buyMoney;
	}

	public void setBuyMoney(float buyMoney) {
		this.buyMoney = buyMoney;
	}

	public float getWinTimesMoney() {
		return winTimesMoney;
	}

	public void setWinTimesMoney(float winTimesMoney) {
		this.winTimesMoney = winTimesMoney;
	}

	public float getWinRebateMoney() {
		return winRebateMoney;
	}

	public void setWinRebateMoney(float winRebateMoney) {
		this.winRebateMoney = winRebateMoney;
	}

	public float getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(float payMoney) {
		this.payMoney = payMoney;
	}

}
