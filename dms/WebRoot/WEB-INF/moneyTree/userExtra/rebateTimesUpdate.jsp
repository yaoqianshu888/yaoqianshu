<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		if (document.getElementById('userExtra.rebate').value!='' && !isDecimal(document.getElementById('userExtra.rebate').value)) {
			ldDialog.alert("上家返点输入有误！");
			return false;
		}
		
		if (document.getElementById('userExtra.times').value!='' && !isDecimal(document.getElementById('userExtra.times').value)) {
			ldDialog.alert("上家倍数输入有误！");
			return false;
		}
		
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/userExtraInsert!setRebateTimes.action";
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
		<input name="user.id" id="user.id" value="${user.id}"
			type="hidden" />
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						上家返点：
					</td>
					<td>
						<input type="text" name="userExtra.rebate" id="userExtra.rebate" 
							value="${userExtra.rebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">上家倍数：</td>
					<td>
						<input type="text" name="userExtra.times" id="userExtra.times" 
							value="${userExtra.times}" class="ldText" maxlength="30" />
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

