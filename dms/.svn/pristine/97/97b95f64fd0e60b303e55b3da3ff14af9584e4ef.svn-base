<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit(id) {
		var old = document.getElementById("oldPassword");
		var newPass = document.getElementById("newPassword");
		var repeat = document.getElementById("repeatPassword");
		var reg = /^([A-Za-z0-9]){4,18}$/; //4到18位字母和数字的组合
		if (trim(old.value).length == 0 || old.value == "") {
			ldDialog.alert("旧密码不得为空，请输入旧密码");
			old.focus();
			return false;
		}
		if (trim(newPass.value).length == 0 || newPass.value == "") {
			ldDialog.alert("新密码不得为空，请输入新密码");
			newPass.focus();
			return false;
		}
		if (!reg.test(newPass.value)) {
			ldDialog.alert("新密码不可为空且必须为4至18位字母与数字组合!");
			newPass.focus();
			return false;
		}
		if (trim(repeat.value).length == 0 || repeat.value == "") {
			ldDialog.alert("请再次输入新密码");
			repeat.focus();
			return false;
		}
		if (newPass.value != repeat.value) {
			ldDialog.alert("两次输入的密码必须一致！");
			return false;
		}
		if (newPass.value == old.value) {
			ldDialog.alert("输入的新密码与之前的密码一致，请重新输入");
			newPass.focus();
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/userUpdate!updatePassword.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : $("#submitForm").serialize(),
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("密码修改成功");
					ldDialog.close();
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
	<form id="submitForm" method="post">
		<div class="dialogTop" align="center">
			<table width="100%" border="0" cellspacing="1" cellpadding="10">
				<tr>
					<td width="100" align="right">
						<FONT color=red>*</FONT>原始密码：
					</td>
					<td>
						<input type="password" class="ldText input138" name="oldPassword"
							id="oldPassword" value="${oldPassword}" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<FONT color=red>*</FONT>新密码：
					</td>
					<td>
						<input type="password" class="ldText input138" name="newPassword"
							id="newPassword" value="${newPassword}" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<FONT color=red>*</FONT>重复新密码：
					</td>
					<td>
						<input type="password" class="ldText input138"
							name="repeatPassword" id="repeatPassword"
							value="${repeatPassword}" />
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="userPasswordUpdate">
					<input type="button" value="确　定" class="ldBtnGreen"
						onclick="return checkSubmit(${curUser.id});" />
				</ld:check>
				<input type="button" value="关　闭" class="ldBtnGray"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>

