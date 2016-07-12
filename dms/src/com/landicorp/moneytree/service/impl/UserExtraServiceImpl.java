package com.landicorp.moneytree.service.impl;

import java.util.List;
import java.util.Map;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.IUserExtraDao;
import com.landicorp.moneytree.entities.UserExtra;
import com.landicorp.moneytree.service.IUserExtraService;

public class UserExtraServiceImpl extends AbstractBaseServiceImpl<UserExtra, Integer> implements IUserExtraService {

    private IUserExtraDao userExtraDao;
    
    public IUserExtraDao getUserExtraDao() {
        return userExtraDao;
    }

    public void setUserExtraDao(IUserExtraDao userExtraDao) {
        this.userExtraDao = userExtraDao;
    }

    @Override
    public int add(UserExtra arg0) {
        return userExtraDao.save(arg0);
    }

   

    @Override
    public UserExtra getById(Integer arg0) {
        return userExtraDao.getById(arg0);
    }

 
    @Override
    public int update(UserExtra arg0) {
        return userExtraDao.update(arg0);
    }

    @Override
    public UserExtra getByUserId(Integer userId) {
        return userExtraDao.getByUserId(userId);
    }

    @Override
    public IMyBatisDao<UserExtra, Integer> getMyBatisDao() {
        return userExtraDao;
    }

    @Override
    public List<UserExtra> getByFinishTime() {
        return userExtraDao.getByFinishTime();
    }

}
