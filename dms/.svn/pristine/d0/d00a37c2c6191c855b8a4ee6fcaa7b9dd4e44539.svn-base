<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		if (!checkData(true, 'project.projectName', "项目名称", 2, 30)) {
			return false;
		}
		if (!checkData(false, 'project.memo', "备注", 1, 255)) {
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/projectUpdate!updateProject.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : $("#submitForm").serialize(),
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.close(res.returnValue);
				} else {
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {

			}
		});
	}
	function loadData(){
		var url = "${basePath}coreAjax/projectSearch!getProjectDetail.action?project.id=${project.id}";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = eval("(" + result + ")");
				if (res.code == 1) {
					loadFormData(res.bean, "project");
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
	<form method="post" id="submitForm">
		<input name="project.id" id="project.id" value="${project.id}"
			type="hidden" />
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>项目名称：
					</td>
					<td>
						<input type="text" name="project.projectName"
							id="project.projectName" value="${project.projectName}"
							class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">备注：</td>
					<td>
						<textarea name="project.memo" id="project.memo" rows="5" cols="30"
							maxlength="255">${project.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="projectUpdateCommit">
					<input type="button" value="确 定" class="ldBtnGreen"
						onclick="return checkSubmit(${area.id});" />
				</ld:check>
				<input type="button" value="关 闭" class="ldBtnGray"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>

