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
			function(window) {
		});
	}

	function editItem(id) {
			ldDialog.openMini(
			"${basePath}moneyJinliang/chargeUpdate!prepare.action?history.clickNo="+ id,
			"修改收数",
			function(window) {
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
	function deleteItems() {
		var dms = getAllChose("delete");
		if (dms == "") {
			ldDialog.alert("请先选择要删除的项");
			return;
		}
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除这些项吗？", function() {
			var url = "${basePath}moneyJinliang/chargeDelete!deleteCharge.action?" + param;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(res) {
					if (res[0].code == 1) {
						ldDialog.tips("处理完成");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						document.deleteForm.submit();
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
<style >
.ctl{ 
   table-layout:fixed 
 } 
 .ctl td{text-overflow:ellipsis;overflow:hidden;white-space: nowrap;padding:2px} 
</style>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="searchForm" method="post" action="${basePath}moneyJinliang/apprenticeSearch!searchApprenticeByInfo.action">
					<div class="conditionsbox">
						<div id="conditionsbox">
							
							
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
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
				<form method="post" name="deleteForm" id="deleteForm" action="${basePath}moneyJinliang/chargeNumber!showDetail.action">
					<input type="hidden" name="apprentice.id" value="${apprentice.id }"/>
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid ctl" >
						<tr>
							<th style="width:5%">选择</th>
							<th style="width:5%">序号</th>
							<th style="width:30%">收数情况</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>操作</th>
						</tr>
						
						<c:forEach items="${histories }" var="item" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="delete" id="delete" value="${ item[0].clickNo}" />			
							</td>
							<td><c:out value="${status.count}" /></td>
							<td>
								<c:forEach items="${item }" var="item1" varStatus="status1">
									${ item1.numgroup.groupName}--><span style="color:red">${ item1.chargeNumber}元 </span>|
								</c:forEach>
							</td>
							<td><span style="font-weight:bold;"><f:formatDate value="${ item[0].createTime}" pattern="yyyy-MM-dd  HH:mm:ss" /></span></td>
							<td><span style="font-weight:bold;"><f:formatDate value="${ item[0].lastModifyTime}" pattern="yyyy-MM-dd  HH:mm:ss" /></span></td>
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
			
			
			
		</div>
	</div>
</body>

</html>

