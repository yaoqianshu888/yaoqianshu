package com.landicorp.moneytree.service.impl;

import java.util.List;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.moneytree.dao.IAnalysisDao;
import com.landicorp.moneytree.entities.ChargeRecord;
import com.landicorp.moneytree.service.IAnalysisService;

public class AnalysisServiceImpl extends AbstractBaseServiceImpl<ChargeRecord, Integer> implements IAnalysisService {

	private IAnalysisDao analysisDao;

	public IAnalysisDao getAnalysisDao() {
		return analysisDao;
	}

	public void setAnalysisDao(IAnalysisDao analysisDao) {
		this.analysisDao = analysisDao;
	}

	@Override
	public int add(ChargeRecord arg0) {
		return analysisDao.save(arg0);
	}

	@Override
	public void delete(Integer[] arg0) {
		analysisDao.delete(arg0);
	}

	@Override
	public ChargeRecord getById(Integer arg0) {
		return analysisDao.getById(arg0);
	}

	@Override
	public int update(ChargeRecord arg0) {
		return analysisDao.update(arg0);
	}

	@Override
	public IMyBatisDao<ChargeRecord, Integer> getMyBatisDao() {
		return analysisDao;
	}

	@Override
	public List<ChargeRecord> getPeriodChargeRecord(Integer userId, Integer periodId) {
		return analysisDao.getPeriodChargeRecord(userId, periodId);
	}

	@Override
	public List<ChargeRecord> getApprenticeChargeRecord(Integer userId, Integer periodId, Integer apprenticeId) {
		return analysisDao.getApprenticeChargeRecord(userId, periodId, apprenticeId);
	}

}
