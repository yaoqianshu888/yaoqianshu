<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<script type="text/javascript" src="${basePath}core/js/jquery.form.js"></script>
<script type="text/javascript">
	function checkSubmit() {
		var projectId = document.getElementById("checkstandVersion.project.id");
		var platformId = document
				.getElementById("checkstandVersion.platform.id");
		var posType = document.getElementById("checkstandVersion.posType.id");
		var versionNum = document
				.getElementById("checkstandVersion.versionNum");
		var versionName = document
				.getElementById("checkstandVersion.versionName");

		if (!projectId.value) {
			ldDialog.alert("请选择项目");
			return false;
		}

		if (!platformId.value) {
			ldDialog.alert("请选择平台");
			return false;
		}

		if (!posType.value) {
			ldDialog.alert("请选择终端类型");
			return false;
		}

		if (!checkData(true, 'checkstandVersion.versionNum', "版本编码", 1, 20)) {
			return false;
		}
		if (versionName.value == "") {
			ldDialog.alert("请输入版本名称！！！");
			versionName.focus();
			return false;
		}

		if (!isMaxLimit(versionName.value,30)) {
			ldDialog.alert("版本名称长度过长，请重新输入！！！");
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/checkstandVersionUpdate!update.action";
		$("#submitForm").ajaxSubmit({
			type : "post",
			url : url,
			error : function(data) {// 请求失败时调用函数
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.close(res.returnValue);
				} else {
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			}
		});
	}
	function loadData(){
		var url = "${basePath}coreAjax/checkstandVersionSearch!getCheckstandVersionDetail.action?checkstandVersion.id=${checkstandVersion.id}";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = eval("(" + result + ")");
				if (res.code == 1) {
					loadFormData(res.bean, "checkstandVersion");
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
	
	$(function(){
		loadData();
	});
</script>
</head>

<body>
	<form id="submitForm" method="post" name="form1"
		enctype="multipart/form-data">
		<input name="checkstandVersion.id" id="checkstandVersion.id" value="${checkstandVersion.id}" type="hidden" />
		<div class="dialogTop">
			<table width="100%" border="0" align="center" cellspacing="10" cellpadding="0">
				<tr>
					<td width="100" align="right"><span class="font12">*</span> 项目名称</td>
					<td><ld:select id="checkstandVersion.project.id" name="checkstandVersion.project.id" groupName="project"
							className="ldSelect select144" value="${checkstandVersion.project.id}" exceptValue="-1"/></td>
					<td width="100" align="right"><span class="font12">*</span> 平台</td>
					<td><ld:select id="checkstandVersion.platform.id" name="checkstandVersion.platform.id" groupName="platform"
							className="ldSelect select144" value="${checkstandVersion.platform.id}" exceptValue="-1"/></td>

				</tr>
				<tr>
					<td width="100" align="right"><span class="font12">*</span> 终端类型</td>
					<td><ld:select id="checkstandVersion.posType.id" name="checkstandVersion.posType.id" groupName="posType"
							className="ldSelect select144" value="${checkstandVersion.posType.id}" exceptValue="-1"/></td>
					<td width="100" align="right"><span class="font12">*</span> 是否强制升级</td>
					<td><ld:select id="checkstandVersion.isForceUpdate" name="checkstandVersion.isForceUpdate"
							groupName="yesOrNoInt" className="ldSelect select144" value="${checkstandVersion.isForceUpdate}"
							exceptValue="${options.common.ALL}" /></td>
				</tr>
				<tr>
					<td width="100" align="right"><span class="font12">*</span> 版本编码</td>
					<td><input type="text" id="checkstandVersion.versionNum" name="checkstandVersion.versionNum" maxlength="8"
							class="ldText" value="${checkstandVersion.versionNum}" /> <font color=red>*</font></td>
					<td width="100" align="right"><span class="font12">*</span> 版本名称</td>
					<td><input type="text" id="checkstandVersion.versionName" name="checkstandVersion.versionName" maxlength="64"
							class="ldText" value="${checkstandVersion.versionName}" /></td>
				</tr>
				<tr>
					<td width="100" align="right">文件路径</td>
					<td colspan="3"><input type="file" id="upload" name="upload" class="img-input-disable" /></td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="checkstandVersionUpdateCommit">
					<input type="button" value="确定" class="ldBtnGreen" onclick="return checkSubmit();" />
				</ld:check>
				<input type="button" value="取消" class="ldBtnGray" onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>
