<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>易通MPOS平台</title>
<base href="<%=basePath%>" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="${basePath}core/css/index.css" rel="stylesheet" type="text/css" />
<link href="${basePath}core/plugins/artDialog/skins/blue.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}core/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/artDialog/artDialog.source.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/artDialog/plugins/iframeTools.source.js"></script>
<script type="text/javascript"
	src="${basePath}core/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${basePath}core/js/index.js"></script>
<script type="text/javascript" src="${basePath}core/js/ui.js"></script>
<script type="text/javascript">
	$(function() {
		var url = "${basePath}moneyJinliang/userExtraInsert!isExpire.action";
		$.ajax({
			type : "post",
			url : url,
			dataType : "json",
			success : function(res) {
				if(res[0].code == 1){
					$("#scrollobj").show();
					ldDialog.unmask();
				}else{
					
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});

	});
	
	function logout() {
		top.location.href = "${basePath}core/userLogin!logout.action?actionName=userLogin&nameSpace=/core&method=logoutControl";
	}
	function changePassword() {
		ldDialog.open("${basePath}core/userUpdatePassword!prepare.action",
				"修改密码", function(window) {
				}, 300, 300);
	}
	function scroll(obj) {
		var tmp = (obj.scrollLeft)++;
		//当滚动条到达右边顶端时
		if (obj.scrollLeft==tmp) obj.innerHTML += obj.innerHTML;
		//当滚动条滚动了初始内容的宽度时滚动条回到最左端
		if (obj.scrollLeft>=obj.firstChild.offsetWidth) obj.scrollLeft=0;
	}
	setInterval("scroll(document.getElementById('scrollobj'))",20);
</script>
</head>
<body style="overflow: hidden;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!-- 头部开始 -->
		<tr style="height: 70px;">
			<td>
				<div>
					<div class="headerbg"><DIV id="scrollobj" style="white-space:nowrap;overflow:hidden;width:300px;float:left;color:red;margin-left:25%;margin-top:20px;font-size:20px;display:none">
											即将到期，请联系管理员进行缴费！
										  </DIV> 
						<div class="header-l">
							<div class="headerfun">
								<span class="userinfo">${sessionUser.userName} </span>
								|
								<span class="loginout">
									<a href="javascript:void(0);" onclick="changePassword();">修改密码</a>
								</span>
								|
								<span class="loginout">
									<a href="javascript:void(0);" onclick="logout();">退出</a>
								</span>
							</div>
						</div>
						<div class="header-r"></div>
					</div>
				</div>
			</td>
		</tr>
		<!-- 头部结束 -->
		<!-- 导航开始 -->
		<tr style="height: 33px;">
			<td>
				<div class="nav">
					<ul>
						<li class="nav_itemon nav_noclose" id="tab_welcome">
							<div class="navtitle" onclick="activateTab('welcome');">首页</div>
						</li>
					</ul>
					<div class="delbody" onclick="showlist();">
						<div class="alltabbox">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="alltabbox-item" onclick="removeAllTab();">
									<td class="alltabbox-item-iconcloseall">&nbsp;</td>
									<td class="alltabbox-item-text">关闭全部</td>
									<td class="alltabbox-item-noclose">&nbsp;</td>
								</tr>
								<tr class="separator">
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tbody id="alltabbox-tbd1">
									<tr class="alltabbox-item" id="alltabbox-item_welcome">
										<td class="alltabbox-item-iconselected">&nbsp;</td>
										<td class="alltabbox-item-text"
											onclick="activateTab('welcome');">首页</td>
										<td class="alltabbox-item-noclose">&nbsp;</td>
									</tr>
								</tbody>
								<tbody id="alltabbox-tbd2"></tbody>
							</table>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="loadingmark"></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="contentTable">
					<tr>
						<td valign="top" id="menuTd" style="width: 160px;">
							<iframe class="contentFrame" width="100%" height="100%"
								src="${basePath}mainFormMenu.action"
								frameborder="0" scrolling="no"></iframe>
						</td>
						<td width="7" valign="middle" class="middlebut">
							<div class="middlebutbg_l" onclick="menuToggle();"></div>
						</td>
						<td valign="top" id="contentTd">
							<iframe id="if_welcome" class="contentFrame tabIframe"
								width="100%" height="100%"
								src="${basePath}core/userDetail!userInfo.action" frameborder="0"></iframe>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 底部开始 -->
		<tr style="height: 30px;">
			<td>
				<div id="footer" class="footer">
					<div class="footertxt">版权所有联迪商用设备有限公司</div>
				</div>
			</td>
		</tr>
		<!-- 底部结束 -->
	</table>
</body>
</html>
