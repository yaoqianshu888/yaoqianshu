package com.landicorp.moneytree.service.impl;

import java.util.List;
import java.util.Map;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.IApprenticeDao;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.service.IApprenticeService;

public class ApprenticeServiceImpl extends AbstractBaseServiceImpl<Apprentice, Integer> implements IApprenticeService {

    private IApprenticeDao apprenticeDao;
    
    public IApprenticeDao getApprenticeDao() {
        return apprenticeDao;
    }

    public void setApprenticeDao(IApprenticeDao apprenticeDao) {
        this.apprenticeDao = apprenticeDao;
    }

    @Override
    public int add(Apprentice arg0) {
        return apprenticeDao.save(arg0);
    }

 
    @Override
    public void delete(Integer[] arg0) {
        apprenticeDao.delete(arg0);
    }

  
    @Override
    public Apprentice getById(Integer arg0) {
        return apprenticeDao.getById(arg0);
    }


    @Override
    public int update(Apprentice arg0) {
        return apprenticeDao.update(arg0);
    }

    @Override
    public List<Apprentice> getAllApprentice(Apprentice apprentice,Pager pager) {
        if (pager != null) {
            pager.setTotalCount(apprenticeDao.getAllApprenticeCount(apprentice));
        }
        return apprenticeDao.getAllApprentice(apprentice,pager);
    }

    @Override
    public List<Apprentice> getApprenticeListByApprentice(Apprentice apprentice, Pager pager) {
        if (pager != null) {
            pager.setTotalCount(apprenticeDao.getApprenticeCountByApprentice(apprentice));
        }
        return apprenticeDao.getApprenticeListByApprentice(apprentice, pager);
    }

    @Override
    public IMyBatisDao<Apprentice, Integer> getMyBatisDao() {
        return apprenticeDao;
    }

}
