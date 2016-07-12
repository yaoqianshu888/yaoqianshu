package com.landicorp.moneytree.dao;

import java.util.List;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.moneytree.entities.UserExtra;

public interface IUserExtraDao extends IMyBatisDao<UserExtra, Integer> {
    public UserExtra getByUserId(Integer id);
    public List<UserExtra> getByFinishTime();
}
