<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/logDeclare.jsp"%>
<html>
<body onload="init()">
	<script type="text/javascript">
		function init() {
			document.getElementById("user.userAlias").focus();
		}

		function changeToPwd() {
			if (event.keyCode == 13) {
				document.getElementById("user.password").focus();
			}
			return true;
		}
		function changeToCode() {
			if (event.keyCode == 13) {
				try{
					document.getElementById("code").focus();
				}catch(e){
					changeToSubmit();
				}
			}
			return true;
		}
		function changeToSubmit() {
			if (event.keyCode == 13) {
				formSubmit();
			}
		}
		function topCheck() {
			if (self != top) {
				top.location.href = "${basePath}index.action";
			}
		}
		topCheck();
		function formSubmit() {
			var userAlias = $("#user\\.userAlias").val();
			if (isNull(userAlias)) {
				$("#error").html("用户名不能为空");
				return false;
			}
			var password = $("#user\\.password").val();
			if (isNull(password)) {
				$("#error").html("密码不能为空");
				return false;
			}
// 			var code = $("#code").val();
// 			if (isNull(code)) {
// 				$("#error").html("验证码不能为空");
// 				return false;
// 			}
			form1.submit();
		}

		function cancleSubmit() {
			document.getElementById("user.userAlias").value = "";
			document.getElementById("user.password").value = "";
			document.getElementById("error").innerHTML = "";
		}


		$(function() {
			function changeCode() {
				$("#kaptchaImage").attr('src',
						'kaptcha.jpg?' + Math.floor(Math.random() * 100));
			}
			$("#kaptchaImage,#next_img").click(function() {
				changeCode();
			});
			$("#user.userAlias").focus();
		});
	</script>
	<div class="lobg1">
		<div id="loginbox">
			<form action="${basePath}core/userLogin!login.action" id="form1"
				method="post">
				<input type="hidden" value="/core" name="nameSpace" />
				<input type="hidden" value="userLogin" name="actionName" />
				<input type="hidden" value="execute" name="method" />
				<table width="1000" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td height="94">
							<img src="core/images/landi-logo2.png" width="303" height="46" />
						</td>
					</tr>
					<tr>
						<td height="476">
							<table width="900" border="0" align="center" cellpadding="0"
								cellspacing="10">
								<tr>
									<td width="552">
										<img src="core/images/images01.png" width="500" height="338" />
									</td>
									<td width="318" valign="top" class="lobg4">
										<table width="249" border="0" align="center" cellpadding="0"
											cellspacing="10">
											<tr>
												<td width="229" height="81" class="inputt">易通MPOS平台</td>
											</tr>
											<tr>
												<td>
													<input type="text" name="user.userAlias"
														onkeydown="changeToPwd();" id="user.userAlias" value=""
														class="loginput image1" />
												</td>
											</tr>
											<tr>
												<td>
													<input type="password" name="user.password" value=""
														id="user.password" onkeydown="changeToCode();"
														class="loginput image2" />
												</td>
											</tr>
											<!-- <tr>
												<td class="inputxx">
													<table width="230" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="140">
																<input class="loginput image3" name="code" id="code"
																	maxlength="4" onkeydown="changeToSubmit();"
																	style="width:95Px;" />
															</td>
															<td class="pl10" style="position:relative;">
																<img src="kaptcha.jpg" id="kaptchaImage"
																	style="padding-left: 5px;" title="点击我，换一张" width="100"
																	height="40" tabindex="-1" />
															</td>
														</tr>
													</table>
												</td>
											</tr> -->
											<c:if test="${not empty error}">
												<tr>
													<td class="inputxx" id="error">${error}&nbsp;</td>
												</tr>
											</c:if>
											<tr>
												<td>
													<img src="core/images/loginon.png" width="239" height="40"
														style="cursor: pointer;" onclick="formSubmit();"
														onmouseout="this.src='core/images/login.png'"
														onmousemove="this.src='core/images/loginon.png'" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>