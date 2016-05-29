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
				<td width="70" class="right evenTrBgColor">
					下家名称：
				</td>
				<td>${ apprentice.apprenticeName}</td>
			</tr>
			
			<tr>
				<td width="70" class="right evenTrBgColor">
					创建人：
				</td>
				<td>${ apprentice.creator.userName}</td>
			</tr>
			<tr>
				<td width="70" class="right evenTrBgColor">
					创建时间：
				</td>
				<td id="createTime">
					<f:formatDate value="${ apprentice.createTime}" pattern="yyyy-MM-dd  HH:mm:ss" />
				</td>
			</tr>
			<tr>
				<td width="70" class="right evenTrBgColor">
					最后修改者：
				</td>
				<td>${ apprentice.lastModifier.userName}</td>
			</tr>
			<tr>
				<td width="70" class="right evenTrBgColor">
					最后修改时间：
				</td>
				<td id="createTime">
					<f:formatDate value="${ apprentice.lastModifyTime}" pattern="yyyy-MM-dd  HH:mm:ss" />
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">备注：</td>
				<td>${ apprentice.memo}</td>
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


