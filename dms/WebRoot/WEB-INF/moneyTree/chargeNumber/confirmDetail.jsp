<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
//回车提交表单
	document.onkeydown = function(evt){
   　	 var evt = window.event?window.event:evt;
    　	if (evt.keyCode==13) {
          ldDialog.close(1);
    	　}
   }
</script>
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
			<tr>
				<td style="font-weight:bold">合计</td>
				<td style="font-weight:bold">${total}</td>
			</tr>
		</table>
	</div>
	
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" id="a" value="确定" class="ldBtnGray"
				onclick="ldDialog.close(1);" />
		</div>
	</div>
</body>
</html>
<<script type="text/javascript">
	document.getElementById('a').focus();
</script>


