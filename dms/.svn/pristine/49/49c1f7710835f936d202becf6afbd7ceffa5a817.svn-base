<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">
	function checkSubmit(id) {
		var roleName = document.getElementById('role.roleName');
		var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,8}$/;
		if (!reg.test(trim(roleName.value))) {
			roleName.focus();
			ldDialog.alert("角色名称不可为空，且必须由2至8位字母、数字或汉字组成!");
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/roleUpdate!updateRole.action";
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
		var url = "${basePath}coreAjax/roleSearch!getRoleDetail.action?role.id=${role.id}";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = eval("(" + result + ")");
				if (res.code == 1) {
					loadFormData(res.bean, "role");
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
		<div class="dialogTop">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<input type="hidden" name="role.id" value="${role.id}" />
				<tr>
					<input type="hidden" name="role.belongArea.id" value='1' />

					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						角色名称：
					</td>
					<td>
						<input type="text" name="role.roleName" id="role.roleName"
							class="ldText" style="width:144px" value="${role.roleName}"
							maxlength="8" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">是否有效：</td>
					<td>
						<ld:select id="role.available" name="role.available"
							groupName="available" value="${role.available}"
							className="ldSelect select144" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">备注：</td>
					<td>
						<textarea name="role.memo" id="role.memo " class="ldTextArea"
							style="width:250px; height:100px" maxlength="255">${role.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="roleUpdateCommit">
					<input type="button" value="确 定" class="ldBtnGreen"
						onclick="return checkSubmit(${role.id});" />
				</ld:check>
				<input type="button" value="关 闭" class="ldBtnGray"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>