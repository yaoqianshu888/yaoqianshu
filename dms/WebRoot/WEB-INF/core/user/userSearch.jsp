<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">

	function setLimit(id){
		ldDialog
				.openMini(
						"${basePath}moneyJinliang/userExtraInsert!prepare.action?user.id="
								+ id, "吃数上限设置", function(window) {
						});
	}
	
	function resetPassword(id) {
		ldDialog.confirm(
						"确定重置密码吗？",
						function() {
							var url = "${basePath}coreAjax/userUpdate!resetPassword.action?user.id="
									+ id;
							$.post(url, function(result) {
								var res = JSON.parse(result);
								ldDialog.alert(res.tip);
								ldDialog.unmask();
							});
						});
	}
	function setAvailable(id) {
		var url = "${basePath}coreAjax/userUpdate!updateStatus.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : {
				'user.id' : id
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("处理完成");
				} else {
					ldDialog.alert(res.reason);
					var curPageNum = $("input[name='pager.curPageNum']").val();
					loadData(curPageNum);
				}
				ldDialog.unmask();
			},
			error : function() {

			}
		});
	}
	function addItem() {
		ldDialog.openMini("${basePath}core/userInsert!prepare.action", "添加用户",
				function(window) {
					var returnValue = window.returnValue;
					if (returnValue == undefined) {//无返回值 直接关闭 
						loadData(1);
						return true;
					} else {//有返回值 处理一些事
						ldDialog.alert("密码：" + returnValue);
						loadData(1);
						return true;
					}
				});
	}

	function showItem(id) {
		ldDialog
				.openMini(
						"${basePath}core/userSearch!getUserDetail.action?user.id="
								+ id, "用户详情", function(window) {
						});
	}

	function editItem(id) {
		ldDialog.openMini("${basePath}core/userUpdate!prepare.action?user.id="
				+ id, "编辑用户", function(window) {
			var returnValue = window.returnValue;
			if (returnValue == undefined) {//无返回值 直接关闭 
				return true;
			} else {//有返回值 处理一些事
				ldDialog.tips("处理成功");
				var curPageNum = $("input[name='pager.curPageNum']").val();
				loadData(curPageNum);
				return true;
			}
		});
	}
	
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/userSearch!searchUser.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : $("#searchForm").serialize()+"&pager.curPageNum="+curPageNum,
			async:false,
			success : function(result) {
				$("#contentTable td").remove();
				var res = eval('(' + result + ')');
				if(res.code == 1){
					var items = res.list;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					var html = "";
					$.each(items,function(i, item){
						html += "<tr>";
						html += "<td>"+ (i+1) +"</td>";
						html += "<td>"+ item.userAlias +"</td>";
						html += "<td>"+ item.userNum +"</td>";
						html += "<td>"+ item.userName +"</td>";
						
						html += "<td>";
					<ld:rightMark>
					<ld:check mark="userStatusUpdate">
						html += "<a href='javascript:void(0);' onclick='setAvailable("+item.id+");'>";
						if(item.available==1){
							html += "<input type='checkbox' class='ldSwitch' checked/>";
						}else{
							html += "<input type='checkbox' class='ldSwitch' />";
						}
						html += "</a>";
					</ld:check>
					<ld:fail>
						if(item.available==1){
							html += "<input type='checkbox' class='ldSwitch' checked disabled='disabled' />";
						}else{
							html += "<input type='checkbox' class='ldSwitch' disabled='disabled' />";
						}
					</ld:fail>
					</ld:rightMark>
						html += "</td>";
						
						var createTime = new Date(item.createTime).format("yyyy-MM-dd HH:mm:ss");
						html += "<td>"+ createTime +"</td>";
						html += "<td>"+ item.creator.userName +"</td>";
						
						html += "<td>";
					<ld:check mark="userDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='showItem("+item.id+");' />&nbsp;";
					</ld:check>
					<ld:check mark="userUpdate">
						html += "<input type='button' value='编辑' class='ldBtnLink' onclick='editItem("+item.id+");' />&nbsp;";
					</ld:check>
					<ld:check mark="userPasswordReset">
						html += "<input type='button' value='密码重置' class='ldBtnLink' onclick='resetPassword("+item.id+");' />&nbsp;";
					</ld:check>
					<ld:check mark="userLimit">
						html += "<input type='button' value='设置吃数上限与到期时间' class='ldBtnLink' onclick='setLimit("+item.id+");' />";
					</ld:check>
						html += "</td>";
					
						html += "</tr>";
					});
					$("#contentTable").append(html);
					ldDialog.unmask();
				}else{
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
		addTableCss();
		initCheckboxAndRadio();
		initSkip();
	}
	$(function(){
		loadData(1);
		$("#searchBtn").bind("click", function(){
			loadData(1);
		});
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="searchForm" method="post">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div class="yhlist1L">查询条件</div>
							</div>
							<div class="yhlist2">
								<div class="conditionsrow">
									<div class="conditionsitem">
										<div class="conditionsitemL">登录名称：</div>
										<div class="conditionsitemR">
											<input name="user.userAlias" class="ldText input138" id="user.userAlias" value="${user.userAlias}" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">用户编码：</div>
										<div class="conditionsitemR">
											<input name="user.userNum" class="ldText input138" id="user.userNum" value="${user.userNum}" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">用户全称：</div>
										<div class="conditionsitemR">
											<input name="user.userName" class="ldText input138" id="user.userName" value="${user.userName}" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">用户状态：</div>
										<div class="conditionsitemR">
											<ld:select id="user.available" name="user.available" groupName="availableAll" value="${user.available}"
												className="ldSelect select144" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="yhlist3">
						<div class="toolbarL">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><ld:check mark="userInsert">
											<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
										</ld:check></td>
								</tr>
							</table>
						</div>
						<div class="toolbarR">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><input id="searchBtn" type="button" class="ldBtnBlue" value="查询"/></td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="yhlist2">
				<table id="contentTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="ld-datagrid">
					<tr>
						<th>序号</th>
						<th>登录名称</th>
						<th>用户编码</th>
						<th>用户全称</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>创建人</th>
						<th>操作</th>
					</tr>
				</table>
			</div>
			<div class="yhlist3">
				<div class="toolbarL">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><ld:check mark="userInsert">
									<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
								</ld:check></td>
						</tr>
					</table>
				</div>
				<div class="toolbarR">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<div class="ldPager">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>