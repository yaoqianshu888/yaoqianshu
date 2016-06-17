package com.landicorp.moneytree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Eat;

public interface IEatDao extends IMyBatisDao<Eat, Integer> {
    public List<Eat> getAllEat( @Param("eat") Eat eat,@Param("pager") Pager pager); //得到所有的吃数值

    public Integer getAllEatCount( @Param("eat") Eat eat);     //得到所有的吃数值数
    
    public List<Eat> getEatListByEat(     //按条件得到吃数值
            @Param("eat") Eat eat,
            @Param("pager") Pager pager);
        
    public int getEatCountByEat(@Param("eat") Eat eat);  //按条件得到吃数值数
    public void deleteEat(Integer[] item);   //逻辑删除吃数值
}
