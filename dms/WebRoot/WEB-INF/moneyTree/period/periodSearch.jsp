<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	
	function addItem() {
		ldDialog.openMini("${basePath}moneyJinliang/periodInsert!prepare.action",
			"新增期数", 
			function(window) {
				var returnValue = window.returnValue;
				if (returnValue == undefined) {//无返回值 直接关闭 
					return true;
				} else {//有返回值 处理一些事
					ldDialog.tips("处理成功！");
					document.pagerForm.submit();
					return true;
				}
		});
	}

	function editItem(id) {
			ldDialog.openMini(
			"${basePath}moneyJinliang/periodUpdate!prepare.action?period.id="+ id,
			"期数编辑",
			function(window) {
				var returnValue = window.returnValue;
					if (returnValue == undefined) {//无返回值 直接关闭 
						return true;
					} else {//有返回值 处理一些事
						ldDialog.tips("处理成功！");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						document.pagerForm.submit();
						return true;
					}
			});
	}

	
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="searchForm" method="post" action="${basePath}moneyJinliang/periodSearch!searchPeriodByInfo.action">
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
												<input name="period.period" class="ldText" style="width:144px" id="period.period"
													value="${period.period}" />
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
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<ld:check mark="periodInsert">
													<input type="button" class="ldBtnGray" value="新一期" onclick="addItem();" />
												</ld:check>
												
											</td>
										</tr>
									</table>
								</div>
								<div class="toolbarR">
									
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
							<th>开奖号码</th>
							<th>开奖时间</th>
							<th>操作</th>
						</tr>
						
						<c:forEach items="${periodList }" var="item" varStatus="status">
						<tr>
							<c:if test="${ item.isNow==1}">
								<td style="color:red">当前期</td>
							</c:if>
							<c:if test="${ item.isNow!=1}">
								<td><c:out value="${status.count}" /></td>
							</c:if>
							<td>${ item.period} </td>
							<c:if test="${ item.lotteryResult==''}">
								<td><span style="color:red">未设置开奖号码</span></td>
							</c:if>
							<c:if test="${ item.lotteryResult!=''}">
								<td><span style="font-weight:bold;">${ item.lotteryResult}</span></td>
							</c:if>
							<td><span style="font-weight:bold;"><f:formatDate value="${ item.lotteryTime}" pattern="yyyy-MM-dd  HH:mm" /></span></td>
							<td>
								<ld:check mark="apprenticeUpdate">
									<input type="button" value="编辑" class="ldBtnLink" onclick="editItem(${item.id});" />&nbsp;
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
						<form action="${basePath}moneyJinliang/periodSearch!searchPeriodByInfo.action"
							  method="post" name="pagerForm">
							    <input name="period.period" type="hidden"
								value="${period.period}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

