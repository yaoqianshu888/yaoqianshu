<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	
	
	function showItem(id) {
		ldDialog.openMini(
			"${basePath}moneyJinliang/numgroupSearch!detail.action?numgroup.id=" + id,
			"号码详情", 
			function(window) {
		});
	}
	function addItem() {
		ldDialog.openMedium("${basePath}moneyJinliang/numgroupInsert!prepare.action",
			"新增群组", 
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
			"${basePath}moneyJinliang/numgroupUpdate!prepare.action?numgroup.id="+ id,
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
			var url = "${basePath}moneyJinliang/numgroupDelete!deleteNumgroup.action?" + param;
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
				<form id="searchForm" method="post" action="${basePath}moneyJinliang/numgroupSearch!searchNumgroupByInfo.action">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div class="yhlist1L">查询条件</div>
							</div>
							<div class="yhlist2">
									<div class="conditionsrow">
										<div class="conditionsitem">
											<div class="conditionsitemL">群组名称：</div>
											<div class="conditionsitemR">
												<input name="numgroup.groupName" class="ldText" style="width:144px" id="numgroup.groupName"
													value="${numgroup.groupName}" />
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
												<ld:check mark="numgroupInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
												</ld:check>
												<ld:check mark="numgroupDelete">
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
							<th>群组名称</th>
							<th>创建时间</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
						
						<c:forEach items="${numgroupList }" var="item" varStatus="status">
						<tr>
							<c:if test="${ item.user.id==null || item.user.id==''}">
								<td></td>
							</c:if>
							<c:if test="${ item.user.id!=null && item.user.id!=''}">
								<td><input type="checkbox" name="delete" id="delete" value="${item.id}" /></td>
							</c:if>
							<td><c:out value="${status.count}" /></td>
							<td>${ item.groupName} </td>
							<td><f:formatDate value="${ item.createTime}" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
							<td>${ item.memo}</td>
							<td>
								<ld:check mark="numgroupUpdate">
									<c:if test="${ item.user.id!=null && item.user.id!=''}">
										<input type="button" value="编辑" class="ldBtnLink" onclick="editItem(${item.id});" />&nbsp;
									</c:if>
								</ld:check>
								<ld:check mark="numgroupDetail">
									<input type="button" value="号码详情" class="ldBtnLink" onclick="showItem(${item.id});" />&nbsp;
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
						<form action="${basePath}moneyJinliang/numgroupSearch!searchNumgroupByInfo.action"
							  method="post" name="pagerForm">
							    <input name="numgroup.groupName" type="hidden"
								value="${numgroup.groupName}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

