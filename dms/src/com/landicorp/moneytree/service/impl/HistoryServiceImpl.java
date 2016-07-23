package com.landicorp.moneytree.service.impl;

import java.util.List;
import java.util.Map;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.IHistoryDao;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.service.IHistoryService;

public class HistoryServiceImpl extends AbstractBaseServiceImpl<History, Integer> implements IHistoryService {
    private IHistoryDao historyDao;
    
    public IHistoryDao getHistoryDao() {
        return historyDao;
    }

    public void setHistoryDao(IHistoryDao historyDao) {
        this.historyDao = historyDao;
    }

    @Override
    public int add(History arg0) {
        return historyDao.save(arg0);
    }

    @Override
    public void delete(Integer[] arg0) {
        historyDao.delete(arg0);
    }

  

    @Override
    public History getById(Integer arg0) {
        return historyDao.getById(arg0);
    }

    @Override
    public int update(History arg0) {
        return historyDao.update(arg0);
    }

    @Override
    public List<History> getAllHistory(History history, Pager pager) {
        if (pager != null) {
            pager.setTotalCount(historyDao.getAllHistoryCount(history));
        }
        return historyDao.getAllHistory(history, pager);
    }

    @Override
    public List<History> getHistoryListByHistory(History history, Pager pager) {
        if (pager != null) {
            pager.setTotalCount(historyDao.getHistoryCountByHistory(history));
        }
        return historyDao.getHistoryListByHistory(history, pager);
    }

    @Override
    public IMyBatisDao<History, Integer> getMyBatisDao() {
        return historyDao;
    }

    @Override
    public List<History> getAllHistoryByApIdAndPeId(History history) {
        return historyDao.getAllHistoryByApIdAndPeId(history);
    }

    @Override
    public List<History> getAllHistoryByClickNo(History history) {
        return historyDao.getAllHistoryByClickNo(history);
    }

    @Override
    public void deleteByClickNo(String[] item) {
        historyDao.deleteByClickNo(item);
    }


   
}
