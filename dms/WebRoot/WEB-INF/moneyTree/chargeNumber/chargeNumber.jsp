<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function searchApprentice(curPageNum){
		$('#pagenum').val(curPageNum);
		$('#apprenticeForm').action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action";
		$('#apprenticeForm').submit();
		
	}
	
	function chooseApprentice(id,apprenticeName){
	
		$("#choseName").html(apprenticeName);
	}
	
</script>
<style >
.ldPager div.skip{right:70%}
</style>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div style="margin-left:8%"><span style="color:#ffb800;font-weight:bold">上一期数</span>第 <span style="color:#ffb800;font-weight:bold">20</span> 期开奖号码：<span style="color:#f00;font-weight:bold">40</span>  <span style="margin-left:8%">下期开奖时间：<span style="color:#ffb800;font-weight:bold">2016-05-31 21:40</span></span>    <span style="margin-left:8%">剩余投注时间：<span style="color:#ffb800;font-weight:bold">0 天 00:35:12</span></span></div>
							</div>
						</div>
							
						</div>
					</div>
			</div>
				<div style="width:24%;float:left;margin-left:10px">
				<div style="margin-bottom:5px">
				<form action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action"
							  method="post">
					<input name="apprentice.apprenticeName" class="ldText" style="width:100px" id="apprentice.apprenticeName"
						value="${apprentice.apprenticeName}" />
					<input id="searchBtn" type="submit" class="ldBtnBlue" value="查询" />
					<input type="hidden" value="0" name="pager.curPageNum" />
					<input type="hidden" name="pagenum" value="3"/>
				</form>
				</div>
				<table style="border:1px solid #dadada;width:100%" cellspacing="6" cellpadding="1">
				<tr>
					<td style="font-weight:bold;">请选择下家：</td>
					<td><span id="choseName" style="color:red"></span></td>
				</tr>
				<c:forEach items="${apprenticeList }" var="item" varStatus="status">
					<tr>
						<td><input type="button" value="${ item.apprenticeName}" class="ldBtnGray" onclick="chooseApprentice(${item.id},'${item.apprenticeName}')"/></td>
						<td><input type="button" value="明细查询" class="ldBtnGray"/></td>
					</tr>
				</c:forEach>
				</table>
				<div class="toolbarR">
						<div class="ldPager">
						<form action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action"
							  method="post" name="pagerForm">
							    <input name="apprentice.apprenticeName" type="hidden"
								value="${apprentice.apprenticeName}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
			</div>
			
			<div style="width:50%;float:left;margin-left:5px;">
				<form method="post" name="deleteForm" id="deleteForm">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
						<tr>
							<td>组合</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
						</tr>
						<tr>
							<td>猴</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num01.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num13.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num25.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num37.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num49.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
						</tr>
						<tr>
							<td>羊</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num02.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num14.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num26.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num38.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>马</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num03.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num15.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num27.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num39.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>蛇</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num04.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num16.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num28.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num40.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>龙</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num05.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num17.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num29.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num41.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>兔</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num06.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num18.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num30.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num42.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>虎</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num07.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num19.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num31.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num43.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>牛</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num08.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num20.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num32.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num44.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>鼠</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num09.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num21.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num33.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num45.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>猪</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num10.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num22.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num34.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num46.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>狗</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num11.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num23.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num35.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num47.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
						<tr>
							<td>鸡</td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num12.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num24.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num36.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							<td><img title="01" src="moneyTree/images/num48.gif"/></td>
							<td><input type="text" maxlength="6" style="width:40px"/></td>
							
						</tr>
					</table>
					<div style="margin-top:15px">
						<input id="searchBtn" type="submit" class="ldBtnBlue" value="提交" />
						<input id="searchBtn" type="reset" class="ldBtnGray" value="重置" />
					</div>
					
			</div>

			<div style="width:24%;float:left;margin-left:5px">
				<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
					<tr>
						<td>吃数分析</td>
						<td>吃500</td>
						<td>吃600</td>
						<td>吃700</td>
					</tr>
					<tr>
						<td style="font-weight:bold">赚钱个数</td>
						<td>15</td>
						<td>12</td>
						<td>11</td>
					</tr>
					<tr>
						<td style="font-weight:bold">赚钱最大值/号码</td>
						<td>2345/23</td>
						<td>2345/23</td>
						<td>2345/23</td>
					</tr>
					<tr>
						<td style="font-weight:bold">亏钱最大值/号码</td>
						<td>-2345/23</td>
						<td>-2345/23</td>
						<td>-2345/23</td>
					</tr>
				</table>
				
				<table style="margin-top:8px;" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
					<tr>
						<td>组合</td>
						<td>金额</td>
					</tr>
					<tr>
						<td>单数</td>
						<td><input type="text" maxlength="6" style="width:60px"/></td>
					</tr>
					<tr>
						<td>双数</td>
						<td><input type="text" maxlength="6" style="width:60px"/></td>
					</tr>
					<tr>
						<td>红波</td>
						<td><input type="text" maxlength="6" style="width:60px"/></td>
					</tr>
					<tr>
						<td>蓝波</td>
						<td><input type="text" maxlength="6" style="width:60px"/></td>
					</tr>
					<tr>
						<td>绿波</td>
						<td><input type="text" maxlength="6" style="width:60px"/></td>
					</tr>
					<c:forEach items="${numgroupList }" var="item" varStatus="status">
						<tr>
							<td>${ item.groupName}</td>
							<td><input type="text" maxlength="6" style="width:60px"/></td>
						</tr>
					</c:forEach>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>

</html>

