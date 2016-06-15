<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	
	
	function showItem(id) {
		ldDialog.openMini(
			"${basePath}moneyXuyu/historySearch!detail.action?history.id=" + id,
			"下家详情", 
			function(window) {
		});
	}
	function addItem() {
		ldDialog.openMini("${basePath}moneyXuyu/historyInsert!prepare.action",
			"新增下家", 
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
			"${basePath}moneyXuyu/historyUpdate!prepare.action?history.id="+ id,
			"下家编辑",
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
	
	function deleteItems() {
		var dms = getAllChose("delete");
		if (dms == "") {
			ldDialog.alert("请先选择要删除的项");
			return;
		}
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除这些项吗？", function() {
			var url = "${basePath}moneyXuyu/historyDelete!deleteApprentice.action?" + param;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(res) {
					if (res[0].code == 1) {
						ldDialog.tips("处理完成");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						document.pagerForm.submit();
					} else {
						ldDialog.alert(res[0].reason);
					}
				},
				error : function() {
					
				}
			});
		});
	}
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="searchForm" method="post" action="${basePath}moneyXuyu/historySearch!searchApprenticeByInfo.action">
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
												<input name="history.historyName" class="ldText" style="width:144px" id="history.historyName"
													value="${history.historyName}" />
											</div>
										</div>
										<div class="conditionsitem">
											<div class="conditionsitemL">下家名称：</div>
											<div class="conditionsitemR">
												<input name="history.historyName" class="ldText" style="width:144px" id="history.historyName"
													value="${history.historyName}" />
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
												<ld:check mark="historyInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
												</ld:check>
												<ld:check mark="historyDelete">
													<input type="button" value="删除" class="ldBtnGray"
													onclick="deleteItems();" /></ld:check>
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
							<th>选择</th>
							<th>序号</th>
							<th>期数</th>
							<th>下家名称</th>
							<th>号码</th>
							<th>价格</th>
							<th>操作</th>
						</tr>
						
						<c:forEach items="${historyList }" var="item" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="delete" id="delete" value="${item.id}" />			
							</td>
							<td><c:out value="${status.count}" /></td>
							<td>${ item.period.period} </td>
							<td><span style="font-weight:bold;">${ item.apprentice.apprenticeName}</span></td>
							<td><span style="font-weight:bold;">${ item.numgroup.groupNum}</span></td>
							<td><span style="font-weight:bold;">${ item.chargeNumber}</span></td>
							<td>
								<ld:check mark="historyDetail">
									<input type="button" value="详情" class="ldBtnLink" onclick="showItem(${item.id});" />&nbsp;
								</ld:check>
								<ld:check mark="historyUpdate">
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
						<form action="${basePath}moneyXuyu/historySearch!searchApprenticeByInfo.action"
							  method="post" name="pagerForm">
							    <input name="history.historyName" type="hidden"
								value="${history.historyName}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

