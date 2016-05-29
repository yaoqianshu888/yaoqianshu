<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">
$(function(){
	loadData();
});
function loadData(){
	var url = "${basePath}coreAjax/userSearch!detailUser.action?user.id=${user.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res = JSON.parse(result);
			if (res.code == 1) {
				var user = res.bean;
				$("#userAlias").append(user.userAlias);
				$("#userNum").append(user.userNum);
				$("#userName").append(user.userName);
				$("#available").append(user.availableOptionDisplay);
				$("#belongAreaName").append(user.belongArea.areaName);
				$("#memo").append(user.memo);
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
		<table width="100%" align="center" cellspacing="10"
			cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="100" class="right evenTrBgColor">
					登录名称：
				</td>
				<td id="userAlias">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					用户编码：
				</td>
				<td id="userNum">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					用户全称：
				</td>
				<td id="userName">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					是否有效：
				</td>
				<td id="available">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">
					所属部门：
				</td>
				<td id="belongAreaName">
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

