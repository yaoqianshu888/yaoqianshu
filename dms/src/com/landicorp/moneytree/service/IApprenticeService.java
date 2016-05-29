package com.landicorp.moneytree.service;

import java.util.List;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Apprentice;

public interface IApprenticeService extends IBaseService<Apprentice, Integer> {
    public List<Apprentice> getAllApprentice(Apprentice apprentice,Pager pager); //得到所有的下家
    
    public List<Apprentice> getApprenticeListByApprentice(     //按条件得到下家
             Apprentice apprentice,
             Pager pager);
}
