<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<script type="text/javascript">
$(function(){
	loadData();
});
function loadData(){
	var url = "${basePath}coreAjax/operateLogSearch!getOperateLogById.action?id=${id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res = eval("(" + result + ")");
			if (res.code == 1) {
				//loadFormData(res.bean, "user");
				var operateLog = res.bean;
				if(operateLog.right==null){
					$("#rightName").append("非法URL");
				}else{
					$("#rightName").append(operateLog.right.rightName);
				}
				$("#accessUrl").append(operateLog.accessUrl);
				$("#status").append(operateLog.statusOptionDisplay);
				$("#isLegal").append(operateLog.isLegalOptionDisplay);
				$("#clientIp").append(operateLog.clientIp);
				if(operateLog.user == null){
					$("#userName").append("未知用户");
				}else{
					$("#userName").append(operateLog.user.userName);
				}
				var time = new Date(operateLog.time).format("yyyy-MM-dd HH:mm:ss");
				$("#time").append(time);
				$("#lastingTime").append(operateLog.lastingTime);
				$("#param").append(operateLog.param);
				$("#description").append(operateLog.description);
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
		<table border="0" cellspacing="10" cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="17%" class="right evenTrBgColor">操作名称：</td>
				<td width="30%" class="left yhItem2" id="rightName">
				</td>
				<td width="18%" class="right evenTrBgColor">访问URL：</td>
				<td width="35%" class="left yhItem2" id="accessUrl">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">操作状态：</td>
				<td class="left yhItem2" id="status">
				</td>
				<td class="right evenTrBgColor">是否合法：</td>
				<td class="left yhItem2" id="isLegal">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">操作IP：</td>
				<td class="left yhItem2" id="clientIp">
				</td>
				<td class="right evenTrBgColor">操作用户：</td>
				<td class="left yhItem2" id="userName">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">操作时间：</td>
				<td class="left yhItem2" id="time">
				</td>
				<td class="right evenTrBgColor">操作时长(毫秒)：</td>
				<td class="left yhItem2" id="lastingTime">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">具体参数：</td>
				<td class="left yhItem2" colspan="3" id="param">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">描述：</td>
				<td class="left yhItem2" colspan="3" id="description">
				</td>
			</tr>
		</table>
	</div>
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" value="关闭" class="ldBtnGray"
				onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>
