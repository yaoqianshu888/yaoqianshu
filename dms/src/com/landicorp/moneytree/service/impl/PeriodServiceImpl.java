package com.landicorp.moneytree.service.impl;

import java.util.List;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.IPeriodDao;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IPeriodService;

public class PeriodServiceImpl extends AbstractBaseServiceImpl<Period, Integer> implements IPeriodService {

    private IPeriodDao periodDao;
    
    public IPeriodDao getPeriodDao() {
        return periodDao;
    }

    public void setPeriodDao(IPeriodDao periodDao) {
        this.periodDao = periodDao;
    }

    @Override
    public int add(Period arg0) {
        return periodDao.save(arg0);
    }


    @Override
    public void delete(Integer[] arg0) {
        periodDao.delete(arg0);
    }


    @Override
    public Period getById(Integer arg0) {
        return periodDao.getById(arg0);
    }

    @Override
    public int update(Period arg0) {
        return periodDao.update(arg0);
    }

    @Override
    public List<Period> getAllPeriod(Period period, Pager pager) {
        if (pager != null) {
            pager.setTotalCount(periodDao.getAllPeriodCount(period));
        }
        return periodDao.getAllPeriod(period, pager);
    }

    @Override
    public List<Period> getPeriodListByPeriod(Period period, Pager pager) {
        if (pager != null) {
            pager.setTotalCount(periodDao.getPeriodCountByPeriod(period));
        }
        return periodDao.getPeriodListByPeriod(period, pager);
    }

    @Override
    public IMyBatisDao<Period, Integer> getMyBatisDao() {
        return periodDao;
    }

   
    @Override
    public void setPrePreiod() {
        periodDao.setPrePreiod();
    }

    @Override
    public void setHisPreiod() {
        periodDao.setHisPreiod();
    }

    @Override
    public Period getPrePeriod() {
        List<Period> periods=periodDao.getPrePeriod();
        if(periods!=null){
            return periods.get(0);
        }else {
            return null;
        }
        
    }

    @Override
    public Period getNowPeriod() {
        List<Period> periods=periodDao.getNowPeriod();
        if(periods!=null){
            return periods.get(0);
        }else {
            return null;
        }
    }

}
