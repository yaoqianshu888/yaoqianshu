<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<script type="text/javascript">
	var win = art.dialog.open.origin;
	function addItem(item) {
		win.parent.chooseContainer.addItem(item);
	}
	function iframeResize(iframe) {
		try {
			var idocumentElement = iframe.contentWindow.document.documentElement;
			iframe.height = idocumentElement.scrollHeight;
		} catch (e) {
			window.status = 'Error: ' + e.number + '; ' + e.description;
		}
	}
</script>
</head>
<body height="100%">
	<c:if test="${chooseType == 1}">
		<div class="dialogTop">
	</c:if>
	<div>
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0" style="height: inherit;">
			<tr>
				<td width="230" valign="top" class="tree">
					<iframe
						src="${basePath}core/userForChoose!areaForChooseUserTree.action?role.id=${role.id}&areaMark=${areaMark}&chooseType=${chooseType}"
						name="areaTree" width="230" height="600" marginwidth="0"
						marginheight="0" frameborder="0" onload="iframeResize(this);"
						scrolling="no"> </iframe>
				</td>
				<td valign="top">
					<iframe
						src="${basePath}core/userForChoose!search.action?role.id=${role.id}&areaMark=${areaMark}&chooseType=${chooseType}"
						id="userList" name="userList" width="100%"
						onload="iframeResize(this);" marginwidth="0" marginheight="0"
						frameborder="0"></iframe>
				</td>
			</tr>
		</table>
	</div>
	<c:if test="${chooseType == 1}">
		<div class="dialogBottom">
			<div class="btns">
				<input type="button" class="ldBtnGray" value="关闭"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</c:if>
</body>
</html>