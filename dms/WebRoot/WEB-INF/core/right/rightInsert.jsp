<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<script language="javascript">
	function checkSubmit() {
		var rightname = document.getElementById('right.rightName');
		var rightmark = document.getElementById('right.rightMark');
		var righturl = document.getElementById('right.rightURL');
		var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,20}$/;
		if (!reg.test(trim(rightname.value))) {
			rightname.focus();
			ldDialog.alert("权限名称不可为空，且必须由2至20位字母、数字和汉字组成!");
			return false;
		}
		if (!checkData(false, 'right.rightMark', "权限标识", 1, 50)) {
			return false;
		}

		var rightURL = document.getElementById('right.rightURL').value;
		if (!isNull(trim(rightURL)) && rightURL.length > 100) {
			ldDialog.alert("URL指向由1至100位任意字符组成");
			return false;
		}
		submitForm();
	}
	function submitForm(){
		var url = "${basePath}coreAjax/rightInsert!insertRight.action";
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

	function init() {
		document.getElementById("right.rightName").focus();
	}
	
</script>
</head>
<body onload="init()">
	<form method="post" id="submitForm">
		<input type="hidden" name="right.upRightId" value="${right.upRightId}" />
		<div class="dialogTop">
			<table width="100%" border="0" align="center" cellspacing="10"
				cellpadding="0">
				<tr>
					<td width="100" align="right">
						<span class="font12">*</span>
						权限名称：
					</td>
					<td>
						<input type="text" id="right.rightName" name="right.rightName"
							class="ldText input138" value="${right.rightName}" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">权限标识：</td>
					<td>
						<input type="text" id="right.rightMark" class="ldText input138"
							name="right.rightMark" value="${right.rightMark}" maxlength="50" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">URL指向：</td>
					<td>
						<input type="text" id="right.rightURL" class="ldText input138"
							name="right.rightURL" value="${right.rightURL}" maxlength="100" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<span class="font12">*</span>
						是否菜单：
					</td>
					<td>
						<ld:select groupName="yesOrNoInt"
							exceptValue="${options.common.ALL_EMPTY}" name="right.isMenu"
							value="${right.isMenu}" className="ldSelect select144" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<span class="font12">*</span>
						授权方式：
					</td>
					<td>
						<ld:select groupName="authorization" name="right.isInherit"
							value="${right.isInherit}" className="ldSelect select144" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<span class="font12">*</span>
						是否记录：
					</td>
					<td>
						<ld:select groupName="yesOrNoInt" name="right.logable"
							className="ldSelect select144" value="${right.logable}"
							exceptValue="${options.common.ALL_EMPTY}" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">
						<span class="font12">*</span>
						是否过滤：
					</td>
					<td>
						<ld:select groupName="yesOrNoInt" name="right.isFilter"
							className="ldSelect select144" value="${right.isFilter}"
							exceptValue="${options.common.ALL_EMPTY}" />
					</td>
				</tr>
				<tr>
					<td width="100" align="right">备注：</td>
					<td>
						<label for="textarea"></label>
						<textarea name="right.memo" id="right.memo" class="ldTextArea"
							style="width:220px; height:100px" maxlength="255">${right.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="rightInsertCommit">
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