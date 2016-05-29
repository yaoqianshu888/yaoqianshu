<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
$(function(){
	loadData();
});
function loadData(){
	var url = "${basePath}coreAjax/projectSearch!getProjectDetail.action?project.id=${project.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res = eval("(" + result + ")");
			if (res.code == 1) {
				var project = res.bean;
				$("#projectName").append(project.projectName);
				$("#memo").append(project.memo);
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
<body>
	<div class="dialogTop">
		<table width="400" border="0" cellspacing="10" cellpadding="0" class="ld-detailTable">
			<tr>
				<td width="70" class="right evenTrBgColor">
					项目名称：
				</td>
				<td id="projectName">
				</td>
			</tr>
			<tr>
				<td width="100" class="right evenTrBgColor">备注：</td>
				<td id="memo">
				</td>
			</tr>
		</table>
	</div>
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" value="关 闭" class="ldBtnGray"
				onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>


