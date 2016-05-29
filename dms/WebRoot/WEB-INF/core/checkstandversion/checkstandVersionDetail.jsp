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
	var url = "${basePath}coreAjax/checkstandVersionSearch!getCheckstandVersionDetail.action?checkstandVersion.id=${checkstandVersion.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			console.info(result);
			var res = eval("(" + result + ")");
			if (res.code == 1) {
				var checkstandVersion = res.bean;
				$("#projectName").append(checkstandVersion.project.projectName);
				$("#platformName").append(checkstandVersion.platform.platformName);
				$("#posTypeName").append(checkstandVersion.posType.typeName);
				$("#isForceUpdate").append(checkstandVersion.isForceUpdateOptionDisplay);
				$("#versionNum").append(checkstandVersion.versionNum);
				$("#versionName").append(checkstandVersion.versionName);
				$("#filePath").append(checkstandVersion.filePath);
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
		<table width="100%" border="0" align="center" cellspacing="10" cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="100" class="right evenTrBgColor">项目名称：</td>
				<td id="projectName"></td>
				<td width="100" class="right evenTrBgColor">平台：</td>
				<td id="platformName"></td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">终端类型：</td>
				<td id="posTypeName"></td>
				<td width="100" class="right evenTrBgColor">是否强制升级：</td>
				<td id="isForceUpdate"></td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">版本编码：</td>
				<td id="versionNum"></td>
				<td width="100" class="right evenTrBgColor">版本名称：</td>
				<td id="versionName"></td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">文件路径：</td>
				<td colspan="3" id="filePath"></td>
			</tr>
		</table>
	</div>
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" value="关闭" class="ldBtnGray" onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>
