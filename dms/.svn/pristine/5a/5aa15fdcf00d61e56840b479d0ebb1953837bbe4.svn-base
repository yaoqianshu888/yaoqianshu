<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<link rel="stylesheet" href="${basePath}core/plugins/ztree/skin/zTree.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}core/plugins/ztree/skin/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${basePath}core/plugins/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
	var setting = {
		view : {
			dblClickExpand : dblClickExpand
		},
		data : {
			simpleData : {
				enable : true,
				pIdKey : "upId"
			}
		}
	};

	function dblClickExpand(treeId, treeNode) {
		return treeNode.level > 0;
	}

	$(document).ready(function() {
		var url = "${basePath}coreAjax/roleSearch!roleTree.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			async:false,
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					var zNodes = JSON.parse(res.treeJson);
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
					ldDialog.unmask();
				} else {
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
	});
</script>
</head>
<body style="width:100%;overflow-y:hidden;background-color: #fff;">
	<div>
		<ul id="treeDemo" class="ztree"
			style="border:1px solid #ccc;background-color: rgb(250, 250, 250);padding-bottom:50px;"></ul>
	</div>
</body>
</html>

