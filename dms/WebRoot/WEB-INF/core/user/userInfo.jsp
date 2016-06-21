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
					
					ldDialog.unmask();
				}else{
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
		
		var url = "${basePath}moneyJinliang/userExtraInsert!getRebateAndTimes.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			success : function(res) {
				$("#lastLoginTime").text(res[0].lastLoginTime);
				$("#rebate").text(res[0].rebate);
				$("#times").text(res[0].times);
			},
			error : function() {
				
			}
		});
		
	});
	
	function setRebateAndTimes(){
		ldDialog.openMini(
			"${basePath}moneyJinliang/userExtraInsert!toSetRebateTimes.action?",
			"设置上家返点与倍数",
			function(window) {
				var returnValue = window.returnValue;
					if (returnValue == undefined) {//无返回值 直接关闭 
						return true;
					} else {//有返回值 处理一些事
						ldDialog.tips("处理成功！");
						
						document.location.reload();
						return true;
					}
			});
	}
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1" class="welcome"
			style="float:none;min-height: 505px;">
			<div class="member-page-title">
				<h2>个人信息</h2><input type="button" value="设置上家返点倍数" class="ldBtnBlue" onclick="setRebateAndTimes();" />
				
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
					<tr>
						<td width="100" class="right yhItem1">上家返点：</td>
						<td class="left yhItem2" ><span id="rebate"></span>%
						</td>
					</tr>
					<tr>
						<td width="100" class="right yhItem1">上家倍数：</td>
						<td class="left yhItem2" id="times">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
</html>