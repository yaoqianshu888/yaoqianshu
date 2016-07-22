<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {  
		if (!checkData(true, 'apprentice.apprenticeName', "下家名称", 2, 30)) {
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.wordTimes').value)) {
			ldDialog.alert("字倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.wordRebate').value)) {
			ldDialog.alert("字返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.zodiacTimes').value)) {
			ldDialog.alert("包肖倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.zodiacRebate').value)) {
			ldDialog.alert("包肖返点：请输入数字");
			return false;
		}
		
		if (!isDecimal(document.getElementById('apprentice.mainZodiacTimes').value)) {
			ldDialog.alert("主生肖倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.mainZodiacRebate').value)) {
			ldDialog.alert("主生肖返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.redTimes').value)) {
			ldDialog.alert("红波倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.redRebate').value)) {
			ldDialog.alert("红波返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.greenTimes').value)) {
			ldDialog.alert("绿波倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.greenRebate').value)) {
			ldDialog.alert("绿波返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.blueTimes').value)) {
			ldDialog.alert("蓝波倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.blueRebate').value)) {
			ldDialog.alert("蓝波返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.oddTimes').value)) {
			ldDialog.alert("单数倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.oddRebate').value)) {
			ldDialog.alert("单数返点：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.evenTimes').value)) {
			ldDialog.alert("双数倍数：请输入数字");
			return false;
		}
		if (!isDecimal(document.getElementById('apprentice.evenRebate').value)) {
			ldDialog.alert("双数返点：请输入数字");
			return false;
		}
		
		if (!checkData(false, 'apprentice.memo', "备注", 1, 255)) {
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/apprenticeUpdate!updateApprentice.action";
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
		<input name="apprentice.id" id="apprentice.id" value="${apprentice.id}"
			type="hidden" />
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>下家名称：
					</td>
					<td>
						<input type="text" name="apprentice.apprenticeName" id="apprentice.apprenticeName" 
							value="${apprentice.apprenticeName}" class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>字倍数：
					</td>
					<td>
						<input type="text" name="apprentice.wordTimes" id="apprentice.wordTimes" 
							value="${apprentice.wordTimes}" class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>字返点：
					</td>
					<td>
						<input type="text" name="apprentice.wordRebate" id="apprentice.wordRebate" 
							value="${apprentice.wordRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>包肖倍数：
					</td>
					<td>
						<input type="text" name="apprentice.zodiacTimes" id="apprentice.zodiacTimes" 
							value="${apprentice.zodiacTimes}" class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>包肖返点：
					</td>
					<td>
						<input type="text" name="apprentice.zodiacRebate" id="apprentice.zodiacRebate" 
							value="${apprentice.zodiacRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				
				<tr>
					<td width="80" align="right">
						<FONT color=red>*</FONT>主生肖倍数：
					</td>
					<td>
						<input type="text" name="apprentice.mainZodiacTimes" id="apprentice.mainZodiacTimes" 
							value="${apprentice.mainZodiacTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="80" align="right">
						<FONT color=red>*</FONT>主生肖返点：
					</td>
					<td>
						<input type="text" name="apprentice.mainZodiacRebate" id="apprentice.mainZodiacRebate" 
							value="${apprentice.mainZodiacRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>红波倍数：
					</td>
					<td>
						<input type="text" name="apprentice.redTimes" id="apprentice.redTimes" 
							value="${apprentice.redTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>红波返点：
					</td>
					<td>
						<input type="text" name="apprentice.redRebate" id="apprentice.redRebate" 
							value="${apprentice.redRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>绿波倍数：
					</td>
					<td>
						<input type="text" name="apprentice.greenTimes" id="apprentice.greenTimes" 
							value="${apprentice.greenTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>绿波返点：
					</td>
					<td>
						<input type="text" name="apprentice.greenRebate" id="apprentice.greenRebate" 
							value="${apprentice.greenRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>蓝波倍数：
					</td>
					<td>
						<input type="text" name="apprentice.blueTimes" id="apprentice.blueTimes" 
							value="${apprentice.blueTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>蓝波返点：
					</td>
					<td>
						<input type="text" name="apprentice.blueRebate" id="apprentice.blueRebate" 
							value="${apprentice.blueRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>单数倍数：
					</td>
					<td>
						<input type="text" name="apprentice.oddTimes" id="apprentice.oddTimes" 
							value="${apprentice.oddTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>单数返点：
					</td>
					<td>
						<input type="text" name="apprentice.oddRebate" id="apprentice.oddRebate" 
							value="${apprentice.oddRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>双数倍数：
					</td>
					<td>
						<input type="text" name="apprentice.evenTimes" id="apprentice.evenTimes" 
							value="${apprentice.evenTimes}" class="ldText" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>双数返点：
					</td>
					<td>
						<input type="text" name="apprentice.evenRebate" id="apprentice.evenRebate" 
							value="${apprentice.evenRebate}" class="ldText" maxlength="30" /> %
					</td>
				</tr>
				
				<tr>
					<td align="right">备注：</td>
					<td>
						<textarea name="apprentice.memo" id="apprentice.memo" cols="30" rows="5"
							maxlength="255">${apprentice.memo}</textarea>
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

