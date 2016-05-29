<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhbox">
				<div class="yhlist2">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0"
						class="ld-datagrid">
						<tr>
							<th>序号</th>
							<th>登录名称</th>
							<th>用户编码</th>
							<th>用户全称</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
				<div class="toolbarR">
					<div class="ldPager"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		loadData(1);
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
				$("#contentTable td").remove();
				var res = JSON.parse(result);
				if(res.code == 1){
					userList = res.userList;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					
					var html = "";
					$.each(userList,function(i, item){
						html += "<tr>";
						html += "<td>"+ (i+1) +"</td>";
						html += "<td>"+ item.userAlias +"</td>";
						html += "<td>"+ item.userNum +"</td>";
						html += "<td>"+ item.userName +"</td>";
						
						html += "<td>" + item.availableOptionDisplay + "</td>";
						
						html += "<td>";
						html += "<input type=\"button\" class=\"ldBtnLink\" value=\"选择\" style=\"cursor: pointer;\""
							 +"onclick=\"selectItem('"+item.id+"|"+item.userName+"|"+item.userAlias+"|"+item.userNum+"')\" />";
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
	function selectItem(itemStr) {
		var array = itemStr.split("|");
		var user = new Object();
		user.id = array[0];
		user.userName = array[1];
		user.name = array[1];
		user.userAlias = array[2];
		user.userNum = array[3];
		var win = art.dialog.open.origin;
		win.parent.ldDialog.close(user);
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
</script>

