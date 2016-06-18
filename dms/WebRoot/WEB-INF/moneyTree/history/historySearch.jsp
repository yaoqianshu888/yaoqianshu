<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <%@include file="/headDeclare.jsp"%>
    <script type="text/javascript">
        function showItem(id) {
            ldDialog.openMini(
                    "${basePath}moneyJinliang/chargeDetail!detail.action?history.clickNo=" + id,
                    "收数详情",
                    function (window) {
                    });
        }
        function editItem(id) {
            ldDialog.openMini(
                    "${basePath}moneyJinliang/chargeUpdate!prepare.action?history.clickNo=" + id,
                    "修改收数",
                    function (window) {
                        var returnValue = window.returnValue;
                        if (returnValue == undefined) {//无返回值 直接关闭
                            return true;
                        } else {//有返回值 处理一些事
                            ldDialog.tips("处理成功！");
                            var curPageNum = $("input[name='pager.curPageNum']").val();
                            document.deleteForm.submit();
                            return true;
                        }
                    });
        }
        
      //倒计时
    	function GetRTime(){
    		var lotteryTime='${ nowPeriod.lotteryTime.year+1900}'+'/'+'${ nowPeriod.lotteryTime.month+1}'+'/'+'${ nowPeriod.lotteryTime.date}'+' '+'${ nowPeriod.lotteryTime.hours}'+':'+'${ nowPeriod.lotteryTime.minutes}'+':'+'${ nowPeriod.lotteryTime.seconds}';
    	    var EndTime= new Date(lotteryTime);
    	    var NowTime = new Date();
    	    var t =EndTime.getTime() - NowTime.getTime();
    	    var d=0;
    	    var h=0;
    	    var m=0;
    	    var s=0;
    	    if(t>=0){
    	      d=Math.floor(t/1000/60/60/24);
    	      h=Math.floor(t/1000/60/60%24);
    	      m=Math.floor(t/1000/60%60);
    	      s=Math.floor(t/1000%60);
    	    }
    	    document.getElementById("day").innerHTML = d;
    	    document.getElementById("hour").innerHTML = h;
    	    document.getElementById("min").innerHTML = m;
    	    document.getElementById("sec").innerHTML = s;
    	  }
      	setInterval(GetRTime,0);
    </script>
</head>
<body>
<div id="rightcontent">
    <div id="rightcontent1">
    <div class="yhlist">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div style="margin-left:8%"><span style="color:#ffb800;font-weight:bold">上一期:</span>第 <span style="color:#ffb800;font-weight:bold">${prePeriod.period }</span> 期开奖号码：<span style="color:#ffb800;font-weight:bold">${prePeriod.lotteryResult }</span>  <span style="margin-left:8%">下期：<span style="color:#ffb800;font-weight:bold;color:red;margin-right:8%;font-size:22px">${nowPeriod.period } </span>开奖时间：<span style="color:#ffb800;font-weight:bold"><f:formatDate value="${ nowPeriod.lotteryTime}" pattern="yyyy-MM-dd  HH:mm" /></span></span>    <span style="margin-left:8%">剩余投注时间：<span style="color:#ffb800;font-weight:bold"><span id="day">0</span> 天  <span id="hour">00</span>:<span id="min">00</span>:<span id="sec">00</span></span></span></div>
							</div>
						</div>
							
						</div>
					</div>
        <div class="yhlist">
            <form id="searchForm" method="post" action="${basePath}moneyXuyu/historySearch!getHistoryByHistory.action">
                <div class="conditionsbox">
                    <div id="conditionsbox">
                        <div class="yhlist1">
                            <div class="yhlist1L">查询条件</div>
                        </div>
                        <div class="yhlist2">
                            <div class="conditionsrow">
                                <div class="conditionsitem">
                                    <div class="conditionsitemL">期数：</div>
                                    <div class="conditionsitemR">
                                        <input name="history.period.period" class="ldText" style="width:144px" id="history.period.period"
                                               value="${history.period.period}" />
                                    </div>
                                </div>
                                <div class="conditionsitem">
                                    <div class="conditionsitemL">下家名称：</div>
                                    <div class="conditionsitemR">
                                        <input name="history.apprentice.apprenticeName" class="ldText" style="width: 144px" id="apprenticeName" value="" />
                                    </div>
                                </div>
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <input id="searchBtn" type="submit" class="ldBtnBlue" value="查询" />
                                            <input type="hidden" value="0" name="pager.curPageNum" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <div class="yhlist2">
            <form method="post" name="deleteForm" id="deleteForm">
                <table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
                    <tr>
                        <th>序号</th>
                        <th>期数</th>
                        <th>下家名称</th>
                        <th>收数情况</th>
                        <th>创建时间</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${histories }" var="item" varStatus="status">
                        <tr>
                            <td><c:out value="${status.count}" /></td>
                            <td>${item[0].period.period}</td>
                            <td>${item[0].apprentice.apprenticeName}</td>
                            <td><c:forEach items="${item }" var="itemInner" varStatus="status1">
                                ${ itemInner.numgroup.groupName}--><span style="color: red">${ itemInner.chargeNumber}元</span><br/>
                            </c:forEach>
                            </td>
                            <td>
								<span style="font-weight: bold;">
									<f:formatDate value="${item[0].createTime}" pattern="yyyy-MM-dd  HH:mm:ss" />
								</span>
                            </td>
                            <td>
								<span style="font-weight: bold;">
									<f:formatDate value="${ item[0].lastModifyTime}" pattern="yyyy-MM-dd  HH:mm:ss" />
								</span>
                            </td>
                            <td>
                                <ld:check mark="apprenticeDetail">
                                    <input type="button" value="收数详情" class="ldBtnLink" onclick="showItem('${ item[0].clickNo}');" />&nbsp;
                                </ld:check>
                                <ld:check mark="apprenticeUpdate">
                                    <input type="button" value="编辑" class="ldBtnLink" onclick="editItem('${ item[0].clickNo}');" />&nbsp;
                                </ld:check>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>


        <div class="yhlist3">
            <div class="toolbarL">
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>

                    </tr>
                </table>
            </div>
            <div class="toolbarR">
                <div class="ldPager">
                    <form action="${basePath}moneyXuyu/historySearch!getHistoryByHistory.action"
                          method="post" name="pagerForm">
                        <input name="history.period.period" class="ldText" style="width:144px" id="history.period.period"
                                               value="${history.period.period}" type="hidden"/>
                        <ld:pager type="form" action="pagerForm" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>

