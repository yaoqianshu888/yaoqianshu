<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function addItem() {
		if (${role.id} == '0') {
			ldDialog.alert("请先在左边选择要管理的角色");
			return;
		}
		var notChooseIds = getAllChose("delete");
		if (!isNull(notChooseIds)) {
			notChooseIds = notChooseIds.substring(1);
		}
		var url = "${basePath}core/selectForChoose.action?"
				+ "selectAction=${basePath}core/userForChoose!userForChooseFrame.action?role.id=${role.id}$chooseType=2$notChooseIds="
				+ notChooseIds;
		ldDialog.open(url,"添加角色用户",
				function(window) {
					var items = window.returnValue;
					if (items != undefined) {
						var userIds = "";
						for (var i = 0; i < items.length; i++) {
							var user = items[i];
							userIds = userIds + "," + user.id;
						}
						if (userIds != "") {
							userIds = userIds.substring(1);
						}
						$.ajax({
							type : "POST",
							url : "${basePath}coreAjax/roleUserInsert!insertRoleUser.action?role.id=${role.id}",
							dataType : "text",
							data : {
								'userIds' : userIds
							},
							success : function(result) {
								var data = JSON.parse(result);
								if (data.code == undefined || data.code == 1) {
									ldDialog.tips("处理成功");
									loadData(1);
								} else {
									ldDialog.alert(data.reason);
								}
								ldDialog.unmask();
							},
							error : function() {
		
							}
						});
						return true;
					}
				}, 1200, 600);
	}

	function deleteItems() {
		var ids = getAllChose("delete");
		if (ids == "") {
			ldDialog.alert("请先选择要删除的项");
			return;
		}
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除吗？", function() {
			$.ajax({
				type : "POST",
				url : "${basePath}coreAjax/roleUserSearch!deleteRoleUser.action?" + param,
				dataType : "text",
				success : function(result) {
					var data = JSON.parse(result);
					if (data.code == undefined || data.code == 1) {
						ldDialog.tips("删除成功");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
					} else {
						ldDialog.alert(data.reason);
					}
					ldDialog.unmask();
				},
				error : function() {

				}
			});
		});
	}

	function detailItem(id) {
		ldDialog.openMini("${basePath}core/userSearch!getUserDetail.action?user.id="
								+ id, "用户详情");
	}
	
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/roleUserSearch!searchUserByRole.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			data : {
				'pager.curPageNum' : curPageNum,
				'role.id' : ${role.id}
			},
			async:false,
			success : function(result) {
				$("#contentTable td").remove();
				var res = JSON.parse(result);
				if(res.code == 1){
					var items = res.list;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					
					var role = res.role;
					var showTypeTh = "角色名称";
					var flag = false;
					if(role != null && role.id != 0){
						showTypeTh = "序号";
						flag = true;
					}
					$("#showTypeTh").text(showTypeTh);
					
					//需要全选功能
					$("#checkboxAllTh").empty();
					$("#checkboxAllTh").append("<input type=\"checkbox\" name=\"deleteAll\" class=\"ldCheckbox all\" id=\"checkboxAll\" />");
					
					var html = "";
					$.each(items,function(i, item){
						html += "<tr>";
						html += "<td><input type=\"checkbox\" name=\"delete\" id=\"delete\" class=\"ldCheckbox\" value=\""+item.id+"\" /></td>";
						if(!flag){
							html += "<td>"+ item.role.roleName +"</td>";
						}else{
							html += "<td>"+ (i+1) +"</td>";
						}
						html += "<td>"+ item.user.userAlias +"</td>";
						html += "<td>"+ item.user.userNum +"</td>";
						html += "<td>"+ item.user.userName +"</td>";
						
						html += "<td>"+ item.user.availableOptionDisplay +"</td>";
						
						html += "<td>";
					<ld:check mark="userDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='detailItem("+item.user.id+");' style=\"cursor: pointer;\" />&nbsp;";
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
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist3">
				<div class="toolbarL">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><ld:check mark="roleUserInsert">
									<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
								</ld:check> <ld:check mark="roleUserDelete">
									<input type="button" value="删除" class="ldBtnGray" onclick="deleteItems();" />
								</ld:check></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="yhlist2">
				<form name="deleteForm" method="post" id="deleteForm">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
						<tr>
							<th id="checkboxAllTh">
							</th>
							<th id="showTypeTh"></th>
							<th>登录名称</th>
							<th>用户编码</th>
							<th>用户全称</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</table>
				</form>
			</div>
			<div class="yhlist3">
				<div class="toolbarL">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><ld:check mark="roleUserInsert">
									<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
								</ld:check> <ld:check mark="roleUserDelete">
									<input type="submit" value="删除" class="ldBtnGray" onclick="deleteItems();" />
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