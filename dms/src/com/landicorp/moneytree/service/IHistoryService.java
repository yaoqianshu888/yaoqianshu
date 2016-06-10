package com.landicorp.moneytree.service;

import java.util.List;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.History;

public interface IHistoryService extends IBaseService<History, Integer> {
    public List<History> getAllHistory(History history,Pager pager); 
    
    public List<History> getHistoryListByHistory(     
                    History history,
                    Pager pager);
}
