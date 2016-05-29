<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript" src="${basePath}core/js/jquery.form.js"></script>
<script type="text/javascript">
	var interval;
	function checkSubmit() {
		var checkFile = document.getElementById('upload');
		if (checkFile != null && checkFile.value != null
				&& checkFile.value != "") {
			//$("#progressBar").mask("正在校验excel文件，请稍后...");//打开遮罩层
			ldDialog.mask("正在校验excel文件，请稍后...");//text默认“正在加载中...”
			interval = window.setInterval('getMaskInfo()', 10);//定时获取后台关于进度的信息
			submitForm();
			return true;
		} else {
			alert("请上传文件.");
			return false;
		}
	}

	function submitForm() {
		var url = "${basePath}coreAjax/userImport!importUser.action";
		$("#submitForm").ajaxSubmit({
			type : "post",
			url : url,
			error : function(data) {// 请求失败时调用函数
				ldDialog.alert(data);
				window.clearInterval(interval);
			},
			success : function(result) {
				console.info(result);
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.alert(res.result);
					document.getElementById('upload').value = "";
					ldDialog.unmask();
				} else if (res.code == 2) {
					//展示校验页面
					$("#submitForm").hide();
					$("#importCheckDiv").show();
					var userList = res.userList;
					$("#contentTalbe td").remove();
					var html = "";
					$.each(userList,function(i, item){
						if(item.rowNum!=null&&item.rowNum!=""){
							html += "<tr>";
							html += "<td>"+ item.rowNum +"</td>";
							html += "<td>"+ item.userAlias +"</td>";
							html += "<td>"+ item.userNum +"</td>";
							html += "<td>"+ item.userName +"</td>";
							html += "<td>"+ item.areaName +"</td>";
							html += "<td>"+ item.memo +"</td>";
							html += "<td>"+ item.validResult +"</td>";
							html += "</tr>";
						}
					});
					$("#contentTable").append(html);
				} else {
					ldDialog.alert(res.reason);
				}
				ldDialog.unmask();
				window.clearInterval(interval);
			}
		});
	}

	//获取后台关于进度的信息
	function getMaskInfo() {
		var url = "${basePath}coreAjax/userImport!getMaskInfo.action";
		$.ajax({
			url : url,
			type : 'post',
			data : {},
			dataType : 'text',
			timeout : 60000,
			error : function(e) {
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.maskInfo != null && res.maskInfo != '') {
					ldDialog.mask(res.maskInfo);
				}
			}

		});
	}
</script>
</head>

<body>
	<form id="submitForm" enctype="multipart/form-data" method="post">
		<div class="dialogTop">
			<table width="100%" border="0" cellspacing="1" align="center"
				cellpadding="0">
				<tr>
					<td width="200" align="right">选择导入的文件：</td>
					<td><input type="file" name="upload" id="upload"
						class="img-input-disable" /> <FONT color=red>*</FONT></td>
				</tr>
				<tr>
					<td width="200" align="right">用户导入模版下载：</td>
					<td><a href="template/userImportTemplate.xls"
						style="color: #ff7800">下载用户导入模板</a></td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<input type="button" value="确 定" class="ldBtnGreen"
					onclick="return checkSubmit();" />
			</div>
		</div>
	</form>

	<div id="importCheckDiv" class="roadbody" style="display: none;">
		<div class="righttitle">
			<div class="tab2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="tabl">&nbsp;</td>
						<td class="tabm">校验文件结果</td>
						<td class="tabr">&nbsp;</td>
					</tr>
				</table>
			</div>
			<div class="tab4" id="error">
				<%--${error}--%>
			</div>
		</div>
		<div class="divtable">
			<table width="100%" border="0" cellspacing="1" cellpadding="0"
				id="contentTable" class="ld-datagrid">
				<tr>
					<th>excel行号</th>
					<th>登录名称</th>
					<th>用户编码</th>
					<th>用户全称</th>
					<th>所在部门</th>
					<th>备注</th>
					<th>校验结果</th>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<input type="button" value="关 闭" class="ldBtnGray"
					onclick="window.location.reload();" />
			</div>
		</div>
	</div>
</body>
</html>

