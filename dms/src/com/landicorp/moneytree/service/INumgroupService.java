package com.landicorp.moneytree.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Numgroup;

public interface INumgroupService extends IBaseService<Numgroup, Integer> {
    public List<Numgroup> getAllNumgroup(Numgroup numgroup,Pager pager); //得到所有的群组
    
    public List<Numgroup> getNumgroupListByNumgroup(     //按条件得到群组
                    Numgroup numgroup,
                    Pager pager);
    public void deleteNumgroup(Integer[] item);   //逻辑删除群组
    public List<Numgroup> getAllNumgroupNoPager(Numgroup numgroup);//得到所有的群组不是分页
}
