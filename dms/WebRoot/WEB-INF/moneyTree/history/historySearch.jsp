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
				document.searchForm.submit();
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
				<div class="conditionsbox">
					<div id="conditionsbox">
						<div class="yhlist1">
							<div class="yhlist1L">查询条件</div>
						</div>
						<form id="searchForm" method="post" action="${basePath}moneyXuyu/historySearch!getHistoryByHistory.action">
							<div class="yhlist2">
								<div class="conditionsrow">
									<div class="conditionsitem">
										<div class="conditionsitemL">期数：</div>
										<div class="conditionsitemR">
											<input name="periodValue" class="ldText" style="width: 144px" id="periodValue" value="" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">下家名称：</div>
										<div class="conditionsitemR">
											<input name="apprenticeName" class="ldText" style="width: 144px" id="apprenticeName" value="" />
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
							</div><!-- yhlist2 end -->
						</form>
						<div class="yhlist3">
							<table id="contentTable" width="100%" border="0"
								cellspacing="1" cellpadding="0" class="ld-datagrid ctl">
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
						</div><!-- yhlist3 end -->
						<!-- toolbarR end -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

