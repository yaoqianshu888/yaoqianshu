package com.landicorp.moneytree.service.impl;

import java.util.List;
import java.util.Map;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.INumgroupDao;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.service.INumgroupService;

public class NumgroupServiceImpl extends AbstractBaseServiceImpl<Numgroup, Integer> implements INumgroupService {

    private INumgroupDao numgroupDao;
    
    public INumgroupDao getNumgroupDao() {
        return numgroupDao;
    }

    public void setNumgroupDao(INumgroupDao numgroupDao) {
        this.numgroupDao = numgroupDao;
    }

    @Override
    public int add(Numgroup arg0) {
        return numgroupDao.save(arg0);
    }


    @Override
    public void delete(Integer[] arg0) {
        numgroupDao.delete(arg0);
    }

  
    @Override
    public Numgroup getById(Integer arg0) {
        return numgroupDao.getById(arg0);
    }

    @Override
    public int update(Numgroup arg0) {
        return numgroupDao.update(arg0);
    }

    @Override
    public List<Numgroup> getAllNumgroup(Numgroup numgroup, Pager pager) {
        if(pager != null){
            pager.setTotalCount(numgroupDao.getAllNumgroupCount(numgroup));
        }
        return numgroupDao.getAllNumgroup(numgroup, pager);
    }

    @Override
    public List<Numgroup> getNumgroupListByNumgroup(Numgroup numgroup, Pager pager) {
        if(pager != null){
            pager.setTotalCount(numgroupDao.getNumgroupCountByNumgroup(numgroup));
        }
        return numgroupDao.getNumgroupListByNumgroup(numgroup, pager);
    }

    @Override
    public void deleteNumgroup(Integer[] item) {
        numgroupDao.deleteNumgroup(item);
    }

    @Override
    public IMyBatisDao<Numgroup, Integer> getMyBatisDao() {
        return numgroupDao;
    }

    @Override
    public List<Numgroup> getAllNumgroupNoPager(Numgroup numgroup) {
        return numgroupDao.getAllNumgroupNoPager(numgroup);
    }

}
