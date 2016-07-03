<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		if (!checkData(true, 'period.period', "期数", 1, 4)) {
			return false;
		}
		if($("#period\\.lotteryTime").val()==""){
			ldDialog.alert("请设置开奖时间");
			return false;
		}
		if(!isNum($("#period\\.lotteryResult").val()) && $("#period\\.lotteryResult").val()!=''){
			ldDialog.alert("请输入正确的开奖号码");
			return false;
		}
		
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/periodUpdate!updatePeriod.action";
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
		<input name="period.id" id="period.id" value="${period.id}"
			type="hidden" />
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>期数：
					</td>
					<td>
						<input type="text" name="period.period" id="period.period" 
							value="${period.period}" class="ldText" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>开奖时间：
					</td>
					<td>
						<input name="period.lotteryTime" type="text" id="period.lotteryTime"
												class="ldDateTime input138"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												value="<f:formatDate value="${period.lotteryTime}"
														pattern="yyyy-MM-dd HH:mm:ss" />" />
					</td>
				</tr>
				<tr>
					<td width="70" align="right">
						开奖号码：
					</td>
					<td>
						<input type="text" name="period.lotteryResult" id="period.lotteryResult" 
							value="${period.lotteryResult}" class="ldText" maxlength="30" />
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

