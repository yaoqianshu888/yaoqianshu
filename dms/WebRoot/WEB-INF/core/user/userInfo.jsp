<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<style type="text/css">
.yhItem1 {
	line-height: 40px;
}

.member-page-title {
	height: 30px;
	padding-left: 40px;
	border-bottom: 1px solid #dfdfdf;
}
</style>
<script type="text/javascript">
	$(function() {
		var url = "${basePath}coreAjax/userSearch!userInfo.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = JSON.parse(result);
				if(res.code == 1){
					var user = res.bean;
					$("#userName").text(user.userName);
					$("#loginIP").text(user.loginIP);
					var loginTime = new Date(user.loginTime);
					$("#loginTime").text(loginTime.format("yyyy-MM-dd HH:mm:ss"));
					$("#lastLoginIP").text(user.lastLoginIP);
					var lastLoginTime = new Date(user.lastLoginTime);
					$("#lastLoginTime").text(lastLoginTime.format("yyyy-MM-dd HH:mm:ss"));
					ldDialog.unmask();
				}else{
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1" class="welcome"
			style="float:none;min-height: 505px;">
			<div class="member-page-title">
				<h2>个人信息</h2>
			</div>
			<div class="yhlist2">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td width="100" class="right yhItem1">用户名称：</td>
						<td class="left yhItem2" id="userName"></td>
					</tr>
					<tr>
						<td width="100" class="right yhItem1">本次登录IP：</td>
						<td class="left yhItem2" id="loginIP"></td>
					</tr>
					<tr>
						<td width="100" class="right yhItem1">本次登录时间：</td>
						<td class="left yhItem2" id="loginTime">
						</td>
					</tr>
					<tr>
						<td width="100" class="right yhItem1">上次登录IP：</td>
						<td class="left yhItem2" id="lastLoginIP"></td>
					</tr>
					<tr>
						<td width="100" class="right yhItem1">上次登录时间：</td>
						<td class="left yhItem2" id="lastLoginTime">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
</html>