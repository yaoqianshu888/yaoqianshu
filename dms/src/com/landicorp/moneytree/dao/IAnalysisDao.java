package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.moneytree.entities.ChargeRecord;

public interface IAnalysisDao extends IMyBatisDao<ChargeRecord, Integer> {
	/**
	 * 根据参数获取对应收数记录 获取某用户某期的收数记录
	 * 
	 * @param userId
	 * @param periodId
	 * @param apprenticeId
	 * @return
	 */
	public List<ChargeRecord> getPeriodChargeRecord(@Param("userId") Integer userId,
			@Param("periodId") Integer periodId);

	/**
	 * 获取某用户某期的某个下家的收数记录
	 * 
	 * @param userId
	 * @param periodId
	 * @param apprenticeId
	 * @return
	 */
	public List<ChargeRecord> getApprenticeChargeRecord(@Param("userId") Integer userId,
			@Param("periodId") Integer periodId, @Param("apprenticeId") Integer apprenticeId);

}
