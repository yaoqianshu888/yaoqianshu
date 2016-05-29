<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		var name = $("#areaName").val();
		if (isNull(name)) {
			ldDialog.alert("编码名称不能为空");
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/areaUpdate!updateArea.action";
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
		var url = "${basePath}coreAjax/areaSearch!getAreaDetail.action?area.id=${area.id}";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = eval("(" + result + ")");
				if (res.code == 1) {
					loadFormData(res.bean, "area");
					$("#parentAreaInfo").text(res.parentArea.areaMark+res.parentArea.areaName);
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
	<form id="submitForm" method="post">
		<input type="hidden" name="area.id" value="${area.id }">
		<div class="dialogTop">
			<table width="400" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="80" align="right">
						<span class="font12">*</span> 上级部门：
					</td>
					<td width="210" id="parentAreaInfo">${parentArea.areaMark}${parentArea.areaName}</td>
				</tr>
				<tr>
					<td width="80" align="right">
						<span class="font12">*</span> 部门编码：
					</td>
					<td width="210">
						<input name="area.areaMark" type="text" class="ldText input138"
							value="${area.areaMark}" id="areaMark" maxlength="20"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td width="80" align="right">
						<span class="font12">*</span> 部门名称：
					</td>
					<td width="210">
						<input name="area.areaName" type="text" class="ldText input138"
							value="${area.areaName}" id="areaName" maxlength="20" />

					</td>
				</tr>
				<tr>
					<td align="right">备注：</td>
					<td>
						<textarea name="area.memo" id="textarea" cols="45"
							value="${area.memo}" rows="5" class="ldTextArea" maxlength="100"
							style="width:220px; height:100px">${area.memo }</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="areaUpdateCommit">
					<input type="button" class="ldBtnGreen" value="确定" onclick="return checkSubmit();" /> 
				</ld:check>
				<input type="button" class="ldBtnGray" value="关闭" onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>