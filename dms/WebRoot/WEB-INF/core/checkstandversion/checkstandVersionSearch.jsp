<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
<script type="text/javascript">
	function showItem(id) {
		ldDialog.openSmall(
				"${basePath}core/checkstandVersionSearch!detail.action?checkstandVersion.id="
						+ id, "详情");
	}
	function addItem() {
		ldDialog
				.openSmall(
						"${basePath}core/checkstandVersionInsert!prepare.action",
						"新增",
						function(window) {
							var returnValue = window.returnValue;
							if (returnValue == undefined) {
								return true;
							} else {
								ldDialog.tips("处理成功！");
								loadData(1);
							}
						});
	}
	function editItem(id) {
		ldDialog.openSmall(
				"${basePath}core/checkstandVersionUpdate!prepare.action?checkstandVersion.id="
						+ id, "编辑", function(window) {
					var returnValue = window.returnValue;
					if (!!returnValue) {
						ldDialog.tips("处理成功！");
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
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
			$.ajax({
				type : "POST",
				url : "${basePath}coreAjax/checkstandVersionSearch!deleteCheckstandVersion.action?" + param,
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
	function check() {
		var versionNum = document
				.getElementById("checkstandVersion.versionNum");
		if (versionNum != null && versionNum.value != "") {
			if (!isNumber(versionNum.value)) {
				ldDialog.alert("版本编码只能是纯数字！！！");
				versionNum.focus();
				return false;
			}
			if (versionNum.value.substr(0, 1) == "0") {
				ldDialog.alert("请输入从1~9开头的数字！！！");
				versionNum.focus();
				return false;
			}
		}
		return true;
	}
	
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/checkstandVersionSearch!search.action";
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
						
						html += "<td>"+ item.project.projectName +"</td>";
						html += "<td>"+ item.platform.platformName +"</td>";
						html += "<td>"+ item.posType.typeName +"</td>";
						
						html += "<td>"+ item.versionNum +"</td>";
						html += "<td>"+ item.versionName +"</td>";
						
						html += "<td>"+ item.isForceUpdateOptionDisplay +"</td>";
						
						html += "<td>";
					<ld:check mark="checkstandVersionDetail">
						html += "<input type='button' value='详情' class='ldBtnLink' onclick='showItem("+item.id+");' />&nbsp;";
					</ld:check>
					<ld:check mark="checkstandVersionUpdate">
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
				<a target="_self" id="reload"
					href="${basePath}core/checkstandVersionSearch!query.action?pager.curPageNum=${pager.curPageNum}"
					style="display: none"></a>

				<form id="searchForm" method="post">
					<!-- 查询条件区域 -->
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div class="yhlist1L">查询条件</div>
							</div>
							<div class="yhlist2">
								<div class="conditionsrow">
									<div class="conditionsitem">
										<div class="conditionsitemL">项目名称</div>
										<div class="conditionsitemR">
											<ld:select value="${checkstandVersion.project.id}" groupName="project" name="checkstandVersion.project.id"
												className="ldSelect select144" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">平台</div>
										<div class="conditionsitemR">
											<ld:select value="${checkstandVersion.platform.id}" groupName="platform" name="checkstandVersion.platform.id"
												className="ldSelect select144" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">终端类型</div>
										<div class="conditionsitemR">
											<ld:select value="${checkstandVersion.posType.id}" groupName="posType" name="checkstandVersion.posType.id"
												className="ldSelect select144" />
										</div>
									</div>
									<div class="conditionsitem">
										<div class="conditionsitemL">版本编码</div>
										<div class="conditionsitemR">
											<input name="checkstandVersion.versionNum" type="text" class="ldText" id="checkstandVersion.versionNum"
												maxlength="8" value="${checkstandVersion.versionNum}" />
										</div>
									</div>
								</div>
							</div>
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><ld:check mark="checkstandVersionInsert">
													<input type="button" value="添加" class="ldBtnGray" onclick="addItem();" />
												</ld:check> <ld:check mark="checkstandVersionDelete">
													<input type="button" value="删除" class="ldBtnGray" onclick="deleteItems();" />
												</ld:check></td>
										</tr>
									</table>
								</div>
								<div class="toolbarR">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><input id="searchBtn" type="submit" class="ldBtnBlue" value="查询" /></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="yhlist2">
				<form id="deleteForm" method="post" name="deleteForm">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
						<tr>
							<th id="checkboxAllTh"></th>
							<th>项目名称</th>
							<th>平台</th>
							<th>设备类型</th>
							<th>版本编码</th>
							<th>版本名称</th>
							<th>是否强制升级</th>
							<th>操作</th>
						</tr>
					</table>
				</form>
			</div>
			<div class="yhlist3">
				<div class="toolbarL">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><ld:check mark="checkstandVersionInsert">
									<input type="button" value="添加" class="ldBtnGray" onclick="addItem();" />
								</ld:check> <ld:check mark="checkstandVersionDelete">
									<input type="button" value="删除" class="ldBtnGray" onclick="deleteItems();" />
								</ld:check></td>
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
