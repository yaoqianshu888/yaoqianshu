<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	
	
	function showItem(id) {
		ldDialog.openMini(
			"${basePath}moneyXuyu/eatSearch!detail.action?eat.id=" + id,
			"吃数详情", 
			function(window) {
		});
	}
	function addItem() {
		ldDialog.openMini("${basePath}moneyXuyu/eatInsert!prepare.action",
			"新增吃数", 
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
			"${basePath}moneyXuyu/eatUpdate!prepare.action?eat.id="+ id,
			"吃数编辑",
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
			var url = "${basePath}moneyXuyu/eatDelete!deleteEat.action?" + param;
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
				<form id="searchForm" method="post" action="${basePath}moneyXuyu/eatSearch!searchEatByInfo.action">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div class="yhlist1L">查询条件</div>
							</div>
							<div class="yhlist2">
									<div class="conditionsrow">
										<div class="conditionsitem">
											<div class="conditionsitemL">吃数值：</div>
											<div class="conditionsitemR">
												<input name="eat.eatValue" class="ldText" style="width:144px" id="eat.eatValue"
													value="${eat.eatValue}" />
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
												<ld:check mark="eatInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
												</ld:check>
												<ld:check mark="eatDelete">
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
							<th>吃数值</th>
							<th>操作</th>
						</tr>
						
						<c:forEach items="${eatList }" var="item" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="delete" id="delete" value="${item.id}" />			
							</td>
							<td><c:out value="${status.count}" /></td>
							<td>${ item.eatValue} </td>
							<td>
								<ld:check mark="eatDetail">
									<input type="button" value="详情" class="ldBtnLink" onclick="showItem(${item.id});" />&nbsp;
								</ld:check>
								<ld:check mark="eatUpdate">
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
						<form action="${basePath}moneyXuyu/eatSearch!searchEatByInfo.action"
							  method="post" name="pagerForm">
							    <input name="eat.eatValue" type="hidden"
								value="${eat.eatValue}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

