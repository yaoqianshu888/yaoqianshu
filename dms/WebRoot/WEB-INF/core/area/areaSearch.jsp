<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	function addItem() {
		var superAreaId = $("#superAreaId").val();
		ldDialog.open(
				"${basePath}core/areaInsert!prepare.action?area.superAreaId="
						+ superAreaId, "添加部门", function(window) {
					var returnValue = window.returnValue;
					if (returnValue != undefined) {
						ldDialog.tips("部门新增成功！");
						var win = art.dialog.open.origin;
						win.parent.areaTree.location.reload();
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
						return true;
					}
				}, 400, 320);
	}
	function editItem(id) {
		ldDialog.open(
				"${basePath}core/areaUpdate!prepare.action?area.id=" + id,
				"修改部门", function(window) {
					var returnValue = window.returnValue;
					if (returnValue == undefined) {
						return true;
					} else {
						ldDialog.tips("部门修改成功！");
						var win = art.dialog.open.origin;
						win.parent.areaTree.location.reload();
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
						return true;
					}
				}, 400, 320);
	}
	function updateStatus(id) {
		var url = "${basePath}coreAjax/areaUpdate!updateStatus.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : {
				'area.id' : id
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("处理成功");
				} else {
					ldDialog.alert(res.reason);
				}
				ldDialog.unmask();
			},
			error : function() {

			}
		});
	}
	function detailItem(id) {
		ldDialog
				.open(
						"${basePath}core/areaSearch!getAreaDetail.action?area.id="
								+ id, "部门详情", function(window) {
						}, 400, 320);
	}
	function deleteItems() {
		var ids = getAllChose("delete");
		if (ids == "") {
			ldDialog.alert("请先选择要删除的项");
			return;
		}
		$("#checkboxAll").attr("disabled", "disabled");
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("是否确认删除？", function() {
			var url = "${basePath}coreAjax/areaSearch!delete.action?" + param;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "text",
				success : function(result) {
					var res = JSON.parse(result);
					if (res.code == 1) {
						ldDialog.tips("删除成功");
						var win = art.dialog.open.origin;
						win.parent.areaTree.location.reload();
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
					} else {
						ldDialog.alert(res.reason);
					}
					return;
				},
				error : function() {
					
				}
			});
		});
	}
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/areaSearch!search.action";
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
						html += "<td><input type=\"checkbox\" name=\"delete\" id=\"delete\" class=\"ldCheckbox\" value=\""+item.id+"\" /></td>";
						html += "<td>"+ (i+1) +"</td>";
						html += "<td>"+ item.areaMark +"</td>";
						html += "<td>"+ item.areaName +"</td>";
						html += "<td>";
						html += "<a href='javascript:void(0);' onclick='updateStatus("+item.id+");'>";
						if(item.available==1){
							html += "<input type='checkbox' class='ldSwitch' checked/>";
						}else{
							html += "<input type='checkbox' class='ldSwitch' />";
						}
						html += "</a>";
						html += "</td>";
						
						html += "<td>";
					<ld:check mark="areaDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='detailItem("+item.id+");' /> ";
					</ld:check>
					<ld:check mark="areaUpdate">
						html += "<input type='button' value='编辑' class='ldBtnLink' onclick='editItem("+item.id+");' /> ";
					</ld:check>
						html += "</td>";
					
						html += "</tr>";
					});
					$("#contentTable").append(html);
					//需要全选功能
					$("#checkboxAllTh").empty();
					$("#checkboxAllTh").append("<input type=\"checkbox\" name=\"deleteAll\" class=\"ldCheckbox all\" id=\"checkboxAll\" />");
					ldDialog.unmask();
				}else{
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
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
				<div class="conditionsbox">
					<form id="searchForm" method="post">
						<input type="hidden" id="superAreaId" name="superAreaId" value="${superAreaId }">
						<div class="yhlist1">
							<div class="yhlist1L">查询条件</div>
						</div>
						<div class="yhlist2">
							<div class="conditionsrow">
								<div class="conditionsitem">
									<div class="conditionsitemL">编码：</div>
									<div class="conditionsitemR">
										<input type="text" class="ldText" name="area.areaMark" value="${area.areaMark}" maxlength="20" />
									</div>
									<div class="conditionsitemL">部门名称：</div>
									<div class="conditionsitemR">
										<input type="text" class="ldText" name="area.areaName" value="${area.areaName}" maxlength="20" />
									</div>
									<div class="conditionsitemL">状态：</div>
									<div class="conditionsitemR">
										<ld:select name="area.available" value="${area.available }" groupName="availableAll"
											className="ldSelect select144" />
									</div>
								</div>
							</div>
						</div>

						<div class="yhlist3">
							<div class="toolbarL">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<ld:check mark="areaInsert">
												<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
											</ld:check>
											<ld:check mark="areaDelete">
												<input type="button" class="ldBtnGray" value="删除" onclick="deleteItems();" />
											</ld:check>
										</td>
									</tr>
								</table>
							</div>
							<div class="toolbarR">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<input id="searchBtn" type="button" class="ldBtnBlue" value="查询" onclick="" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form>
				</div>
				<div class="yhlist2">
					<form name="deleteForm" method="post" id="deleteForm">
						<table id="contentTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="ld-datagrid">
							<tr>
								<th id="checkboxAllTh"></th>
								<th>序号</th>
								<th>编码</th>
								<th>部门名称</th>
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
								<td>
									<ld:check mark="areaInsert">
										<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
									</ld:check>
									<ld:check mark="areaDelete">
										<input type="button" class="ldBtnGray" value="删除" onclick="deleteItems();" />
									</ld:check>
								</td>
							</tr>
						</table>
					</div>
					<div class="toolbarR">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<div class="ldPager"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>