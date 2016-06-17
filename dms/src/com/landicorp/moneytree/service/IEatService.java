package com.landicorp.moneytree.service;

import java.util.List;

import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.entities.Eat;

public interface IEatService extends IBaseService<Eat, Integer> {
    public List<Eat> getAllEat(Eat eat,Pager pager); //得到所有的吃数值
    
    public List<Eat> getEatListByEat(     //按条件得到吃数值
			Eat eat,
             Pager pager);
    public void deleteEat(Integer[] item);   //逻辑删除吃数值
}
