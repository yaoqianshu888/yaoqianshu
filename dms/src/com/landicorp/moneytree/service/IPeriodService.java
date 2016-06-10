package com.landicorp.moneytree.service;

import java.util.List;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Period;

public interface IPeriodService extends IBaseService<Period, Integer> {
    public List<Period> getAllPeriod(Period period,Pager pager); 
    
    public List<Period> getPeriodListByPeriod(     
                    Period period,
                    Pager pager);
    public void setPrePreiod();  //将当前期设置为上一期
    public void setHisPreiod();  //将上一期设置为历史期数
    public Period getPrePeriod(); //得到上一期
    public Period getNowPeriod(); //得到当前期
}
