<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function showItem(id) {
		ldDialog.openMini(
				"${basePath}core/projectSearch!detail.action?project.id=" + id,
				"项目详情", function(window) {

				});
	}
	function addItem() {
		ldDialog.openMini("${basePath}core/projectInsert!prepare.action",
				"项目新增", function(window) {
					var returnValue = window.returnValue;
					if (returnValue == undefined) {//无返回值 直接关闭 
						return true;
					} else {//有返回值 处理一些事
						ldDialog.tips("处理成功！");
						loadData(1);
						return true;
					}
				});
	}
	function editItem(id) {
		ldDialog
				.openMini(
						"${basePath}core/projectUpdate!prepare.action?project.id="
								+ id,
						"项目编辑",
						function(window) {
							var returnValue = window.returnValue;
							if (returnValue == undefined) {//无返回值 直接关闭 
								return true;
							} else {//有返回值 处理一些事
								ldDialog.tips("处理成功！");
								var curPageNum = $("input[name='pager.curPageNum']").val();
								loadData(curPageNum);
								return true;
							}
						});
	}
	function deleteItems() {
		var ids = getAllChose("delete");
		if (ids == "") {
			ldDialog.alert("请先选择要删除的项");
			return;
		}
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除这些项吗？", function() {
			var url = "${basePath}coreAjax/projectSearch!deleteProject.action?" + param;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "text",
				success : function(result) {
					var res = JSON.parse(result);
					if (res.code == 1) {
						ldDialog.tips("处理完成");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
					} else {
						ldDialog.alert(res.reason);
					}
				},
				error : function() {
					
				}
			});
		});
	}
	
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/projectSearch!searchProject.action";
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
						html += "<td>"+ item.id +"</td>";
						html += "<td>"+ item.projectName +"</td>";
						html += "<td>";
					<ld:check mark="projectDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='showItem("+item.id+");' />&nbsp;";
					</ld:check>
					<ld:check mark="projectUpdate">
						html += "<input type='button' value='编辑' class='ldBtnLink' onclick='editItem("+item.id+");' />&nbsp;";
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
								<table class="rightseach2">
									<div class="conditionsrow">
										<div class="conditionsitem">
											<div class="conditionsitemL">项目名称：</div>
											<div class="conditionsitemR">
												<input name="project.projectName" class="ldText" style="width:144px" id="project.projectName"
													value="${project.projectName}" />
											</div>
										</div>
									</div>
								</table>
							</div>
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>

												<ld:check mark="projectInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
												</ld:check>
												<ld:check mark="projectDelete">
													<input type="button" value="删除" class="ldBtnGray" onclick="deleteItems();" />
												</ld:check>
											</td>
										</tr>
									</table>
								</div>
								<div class="toolbarR">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<input id="searchBtn" type="button" class="ldBtnBlue" value="查询" />
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="yhlist2">
				<form method="post" name="deleteForm" id="deleteForm">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
						<tr>
							<th id="checkboxAllTh">
							</th>
							<th>项目ID</th>
							<th>项目名称</th>
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
								<ld:check mark="projectInsert">
									<input type="button" class="ldBtnGray" value="新增" onclick="addItem();" />
								</ld:check>
								<ld:check mark="projectDelete">
									<input type="button" value="删除" class="ldBtnGray" onclick="deleteItems();" />
								</ld:check>
							</td>
						</tr>
					</table>
				</div>
				<div class="toolbarR">
						<div class="ldPager">
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

