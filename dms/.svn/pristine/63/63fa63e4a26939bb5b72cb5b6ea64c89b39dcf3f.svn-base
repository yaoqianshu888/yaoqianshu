<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<link href="${pageContext.request.contextPath}/core/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/core/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/core/plugins/artDialog/artDialog.source.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/core/plugins/artDialog/plugins/iframeTools.source.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/core/js/ui.js"></script>
		<script type="text/javascript">
			$(function(){
				var api = art.dialog.open.api;
				if(api != undefined){//dialog
					ldDialog.close("${returnValue}");
				}else{
					$("#confirmBtn").click(function(){
						if("${nextUrl}" != ""){
							window.location.href="${nextUrl}";
						}else{
							history.back();
						}
					});
				}
			});
		</script>
	</head>
	<body>
		<div class="doing">
			<div class="font24">
				您的操作已成功！
			</div>
			<div></div>
			<div class="centent">
				<input type="button" id="confirmBtn" value="确定" class="ldBtnGreen"/>
			</div>
		</div>
	</body>
</html>



