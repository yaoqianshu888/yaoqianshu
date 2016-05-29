<%@page language="java" contentType="text/html; charset=utf-8"%>
<html>
	<head>
		<script type="text/javascript">
			//公共弹出错误信息方法
			var alertSuccessInfo = true;
			function showSuccessInfo() {
				if (alertSuccessInfo != undefined && alertSuccessInfo == false) {
					return;
				}
				var successInfo = "${successInfo}";
				if (!isNull(successInfo)) {
					ldDialog.tips(successInfo);
				}
			}
			
			//页面添加错误弹出方法
			if (document.all){
				window.attachEvent('onload',showSuccessInfo);//IE中
			}else{
				window.addEventListener('load',showSuccessInfo,false);//firefox
			}
		</script>
	</head>
</html>
