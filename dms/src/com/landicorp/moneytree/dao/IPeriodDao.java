package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Period;

public interface IPeriodDao extends IMyBatisDao<Period, Integer> {
    public List<Period> getAllPeriod( @Param("period") Period period,@Param("pager") Pager pager);

    public Integer getAllPeriodCount( @Param("period") Period period);    
    
    public List<Period> getPeriodListByPeriod(     
            @Param("period") Period period,
            @Param("pager") Pager pager);
        
    public int getPeriodCountByPeriod(@Param("period") Period period); 
    public void setPrePreiod();  //将当前期设置为上一期
    public void setHisPreiod();  //将上一期设置为历史期数
    public List<Period> getPrePeriod(); //得到上一期
    public List<Period> getNowPeriod(); //得到当前期
}
