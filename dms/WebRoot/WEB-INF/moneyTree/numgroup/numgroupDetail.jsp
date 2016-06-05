<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
</head>
<body>
	<div class="dialogTop">
		<table width="400" border="0" cellspacing="10" cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="80" class="right evenTrBgColor">
					号码群组：
				</td>
				<td>${ numgroup.groupNum}</td>
			</tr>
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


