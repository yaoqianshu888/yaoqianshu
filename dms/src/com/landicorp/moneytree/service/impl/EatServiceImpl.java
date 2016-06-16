package com.landicorp.moneytree.service.impl;

import java.util.List;

import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;
import com.landicorp.moneytree.dao.IEatDao;
import com.landicorp.moneytree.entities.Eat;
import com.landicorp.moneytree.service.IEatService;

public class EatServiceImpl extends AbstractBaseServiceImpl<Eat, Integer> implements IEatService {

	private IEatDao eatDao;

	public IEatDao getEatDao() {
		return eatDao;
	}

	public void setEatDao(IEatDao eatDao) {
		this.eatDao = eatDao;
	}

	@Override
	public int add(Eat arg0) {
		return eatDao.save(arg0);
	}

	@Override
	public void delete(Integer[] arg0) {
		eatDao.delete(arg0);
	}

	@Override
	public Eat getById(Integer arg0) {
		return eatDao.getById(arg0);
	}

	@Override
	public int update(Eat arg0) {
		return eatDao.update(arg0);
	}

	@Override
	public List<Eat> getAllEat(Eat eat, Pager pager) {
		if (pager != null) {
			pager.setTotalCount(eatDao.getAllEatCount(eat));
		}
		return eatDao.getAllEat(eat, pager);
	}

	@Override
	public List<Eat> getEatListByEat(Eat eat, Pager pager) {
		if (pager != null) {
			pager.setTotalCount(eatDao.getEatCountByEat(eat));
		}
		return eatDao.getEatListByEat(eat, pager);
	}

	@Override
	public IMyBatisDao<Eat, Integer> getMyBatisDao() {
		return eatDao;
	}

	@Override
	public void deleteEat(Integer[] item) {
		eatDao.deleteEat(item);
	}

}
