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
		var url = "${basePath}coreAjax/projectInsert!insertProject.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : $("#submitForm").serialize(),
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					//ldDialog.tips("新增成功");
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
	
</script>
</head>
<body>
	<form method="post" id="submitForm">
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
					<td align="right">备注：</td>
					<td>
						<textarea name="project.memo" id="project.memo" cols="30" rows="5"
							maxlength="255">${project.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="projectInsertCommit">
					<input type="button" value="确 定" class="ldBtnGreen"
						onclick="return checkSubmit();" />
				</ld:check>
				<input type="button" value="关 闭" class="ldBtnGray"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>

