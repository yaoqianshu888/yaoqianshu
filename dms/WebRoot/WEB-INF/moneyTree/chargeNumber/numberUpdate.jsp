<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		var isNo=0;
		$("input:[type='text']").each(function(){
			if ($(this).val()=='' || !isDecimal($(this).val())) {
				isNo=1;  //出错
			}
		});
		if(isNo==1){
			ldDialog.alert("金额输入有误或者不能为空值！");
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/chargeUpdate!updateCharge.action";
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
		
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<c:forEach items="${historyList }" var="item" varStatus="status">
				<tr>
					<td width="70" align="right">
						${ item.numgroup.groupName}:
					</td>
					<td>
						<input type="text" name="${ item.id}" id="${ item.id}" 
							value="${ item.chargeNumber}" class="ldText" maxlength="30" /> 元
					</td>
				</tr>
				</c:forEach>
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

