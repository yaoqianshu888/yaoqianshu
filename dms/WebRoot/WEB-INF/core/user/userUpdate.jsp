<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<script>
	function checkSubmit() {
		if (!checkData(true, 'user.userAlias', "登录名称", 2, 8)) {
			return false;
		}
		if (!checkData(true, 'user.userNum', "用户编码", 2, 8)) {
			return false;
		}
		if (!checkData(true, 'user.userName', "用户全称", 2, 8)) {
			return false;
		}
		var newId = document.getElementById('belongAreaId').value;
		if (newId == '') {
			ldDialog.alert("请选择用户归属部门!");
			return false;
		}
		if (!checkData(false, 'user.memo', "备注", 1, 255)) {
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/userUpdate!updateUser.action";
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
	function selectArea() {
		var url = "${basePath}core/areaForChoose!areaForChooseFrame.action?notChooseIds=${notChooseIds}";
		ldDialog.open(url, "选择部门", function(window) {
			var area = window.returnValue;
			if (area == undefined) {
				return;
			}
			$("#belongAreaId").val(area.id);
			$("#belongAreaName").val(area.areaName);
		}, 1024, 600);
	}
	$(function(){
		loadData();
	});
	function loadData(){
		var url = "${basePath}coreAjax/userSearch!detailUser.action?user.id=${user.id}";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			success : function(result) {
				var res = eval("(" + result + ")");
				if (res.code == 1) {
					loadFormData(res.bean, "user");
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
</script>
</head>
<body style="overflow: auto">
	<form id="submitForm" method="post">
		<input type="hidden" name="user.id" value="${user.id}" />
		<div class="dialogTop">
			<table width="100%" border="0" align="center" cellspacing="10"
				cellpadding="0">
				<tr>
					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						登录名称：
					</td>
					<td>
						<input name="user.userAlias" type="text" class="ldText input138"
							id="user.userAlias" value="${user.userAlias}" maxlength="8" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						用户编码：
					</td>
					<td>
						<input name="user.userNum" type="text" class="ldText input138"
							id="user.userNum" value="${user.userNum}" maxlength="8" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						用户全称：
					</td>
					<td>
						<input type="text" class="ldText input138" id="user.userName"
							name="user.userName" value="${user.userName}" maxlength="8" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						是否有效：
					</td>
					<td>
						<ld:select groupName="available" name="user.available"
							value="" className="ldSelect select144" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">
						<span class="font12">*</span>
						所属部门：
					</td>
					<td>
						<input type="hidden" name="user.belongArea.id" id="belongAreaId"
							value="${user.belongArea.id}" />
						<input name="user.belongArea.areaName" type="text"
							class="ldText input138" value="${user.belongArea.areaName}"
							readonly="readonly" id="belongAreaName" />
						<input type="button" class="ldBtnGray" onclick="selectArea();"
							value="选择" style="float:none;" />
					</td>
				</tr>
				<tr>
					<td width="100" class="right yhItem1">备注：</td>
					<td>
						<textarea name="user.memo" cols="45" id="user.memo"
							class="ldTextArea" style="width:220px; height:100px">${user.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="userInsertCommit">
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