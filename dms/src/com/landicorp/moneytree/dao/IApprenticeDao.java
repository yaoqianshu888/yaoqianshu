package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Apprentice;

public interface IApprenticeDao extends IMyBatisDao<Apprentice, Integer> {
    public List<Apprentice> getAllApprentice( @Param("apprentice") Apprentice apprentice,@Param("pager") Pager pager); //得到所有的下家

    public Integer getAllApprenticeCount( @Param("apprentice") Apprentice apprentice);     //得到所有的下家数
    
    public List<Apprentice> getApprenticeListByApprentice(     //按条件得到下家
            @Param("apprentice") Apprentice apprentice,
            @Param("pager") Pager pager);
        
    public int getApprenticeCountByApprentice(@Param("apprentice") Apprentice apprentice);  //按条件得到下家数
}
