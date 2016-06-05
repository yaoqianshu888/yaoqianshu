package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Numgroup;

public interface INumgroupDao extends IMyBatisDao<Numgroup, Integer> {
    public List<Numgroup> getAllNumgroup( @Param("numgroup") Numgroup numgroup,@Param("pager") Pager pager); //得到所有的群组

    public Integer getAllNumgroupCount( @Param("numgroup") Numgroup numgroup);     //得到所有的群组数
    
    public List<Numgroup> getNumgroupListByNumgroup(     //按条件得到群组
            @Param("numgroup") Numgroup numgroup,
            @Param("pager") Pager pager);
        
    public int getNumgroupCountByNumgroup(@Param("numgroup") Numgroup numgroup);  //按条件得到群组数
    public void deleteNumgroup(Integer[] item);   //逻辑删除群组
    public List<Numgroup> getAllNumgroupNoPager(@Param("numgroup") Numgroup numgroup);//得到所有的群组不是分页
}
