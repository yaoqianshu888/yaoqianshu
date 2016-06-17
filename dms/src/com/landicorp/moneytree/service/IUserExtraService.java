package com.landicorp.moneytree.service;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.moneytree.entities.UserExtra;

public interface IUserExtraService extends IBaseService<UserExtra, Integer> {
    public UserExtra getByUserId(Integer userId);
}
