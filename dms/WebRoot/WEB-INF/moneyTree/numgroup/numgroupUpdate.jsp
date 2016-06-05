<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		if (!checkData(true, 'numgroup.groupName', "群组名称", 2, 30)) {
			return false;
		}
		
		if (!checkData(false, 'numgroup.memo', "备注", 1, 255)) {
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/numgroupUpdate!updateNumgroup.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			data : $("#submitForm").serialize(),
			success : function(res) {
				if (res[0].code == 1) {
					ldDialog.close(res[0].returnValue);
				} else {
					ldDialog.alert(res[0].reason);
					ldDialog.unmask();
				}
			},
			error : function() {
					alert("修改出错！");
			}
		});
	}
</script>
</head>

<body>
	<form method="post" id="submitForm">
		<input name="numgroup.id" id="numgroup.id" value="${numgroup.id}"
			type="hidden" />
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>群组名称：
					</td>
					<td>
						<input type="text" name="numgroup.groupName" id="numgroup.groupName" 
							value="${numgroup.groupName}" class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td align="right">备注：</td>
					<td>
						<textarea name="numgroup.memo" id="numgroup.memo" cols="30" rows="5"
							maxlength="255">${numgroup.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="projectUpdateCommit">
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

