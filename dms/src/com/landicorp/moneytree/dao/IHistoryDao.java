package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.History;

public interface IHistoryDao extends IMyBatisDao<History, Integer> {
    public List<History> getAllHistory( @Param("history") History history,@Param("pager") Pager pager);

    public Integer getAllHistoryCount( @Param("history") History history);    
    
    public List<History> getHistoryListByHistory(     
            @Param("history") History history,
            @Param("pager") Pager pager);
        
    public int getHistoryCountByHistory(@Param("history") History history); 
    public List<History> getAllHistoryByApIdAndPeId(@Param("history") History history); 
    public List<History> getAllHistoryByClickNo(@Param("history") History history); 
    public void deleteByClickNo(String[] item);  //根据当前点击号删除历史记录
}
