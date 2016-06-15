<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
</head>
<body>
	<div class="dialogTop">
		<table  width="400" border="0" cellspacing="10" cellpadding="0" class="ld-datagrid">
			<tr>
				<th>投注号码</th>
				<th>金额</th>
			</tr>
			<c:forEach items="${historyList }" var="item" varStatus="status">
				<tr>
					<td>${ item.numgroup.groupName}</td>
					<td>${ item.chargeNumber}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" value="关 闭" class="ldBtnGray"
				onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>


