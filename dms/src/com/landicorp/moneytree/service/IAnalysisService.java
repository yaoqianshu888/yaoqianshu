package com.landicorp.moneytree.service;

import java.util.List;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.moneytree.entities.ChargeRecord;

public interface IAnalysisService extends IBaseService<ChargeRecord, Integer> {
	/**
	 * 获取用户当前期的所有收数记录
	 * 
	 * @param userId
	 * @param periodId
	 * @return
	 */
	public List<ChargeRecord> getPeriodChargeRecord(Integer userId, Integer periodId);

	/**
	 * 获取用户当前期的指定下家的所有收数记录
	 * 
	 * @param userId
	 * @param periodId
	 * @param apprenticeId
	 * @return
	 */
	public List<ChargeRecord> getApprenticeChargeRecord(Integer userId, Integer periodId, Integer apprenticeId);//

}
