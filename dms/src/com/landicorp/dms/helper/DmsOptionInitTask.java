package com.landicorp.dms.helper;

import com.landicorp.core.helper.sysinit.ISysInitTask;
import com.landicorp.core.web.option.Constants;
import com.landicorp.core.web.option.OptionHelper;
import com.landicorp.core.web.option.OptionInitHelper;
import org.apache.log4j.Logger;
import org.dom4j.DocumentException;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import java.util.Map;

public class DmsOptionInitTask implements ISysInitTask {

	private static final String OPTION_CONFIG_FILE = "/com/landicorp/config/optionHelper-dms.xml";
	private static final Logger logger = Logger.getLogger(DmsOptionInitTask.class);

	@SuppressWarnings("unchecked")
	@Override
	public int onSysInit(ServletContext ctx, WebApplicationContext springContext) {
		logger.info("初始化DMS选项");
		OptionHelper oh = OptionHelper.getInstance();
		OptionInitHelper optionInitHelper = OptionInitHelper.getInstance();
		try {
			Map<String, Map<String, Integer>> optionMap = optionInitHelper.initHelper(oh, OPTION_CONFIG_FILE);
			Map<String, Map<String, Integer>> oriOptionMap = (Map<String, Map<String, Integer>>) ctx
					.getAttribute("options");
			optionMap.putAll(oriOptionMap);
			ctx.setAttribute("options", optionMap);
		} catch (DocumentException e) {
			e.printStackTrace();
			return Constants.FAIL;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return Constants.FAIL;
		}
		ctx.setAttribute("OptionHelper", oh);
		logger.info("初始化DMS选项结束");
		return Constants.SUCCESS;
	}

	@Override
	public void onSysDestroy(ServletContext ctx, WebApplicationContext springContext) {

	}
}
