<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">
$(function(){
	loadData();
});
function loadData(){
	var url = "${basePath}coreAjax/roleSearch!getRoleDetail.action?role.id=${role.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res = eval("(" + result + ")");
			if (res.code == 1) {
				var role = res.bean;
				$("#roleName").append(role.roleName);
				$("#available").append(role.availableOptionDisplay);
				var time = new Date(role.createTime).format("yyyy-MM-dd HH:mm:ss");
				$("#createTime").append(time);
				$("#creatorUserName").append(role.creator.userName);
				$("#memo").append(role.memo);
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
		<table width="100%" border="0" cellspacing="10" cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="100" class="right evenTrBgColor">
					角色名称：
				</td>
				<td id="roleName">
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
				<td width="100" class="right evenTrBgColor">创建时间：</td>
				<td id="createTime">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">创建人：</td>
				<td id="creatorUserName">
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