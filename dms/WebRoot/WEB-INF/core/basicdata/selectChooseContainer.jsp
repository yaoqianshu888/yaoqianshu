<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<base target="_parent" />
<script type="text/javascript">
	var win = art.dialog.open.origin;
	function addItem(item) {
		var id = item.id;
		var name = item.name;
		if (!win.parent.checkItem(id)) {
			return false;
		}
		var html = "<div id=\"divId"+id+"\" class=\"multiplepageselectitem\">"
				+ name + "<div class=\"mpsiclosebtn\" onclick=\"removeThis("
				+ id + ",'" + name + "')\"></div></div>";
		$("#insertDiv").append(html);
		win.parent.addArr(item);
		parent.iframeResize(parent.chooseContainer);
		return true;
	}
	function removeThis(id, name) {
		var deleteId = document.getElementById("divId" + id);
		var parentNode;
		if (parentNode = deleteId.parentNode) {
			parentNode.removeChild(deleteId);
			win.parent.delArr(id);
		}
		parent.iframeResize(parent.chooseContainer);
	}
</script>
</head>
<body>
	<div class="dmg-list" id="wrap">
		<div class="dmg-list-body">
			<input type="hidden" id="chooseIds" name="chooseIds" value="">
			<div class="dmg-listli-tzry" id="insertDiv" style="margin-left: 250px;"></div>
		</div>
	</div>
</body>
</html>

