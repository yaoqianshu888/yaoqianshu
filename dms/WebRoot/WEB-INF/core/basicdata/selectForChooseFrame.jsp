<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<script type="text/javascript">
	function iframeResize(iframe) {
		try {
			var idocumentElement = iframe.contentWindow.document.documentElement;
			iframe.height = idocumentElement.scrollHeight;
		} catch (e) {
			window.status = 'Error: ' + e.number + '; ' + e.description;
		}
	}

	var arr = new Array();
	var items = new Array();
	function checkItem(id) {
		if (arr != null) {
			for (var i = 0; i < arr.length; i++) {
				if (id == arr[i]) {
					return false;
				}
			}
		}
		return true;
	}
	function delArr(id) {
		if (arr != null) {
			for (var i = 0; i < arr.length; i++) {
				if (id == arr[i]) {
					arr.splice(i, 1);
				}
			}
		}
		if (items != null) {
			for (var i = 0; i < items.length; i++) {
				var item = items[i];
				if (id == item.id) {
					items.splice(i, 1);
				}
			}
		}
	}
	function addArr(item) {
		arr.push(item.id);
		items.push(item);
	}

	function selectComplete() {
		if (arr != null && arr.length != 0) {
			var win = art.dialog.open.origin;
			ldDialog.close(items);
		} else {
			ldDialog.alert("请选择条目");
		}
		return;
	}
</script>
<body height="100%" style="overflow-x:hidden;margin-bottom:50px;">
	<div class="dialogTop">
		<table width="100%" height="100%" border="0" cellspacing="0"
			style="height: inherit;" cellpadding="0">
			<tr>
				<td>
					<iframe src="${selectAction}" name="searchForChoose"
						id="searchForChoose" width="100%" marginwidth="0"
						onLoad="iframeResize(this);" marginheight="0" frameborder="0">
					</iframe>
					<iframe
						src="${basePath}core/selectForChoose!chooseContainer.action"
						name="chooseContainer" width="100%" marginwidth="0"
						marginheight="0" frameborder="0"> </iframe>
				</td>
			</tr>
		</table>
	</div>
	<div class="dialogBottom">
		<div class="btns">
			<input type="button" class="ldBtnGreen" value="确定"
				onclick="selectComplete();" />
			<input type="button" class="ldBtnGray" value="关闭"
				onclick="ldDialog.close();" />
		</div>
	</div>
</body>
</html>


