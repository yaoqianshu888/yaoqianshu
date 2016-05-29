<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<title>易通MPOS平台</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@include file="include/error.jsp"%>
<%@include file="include/success.jsp"%>
<base href="<%=basePath%>" />
<base target="_self"></base>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="0" />
<link href="${basePath}core/css/chosen.css" rel="stylesheet" type="text/css" />
<link href="${basePath}core/css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath}core/css/main.css" rel="stylesheet" type="text/css" />
<link href="${basePath}core/plugins/artDialog/skins/blue.css"
	rel="stylesheet" type="text/css" />
<link href="${basePath}core/plugins/dhtmlxMenu/skins/terrace/dhtmlxmenu.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}core/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}core/js/jquery.chosen.min.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/layer/layer.min.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/my97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/dhtmlxMenu/codebase/dhtmlxmenu.js"></script>
<script type="text/javascript" src="${basePath}core/js/validator.js"></script>
<script type="text/javascript" src="${basePath}core/js/ui.js"></script>
<script type="text/javascript" src="${basePath}core/js/util.js"></script>
<script type="text/javascript" src="${basePath}core/js/json2.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			cache : false,
			beforeSend : function() {
				ldDialog.mask();
			},
			success : function(result, status) {
				ldDialog.unmask();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				ldDialog.alert("连接服务器失败:" + textStatus);
				ldDialog.unmask();
			},
			complete: function (XMLHttpRequest, status) {
				var res = JSON.parse(XMLHttpRequest.responseText);
				if(res.redirectUrl != null){
					window.location.href = res.redirectUrl;
				}
			}
		});
		$("form").submit(function(){
			ldDialog.mask();
		});
	});
</script>
<%@include file="include/pager.jsp"%>