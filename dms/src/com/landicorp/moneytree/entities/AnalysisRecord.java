package com.landicorp.moneytree.entities;

import com.landicorp.core.entities.base.BaseEntity;

/**
 * 收数情况记录bean，用以英葵分析
 * 
 * @author lixuyu
 *
 */
public class AnalysisRecord extends BaseEntity {

	private int winCount;// 赚钱个数
	private int loseCount;// 亏钱个数
	private float winMaxValue;// 赚钱最大值
	private int winMaxNum;// 赚钱最大值的号码
	private float loseMaxValue;// 亏钱最大值
	private int loseMaxNum;// 亏钱最大值的号码
	private float winProbability;// 赚钱概率

	public AnalysisRecord(int winCount, int loseCount, float winMaxValue, int winMaxNum, float loseMaxValue,
			int loseMaxNum, float winProbability) {
		super();
		this.winCount = winCount;
		this.loseCount = loseCount;
		this.winMaxValue = winMaxValue;
		this.winMaxNum = winMaxNum;
		this.loseMaxValue = loseMaxValue;
		this.loseMaxNum = loseMaxNum;
		this.winProbability = winProbability;
	}

	public int getWinCount() {
		return winCount;
	}

	public void setWinCount(int winCount) {
		this.winCount = winCount;
	}

	public int getLoseCount() {
		return loseCount;
	}

	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}

	public float getWinMaxValue() {
		return winMaxValue;
	}

	public void setWinMaxValue(float winMaxValue) {
		this.winMaxValue = winMaxValue;
	}

	public int getWinMaxNum() {
		return winMaxNum;
	}

	public void setWinMaxNum(int winMaxNum) {
		this.winMaxNum = winMaxNum;
	}

	public float getLoseMaxValue() {
		return loseMaxValue;
	}

	public void setLoseMaxValue(float loseMaxValue) {
		this.loseMaxValue = loseMaxValue;
	}

	public int getLoseMaxNum() {
		return loseMaxNum;
	}

	public void setLoseMaxNum(int loseMaxNum) {
		this.loseMaxNum = loseMaxNum;
	}

	public float getWinProbability() {
		return winProbability;
	}

	public void setWinProbability(float winProbability) {
		this.winProbability = winProbability;
	}

}
