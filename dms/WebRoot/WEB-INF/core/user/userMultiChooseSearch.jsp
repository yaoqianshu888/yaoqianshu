<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<script type="text/javascript">
	<c:if test="${operateSuccess}">
		window.parent.rightTree.location.reload();
	</c:if>
	var userList = new Object();
	function selectItems() {
		var ids = getAllChose("select");
		if (ids == "") {
			ldDialog.alert("请先选择要添加的项");
			return;
		}
		var idsArray = ids.split(",");
		for (var i = 0; i < idsArray.length; i++) {
			var id = idsArray[i];
			$.each(userList,function(i, item){
				if (id == item.id) {
					var user = new Object();
					user.id = item.id;
					user.userName = item.userName;
					user.name = item.userName;
					user.userAlias = item.userAlias;
					user.userNum = item.userNum;
					window.parent.addItem(user);
				}
			});
		}

	}
	function detailItem(id) {
		ldDialog
				.openMini(
						"${basePath}core/userSearch!getUserDetail.action?user.id="
								+ id, "用户详情", function(window) {
						});
	}
	$(function() {
		parent.iframeResize(parent.searchForChoose);
	});
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/userForChoose!search.action?role.id=${role.id}&areaMark=${areaMark}&chooseType=${chooseType}";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			data : {
				'pager.curPageNum' : curPageNum
			},
			async:false,
			success : function(result) {
				console.info(result);
				$("#contentTable td").remove();
				var res = JSON.parse(result);
				if(res.code == 1){
					userList = res.list;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					
					//需要全选功能
					$("#checkboxAllTh").empty();
					$("#checkboxAllTh").append("<input type=\"checkbox\" name=\"selectAll\" class=\"ldCheckbox all\" id=\"checkboxAll\" />");
					
					var html = "";
					$.each(userList,function(i, item){
						html += "<tr>";
						html += "<td><input type=\"checkbox\" name=\"select\" id=\"select\" class=\"ldCheckbox\" value=\""+item.id+"\" /></td>";
						html += "<td>"+ (i+1) +"</td>";
						html += "<td>"+ item.userAlias +"</td>";
						html += "<td>"+ item.userNum +"</td>";
						html += "<td>"+ item.userName +"</td>";
						
						html += "<td>" + item.availableOptionDisplay + "</td>";
						
						html += "<td>";
					//<ld:check mark="userDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='detailItem("+item.id+");' style=\"cursor: pointer;\" />&nbsp;";
					//</ld:check>
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
			<div class="yhbox">
				<div class="yhlist2">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0"
						class="ld-datagrid">
						<tr>
							<th width="10%" id="checkboxAllTh">
							</th>
							<th>序号</th>
							<th>登录名称</th>
							<th>用户编码</th>
							<th>用户全称</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
				<div class="toolbarL">
					<input type="button" value="添加" class="ldBtnGreen"
						onclick="selectItems();" />
				</div>
				<div class="toolbarR">
					<div class="ldPager"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

