package com.landicorp.moneytree.action.analysis;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.User;
import com.landicorp.moneytree.entities.AnalysisRecord;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.ChargeRecord;
import com.landicorp.moneytree.entities.Eat;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.entities.UserExtra;
import com.landicorp.moneytree.service.IAnalysisService;
import com.landicorp.moneytree.service.IApprenticeService;
import com.landicorp.moneytree.service.IEatService;
import com.landicorp.moneytree.service.IPeriodService;
import com.landicorp.moneytree.service.IUserExtraService;

public class AnalysisSearchAction extends BaseActionSupport {
	private ChargeRecord chargeRecord;
	private List<ChargeRecord> chargeRecordList;
	private IAnalysisService analysisService;

	private Period nowPeriod;
	private Period prePeriod;
	private IPeriodService periodService;

	private IApprenticeService apprenticeService;

	/**
	 * 用户其他参数
	 */
	private UserExtra userExtra;
	private IUserExtraService userExtraService;

	/**
	 * 用户常用吃数
	 */
	private List<Eat> eatList;
	private IEatService eatService;

	/**
	 * 总的收数情况，每个号码分别购买了多少
	 */

	private int[] totalCharge;
	/**
	 * 上报数的统计情况，每个号码上报多少
	 */
	private int[] reportedCharge;

	/**
	 * 假设每个号码为中奖号码时的英葵情况
	 */
	private List<ChargeRecord> profitSituation;

	/**
	 * 吃数的金额
	 */
	private int eatValue;
	/**
	 * 英葵情况记录
	 */
	private List<AnalysisRecord> analysisRecordList;

	public ChargeRecord getChargeRecord() {
		return chargeRecord;
	}

	public void setChargeRecord(ChargeRecord chargeRecord) {
		this.chargeRecord = chargeRecord;
	}

	public List<ChargeRecord> getChargeRecordList() {
		return chargeRecordList;
	}

	public void setChargeRecordList(List<ChargeRecord> chargeRecordList) {
		this.chargeRecordList = chargeRecordList;
	}

	public IAnalysisService getAnalysisService() {
		return analysisService;
	}

	public void setAnalysisService(IAnalysisService analysisService) {
		this.analysisService = analysisService;
	}

	public Period getNowPeriod() {
		return nowPeriod;
	}

	public void setNowPeriod(Period nowPeriod) {
		this.nowPeriod = nowPeriod;
	}

	public Period getPrePeriod() {
		return prePeriod;
	}

	public void setPrePeriod(Period prePeriod) {
		this.prePeriod = prePeriod;
	}

	public IPeriodService getPeriodService() {
		return periodService;
	}

	public void setPeriodService(IPeriodService periodService) {
		this.periodService = periodService;
	}

	public IApprenticeService getApprenticeService() {
		return apprenticeService;
	}

	public void setApprenticeService(IApprenticeService apprenticeService) {
		this.apprenticeService = apprenticeService;
	}

	public int[] getTotalCharge() {
		return totalCharge;
	}

	public void setTotalCharge(int[] totalCharge) {
		this.totalCharge = totalCharge;
	}

	public int[] getReportedCharge() {
		return reportedCharge;
	}

	public void setReportedCharge(int[] reportedCharge) {
		this.reportedCharge = reportedCharge;
	}

	public List<ChargeRecord> getProfitSituation() {
		return profitSituation;
	}

	public void setProfitSituation(List<ChargeRecord> profitSituation) {
		this.profitSituation = profitSituation;
	}

	public int getEatValue() {
		return eatValue;
	}

	public void setEatValue(int eatValue) {
		this.eatValue = eatValue;
	}

	public UserExtra getUserExtra() {
		return userExtra;
	}

	public void setUserExtra(UserExtra userExtra) {
		this.userExtra = userExtra;
	}

	public IUserExtraService getUserExtraService() {
		return userExtraService;
	}

	public void setUserExtraService(IUserExtraService userExtraService) {
		this.userExtraService = userExtraService;
	}

	public List<Eat> getEatList() {
		return eatList;
	}

	public void setEatList(List<Eat> eatList) {
		this.eatList = eatList;
	}

	public IEatService getEatService() {
		return eatService;
	}

	public void setEatService(IEatService eatService) {
		this.eatService = eatService;
	}

	public List<AnalysisRecord> getAnalysisRecordList() {
		return analysisRecordList;
	}

	public void setAnalysisRecordList(List<AnalysisRecord> analysisRecordList) {
		this.analysisRecordList = analysisRecordList;
	}

	public String getAnalysis() throws IOException {

		nowPeriod = new Period();
		prePeriod = new Period();
		//得到上一期和当前期
        prePeriod=periodService.getPrePeriod();
        nowPeriod=periodService.getNowPeriod();

		chargeRecord = new ChargeRecord();
		chargeRecordList = new ArrayList<ChargeRecord>();
		analysisRecordList = new ArrayList<AnalysisRecord>();

		// 获取用户常用吃数、吃数限制等参数
		getUserExtraInfo();

		// 获取用户输入想要分析的吃数值，并加入到eatList的末尾
		getUserInputEatValue();

		// 总统计，总体收数情况
		analysisTotal();

		for (int i = 0; i < eatList.size(); i++) {
			// 根据吃数值，进行上报数统计
			analysisReported(eatList.get(i).getEatValue());

			// 假设每个号码为中奖号码时的英葵情况，计算，存储结果
			profitSituation = new ArrayList<ChargeRecord>();

			for (int j = 0; j < 49; j++) {
				ChargeRecord tempRecord = new ChargeRecord();

				tempRecord.setChargeNumber((j + 1) + "");
				tempRecord.setChargeMoney(calculateMoney(j + 1) + "");
				profitSituation.add(tempRecord);
			}

			Comparator<ChargeRecord> comparator = new Comparator<ChargeRecord>() {
				public int compare(ChargeRecord s1, ChargeRecord s2) {
					int num1 = Integer.valueOf(s1.getChargeMoney());
					int num2 = Integer.valueOf(s2.getChargeMoney());

					// 先排年龄
					if (num1 != num2) {
						return num1 - num2;
					} else {
						return Integer.valueOf(s1.getChargeNumber()) - Integer.valueOf(s2.getChargeNumber());
					}
				}
			};
			Collections.sort(profitSituation, comparator);

			calculateAnalysis();
		}

		return SUCCESS;
	}

	private void getUserInputEatValue() {
		// 吃数的值
		eatValue = 0;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 获取参数
		Map<String, String[]> map = request.getParameterMap();
		for (Entry<String, String[]> me : map.entrySet()) {
			String name = me.getKey();
			String[] v = me.getValue();
			if (name.equals("eatValue")) {
				if (!v[0].equals("") && v[0] != null) {

					eatValue = Integer.valueOf(v[0]);
				}
			}
		}

		// 检测该用户吃数数值的权限
		if (!checkEatCompetence(eatValue)) {
			// 如果不具备权限，进行提示
			eatValue = 0;
		}
		// 将用户输入的分析值加入到吃数值list中
		Eat eat = new Eat();
		eat.setEatValue(eatValue);
		eatList.add(eat);
	}

	/**
	 * 获取用户的吃数上限，常用吃数
	 */
	private void getUserExtraInfo() {
		User user = new User();
		user = getSessionUser();
		userExtra = userExtraService.getByUserId(user.getId());
		Eat eat = new Eat();
		eat.setUser(getSessionUser());
		// TODO 默认吃数值 取出一页，10条记录
		eatList = eatService.getEatListByEat(eat, getPager());

	}

	/**
	 * 计算英葵情况
	 */
	private void calculateAnalysis() {
		AnalysisRecord analysisRecord = new AnalysisRecord(0, 0, 0, 0, 0, 0, 0);
		analysisRecord.setLoseMaxValue(Integer.valueOf(profitSituation.get(0).getChargeMoney()));
		analysisRecord.setLoseMaxNum(Integer.valueOf(profitSituation.get(0).getChargeNumber()));
		analysisRecord.setWinMaxValue(Integer.valueOf(profitSituation.get(48).getChargeMoney()));
		analysisRecord.setWinMaxNum(Integer.valueOf(profitSituation.get(48).getChargeNumber()));

		for (ChargeRecord chargeRecord : profitSituation) {
			int tempMoney = Integer.valueOf(chargeRecord.getChargeMoney());
			if (tempMoney > 0) {
				// 赚钱个数增加1
				analysisRecord.setWinCount(analysisRecord.getWinCount() + 1);
			} else {
				// 亏钱个数增加1
				analysisRecord.setLoseCount(analysisRecord.getLoseCount() + 1);
			}
		}
		float tempProbabibity = (analysisRecord.getWinCount() / 49.0f) * 100;
		BigDecimal bd = new BigDecimal((double) tempProbabibity);
		bd = bd.setScale(2, 4);
		tempProbabibity = bd.floatValue();
		analysisRecord.setWinProbability(tempProbabibity);
		analysisRecordList.add(analysisRecord);
	}

	/**
	 * 总统计，总体收数情况
	 */
	private void analysisTotal() {
		User user = getSessionUser();

		try {
			// 获取当前期所有收数记录
			chargeRecordList = analysisService.getPeriodChargeRecord(user.getId(), Integer.valueOf(nowPeriod.getId()));
		} catch (NullPointerException e) {

			e.printStackTrace();
		}

		totalCharge = new int[49];

		for (ChargeRecord chargeRecord : chargeRecordList) {
			int money = Integer.valueOf(chargeRecord.getChargeMoney());
			String[] temp = chargeRecord.getChargeNumber().split(",");

			for (int i = 0; i < temp.length; i++) {
				int tempIndex = Integer.valueOf(temp[i]);
				totalCharge[tempIndex - 1] += money / temp.length;
			}

		}
	}

	/**
	 * 根据吃数值，分析上报情况
	 * 
	 * @throws IOException
	 */
	private void analysisReported(Integer eatValue) throws IOException {
		reportedCharge = new int[49];

		// 计算上报情况
		for (int i = 0; i < totalCharge.length; i++) {
			if (totalCharge[i] > eatValue) {
				// 超过吃数金额上报
				reportedCharge[i] = totalCharge[i] - eatValue;
			} else {
				reportedCharge[i] = 0;
			}

		}

	}

	/**
	 * 根据开奖结果号码，计算英葵
	 * 
	 * @param resultNum
	 *            开奖结果号码
	 * @return
	 */
	public int calculateMoney(int resultNum) {
		// 上报英葵
		int reportedMoney = 0;
		// 总的收数数
		int totalChargeMoney = 0;
		// 下家英葵
		int apprenticeMoney = 0;

		reportedMoney = calculateReportedMoney(resultNum);

		// 计算总的收数
		for (int i : totalCharge) {
			totalChargeMoney += i;
		}

		apprenticeMoney = calculateAllApprenticeMoney(resultNum);

		// 上报结算金额+总的收数-下家结算金额
		return reportedMoney + totalChargeMoney - apprenticeMoney;
	}

	/**
	 * 计算上报英葵
	 * 
	 * @param resultNum
	 */
	private int calculateReportedMoney(int resultNum) {
		int totalReportedMoney = 0;
		for (int tempReported : reportedCharge) {
			totalReportedMoney += tempReported;
		}

		// 开奖号码上报金额*倍数+上报总金额*返点-上报总金额
		return reportedCharge[resultNum - 1] * Integer.valueOf(userExtra.getTimes())
				+ totalReportedMoney * Integer.valueOf(userExtra.getRebate()) - totalReportedMoney;
	}

	/**
	 * 计算应给所有下家金额
	 * 
	 * @param resultNum
	 * @return
	 */
	private int calculateAllApprenticeMoney(int resultNum) {
		int result = 0;

		// 获得本期有购买的所有下家
		Set<Integer> allApprenticeId = new HashSet<Integer>();

		for (ChargeRecord chargeRecord : chargeRecordList) {
			allApprenticeId.add(chargeRecord.getApprenticeId());
		}

		// 计算出应给每个下家的金额,并计算总金额
		for (Integer itemId : allApprenticeId) {

			result += calculateOneApprenticeMoney(itemId, resultNum);
		}

		return result;
	}

	private int calculateOneApprenticeMoney(int apprenticeId, int resultNum) {
		// 中奖金额
		int timesResult = 0;
		// 返点金额
		int rebateResult = 0;

		// 根据下家id获取下家信息
		Apprentice apprentice = new Apprentice();
		apprentice = apprenticeService.getById(apprenticeId);

		// 获取某个下家的本期收数情况
		List<ChargeRecord> oneApprenticeChargeList = new ArrayList<ChargeRecord>();

		oneApprenticeChargeList = analysisService.getApprenticeChargeRecord(getSessionUser().getId(),
				Integer.valueOf(nowPeriod.getId()), apprenticeId);

		// 遍历一个下家本期所有的购买记录
		for (ChargeRecord chargeRecord : oneApprenticeChargeList) {
			// 一个记录的所有号码
			String[] tempCharge = chargeRecord.getChargeNumber().split(",");
			// itemChargeMoney是一个号码的购买金额，chargeRecord.getChargeMoney()是一个群组的金额
			int itemChargeMoney = Integer.valueOf(chargeRecord.getChargeMoney()) / tempCharge.length;

			// 统计返点金额。无论是否中奖均有返点
			if (chargeRecord.getGroupId() >= 50 && chargeRecord.getGroupId() <= 61) {
				// 如果是生肖,用生肖的返点

				rebateResult += Integer.valueOf(chargeRecord.getChargeMoney())
						* Integer.valueOf(apprentice.getZodiacRebate()) * 0.01;
			} else {
				// 如果是字,用字的返点

				rebateResult += Integer.valueOf(chargeRecord.getChargeMoney())
						* Integer.valueOf(apprentice.getWordRebate()) * 0.01;
			}

			// 统计中奖金额。遍历一组记录中的号码是否中奖
			for (String tempChargeItem : tempCharge) {
				if (tempChargeItem.equals(resultNum + "")) {
					if (chargeRecord.getGroupId() >= 50 && chargeRecord.getGroupId() <= 61) {
						// 如果是生肖,用生肖的倍数
						timesResult += itemChargeMoney * Integer.valueOf(apprentice.getZodiacTimes());
					} else {
						// 如果是字,用字的倍数
						timesResult += itemChargeMoney * Integer.valueOf(apprentice.getWordTimes());
					}
				}
			}

		}
		// 给下家的金额=中奖金额+返点金额
		return timesResult + rebateResult;
	}

	/**
	 * 检查用户是否具有该吃数的权限
	 * 
	 * @param eatValue
	 * @return
	 */
	private boolean checkEatCompetence(int eatValue) {
		if (Integer.valueOf(userExtra.getNumLimit()) >= eatValue) {
			// 用户具有该吃数的权限
			return true;
		}
		return false;
	}

}
