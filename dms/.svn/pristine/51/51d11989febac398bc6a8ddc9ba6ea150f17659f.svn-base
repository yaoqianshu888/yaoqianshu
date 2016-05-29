<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
$(function(){
	var url = "${basePath}coreAjax/areaSearch!getAreaDetail.action?area.id=${area.id}";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		success : function(result) {
			var res = eval('(' + result + ')');
			if (res.code == 1) {
				var area = res.bean;
				$("#areaMark").append(area.areaMark);
				$("#areaName").append(area.areaName);
				$("#available").append(area.availableOptionDisplay);
				$("#memo").append(area.memo);
			} else {
				ldDialog.alert(res.reason);
			}
			ldDialog.unmask();
		},
		error : function() {
			ldDialog.unmask();
		}
	});
});
</script>
</head>

<body>
	<div class="dialogTop">
		<table width="400" border="0" align="center" cellpadding="0"
			cellspacing="10" class="ld-detailTable">
			<tr>
				<td width="50" class="right evenTrBgColor">部门编码：</td>
				<td width="210" id="areaMark">
				</td>
			</tr>
			<tr>
				<td width="50" class="right evenTrBgColor">部门名称：</td>
				<td width="210" id="areaName">
				</td>
			</tr>
			<tr>
				<td width="50" class="right evenTrBgColor">状态：</td>
				<td width="210" id="available">
				</td>
			</tr>
			<tr>
				<td class="right evenTrBgColor">备注：</td>
				<td id="memo">
				</td>
			</tr>
		</table>
	</div>
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" class="ldBtnGray" value="关闭"
				onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>