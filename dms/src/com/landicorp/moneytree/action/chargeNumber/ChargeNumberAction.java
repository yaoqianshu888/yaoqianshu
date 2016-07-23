package com.landicorp.moneytree.action.chargeNumber;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;







import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.moneytree.entities.Apprentice;
import com.landicorp.moneytree.entities.History;
import com.landicorp.moneytree.entities.Numgroup;
import com.landicorp.moneytree.entities.Period;
import com.landicorp.moneytree.service.IApprenticeService;
import com.landicorp.moneytree.service.IHistoryService;
import com.landicorp.moneytree.service.INumgroupService;
import com.landicorp.moneytree.service.IPeriodService;

public class ChargeNumberAction extends BaseActionSupport {
    private Apprentice apprentice;
    private List<Apprentice> apprenticeList;
    private List<Numgroup> numgroupList;
    private INumgroupService numgroupService;
    private Period prePeriod;
    private Period nowPeriod;
    private IPeriodService periodService;
    private History history;
    private IHistoryService historyService;
    private String insertOk; //插入数据成功
    private List<List<History>> histories;
    private String conNum;
    private List<History> historyList;
    private Double total;//合计
    
    
    public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public List<History> getHistoryList() {
		return historyList;
	}

	public void setHistoryList(List<History> historyList) {
		this.historyList = historyList;
	}

	public String getConNum() {
		return conNum;
	}

	public void setConNum(String conNum) {
		this.conNum = conNum;
	}

	public List<List<History>> getHistories() {
        return histories;
    }

    public void setHistories(List<List<History>> histories) {
        this.histories = histories;
    }

    public String getInsertOk() {
        return insertOk;
    }

    public void setInsertOk(String insertOk) {
        this.insertOk = insertOk;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public IHistoryService getHistoryService() {
        return historyService;
    }

    public void setHistoryService(IHistoryService historyService) {
        this.historyService = historyService;
    }

    public Period getPrePeriod() {
        return prePeriod;
    }

    public void setPrePeriod(Period prePeriod) {
        this.prePeriod = prePeriod;
    }

    public Period getNowPeriod() {
        return nowPeriod;
    }

    public void setNowPeriod(Period nowPeriod) {
        this.nowPeriod = nowPeriod;
    }

    public IPeriodService getPeriodService() {
        return periodService;
    }

    public void setPeriodService(IPeriodService periodService) {
        this.periodService = periodService;
    }

    public List<Numgroup> getNumgroupList() {
        return numgroupList;
    }

    public void setNumgroupList(List<Numgroup> numgroupList) {
        this.numgroupList = numgroupList;
    }

    public INumgroupService getNumgroupService() {
        return numgroupService;
    }

    public void setNumgroupService(INumgroupService numgroupService) {
        this.numgroupService = numgroupService;
    }

    private IApprenticeService apprenticeService;
   

    public Apprentice getApprentice() {
        return apprentice;
    }

    public void setApprentice(Apprentice apprentice) {
        this.apprentice = apprentice;
    }

    public List<Apprentice> getApprenticeList() {
        return apprenticeList;
    }

    public void setApprenticeList(List<Apprentice> apprenticeList) {
        this.apprenticeList = apprenticeList;
    }

    public IApprenticeService getApprenticeService() {
        return apprenticeService;
    }

    public void setApprenticeService(IApprenticeService apprenticeService) {
        this.apprenticeService = apprenticeService;
    }

    public String  chargeNumber(){
        apprentice=new Apprentice();
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getAllApprentice(apprentice, getPager());
        
        Numgroup numgroup=new Numgroup();
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getAllNumgroupNoPager(numgroup);
        
        //得到上一期和当前期
        prePeriod=periodService.getPrePeriod();
        nowPeriod=periodService.getNowPeriod();
        
        return SUCCESS;
    }
    
    public String searchApprenticeByInfo(){
    	
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getApprenticeListByApprentice(apprentice, getPager());
        
        Numgroup numgroup=new Numgroup();
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getAllNumgroupNoPager(numgroup);
        
        //得到上一期和当前期
        prePeriod=periodService.getPrePeriod();
        nowPeriod=periodService.getNowPeriod();
        
        return "list";
    }
    
    public String submitNumber() throws IOException{
        HttpServletRequest request=ServletActionContext.getRequest();
        request.setCharacterEncoding("UTF-8"); 
        
        String UUid=UUID.randomUUID().toString();//生产唯一的当前点击数
        nowPeriod=new Period();
        prePeriod=periodService.getPrePeriod();
        apprentice=new Apprentice();
        apprentice.setUser(getSessionUser());
        apprenticeList=apprenticeService.getApprenticeListByApprentice(apprentice, getPager());
        Numgroup numgroup=new Numgroup();
        numgroup.setUser(getSessionUser());
        numgroupList=numgroupService.getAllNumgroupNoPager(numgroup);
        
        //存历史记录
        Map<String,String[]> map = request.getParameterMap();
        for(Entry<String, String[]> me : map.entrySet()){
            String name = me.getKey();
            String [] v = me.getValue();
            if(name.equals("apprentice.id")){
                apprentice.setId(Integer.valueOf(v[0]));
            }else if(name.equals("nowPeriod.id")){
                nowPeriod=periodService.getById(Integer.valueOf(v[0]));
            }
        }
        
        insertOk="2";//无输入数据时
        
        for(Entry<String, String[]> me : map.entrySet()){
            String name = me.getKey();
            String [] v = me.getValue();
            
            if(!v[0].equals("") && !name.equals("apprentice.id") && !name.equals("nowPeriod.id")){
               
                history=new History();
                history.setUser(getSessionUser());
                history.setPeriod(nowPeriod);
                history.setApprentice(apprentice);
                history.setChargeNumber(v[0]);
                Numgroup numgroup1=new Numgroup();
                numgroup1.setId(Integer.valueOf(name));
                history.setNumgroup(numgroup1);
                history.setCreateTime(new Date());
                history.setLastModifyTime(new Date());
                history.setClickNo(UUid);
                historyService.add(history);
                
                insertOk="1";  //提交成功
            }
            
        }
        
        return SUCCESS;
    }
    
    public String showDetail(){
        nowPeriod=periodService.getNowPeriod();
        history=new History();
        history.setApprentice(apprentice);
        history.setPeriod(nowPeriod);
        historyList=historyService.getAllHistoryByApIdAndPeId(history);
        histories=new ArrayList<List<History>>();
        
        if(historyList.size()>0){
            History temHistory=historyList.get(0);   //临时存放进行对比
            List<History> histories2=new ArrayList<History>();  //存放每组相同点击号
            for(int i=0;i<historyList.size();i++){
                if(temHistory.getClickNo().equals(historyList.get(i).getClickNo())){
                    Numgroup tempNumgroup=numgroupService.getById(historyList.get(i).getNumgroup().getId());  //得到群组信息
                    historyList.get(i).setNumgroup(tempNumgroup);
                    histories2.add(historyList.get(i));
                }else{
                    histories.add(histories2);
                    temHistory=historyList.get(i);
                    histories2=new ArrayList<History>();
                    
                    Numgroup tempNumgroup=numgroupService.getById(historyList.get(i).getNumgroup().getId());  //得到群组信息
                    historyList.get(i).setNumgroup(tempNumgroup);
                    histories2.add(historyList.get(i));
                }
                
                if(i==historyList.size()-1){   //当为最后一个数时，直接添加
                    histories.add(histories2);
                }
            }
        }
        
        return "detail";
    }
    
    public String confirmNum(){
    	//System.out.println(conNum);
    	total=0.0;
    	if(!conNum.equals("")){
	    	String[] str=conNum.split(",");
	        Numgroup numgroup=new Numgroup();
	        historyList=new ArrayList<History>();
	        
	        for(int i=0;i<str.length;i++){
	        	History history=new History();
	        	numgroup=numgroupService.getById(Integer.valueOf(str[i].split(":")[0]));
	        	history.setNumgroup(numgroup);
	        	history.setChargeNumber(str[i].split(":")[1]);
	        	historyList.add(history);
	        	total+=Double.valueOf(str[i].split(":")[1]);
	        }
    	
    	Collections.sort(historyList, new Comparator<History>() {
			public int compare(History arg0, History arg1) {
				int hits0 = arg0.getNumgroup().getId();
				int hits1 = arg1.getNumgroup().getId();
				if (hits1 > hits0) {
					return -1;
				} else if (hits1 == hits0) {
					return 0;
				} else {
					return 1;
				}
			}
		});
    	}
    	return "confirm";
    }
}
