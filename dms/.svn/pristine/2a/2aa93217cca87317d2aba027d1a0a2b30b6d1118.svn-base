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
	<div class="dialogTop">
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="200" valign="top" class="tree">
					<iframe
						src="${basePath}core/areaForChoose!areaForChooseTree.action?notChooseIds=${notChooseIds}"
						name="areaForChooseTree" width="200" marginwidth="0" height="100%"
						onload="iframeResize(this);" marginheight="0" frameborder="0"
						scrolling="no"> </iframe>
				</td>
				<td valign="top">
					<iframe
						src="${basePath}core/areaForChoose!search.action?chooseType=1&notChooseIds=${notChooseIds}&superAreaId=1"
						id="areaForChooseList" name="areaForChooseList" width="100%"
						onload="iframeResize(this);" marginwidth="0" marginheight="0"
						frameborder="0"> </iframe>
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