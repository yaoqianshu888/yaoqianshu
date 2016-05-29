<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
$(function(){
	loadData();
});
function loadData(){
	var url = "${basePath}coreAjax/rightSearch!getRightDetail.action?right.id=${right.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res =JSON.parse(result);
			if (res.code == 1) {
				var right = res.bean;
				$("#rightName").append(right.rightName);
				$("#rightMark").append(right.rightMark);
				$("#rightURL").append(right.rightURL);
				$("#isMenu").append(right.isMenuOptionDisplay);
				$("#isInherit").append(right.isInheritOptionDisplay);
				$("#logable").append(right.logableOptionDisplay);
				$("#isFilter").append(right.isFilterOptionDisplay);
				$("#memo").append(right.memo);
			} else {
				ldDialog.alert(res.reason);
			}
			ldDialog.unmask();
		},
		error : function() {
			ldDialog.unmask();
		}
	});
}
</script>
</head>
<body>
	<div class="dialogTop">
		<table width="100%" border="0" align="center" cellspacing="10"
			cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="100" class="right evenTrBgColor">
					权限名称：
				</td>
				<td id="rightName">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">权限标识：</td>
				<td id="rightMark">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">URL指向：</td>
				<td id="rightURL">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					是否菜单：
				</td>
				<td id="isMenu">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					授权方式：
				</td>
				<td id="isInherit">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					是否记录：
				</td>
				<td id="logable">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					是否过滤：
				</td>
				<td id="isFilter">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">备注：</td>
				<td id="memo">
				</td>
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

