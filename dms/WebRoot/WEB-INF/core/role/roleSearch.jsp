<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">
	function addItem() {
		ldDialog.openMini("${basePath}core/roleInsert!prepare.action", "添加角色",
				function(window) {
					var returnValue = window.returnValue;
					if (returnValue == undefined) {
						return true;
					} else {
						ldDialog.tips("处理成功！");
						loadData(1);
						return true;
					}
				});
	}

	function editItem(id) {
		ldDialog.openMini("${basePath}core/roleUpdate!prepare.action?role.id="
				+ id, "编辑角色", function(window) {
			var returnValue = window.returnValue;
			if (returnValue == undefined) {
				return true;
			} else {
				ldDialog.tips("处理成功！");
				var curPageNum = $("input[name='pager.curPageNum']").val();
				loadData(curPageNum);
				return true;
			}
		});
	}

	function setRight(id) {
		ldDialog.open(
				"${basePath}core/roleUpdateRight!prepare.action?targetRoleId="
						+ id + "&pager.curPageNum=" + ${pager.curPageNum},
				"权限设置", function(window) {
				}, 900, 600);
	}
	function deleteItems() {
		var ids = getAllChose("delete");
		if (ids == "") {
			ldDialog.alert("请先选择要删除的角色");
			return;
		}
		$("#checkboxAll").attr("disabled", "disabled");
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除这些角色吗？", function() {
			var url = "${basePath}coreAjax/roleSearch!deleteRole.action?" + param;
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

	function showItem(id) {
		ldDialog.openMini(
				"${basePath}core/roleSearch!getRoleDetail.action?role.id=" + id
						+ "&pager.curPageNum=" + ${pager.curPageNum}, "权限详情",
				function(window) {
				});
	}

	function setAvailable(id) {
		var url = "${basePath}coreAjax/roleUpdate!updateStatus.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : {
				'role.id' : id
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("处理完成");
				} else {
					ldDialog.alert(res.reason);
				}
				ldDialog.unmask();
			},
			error : function() {

			}
		});
	}
	
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/roleSearch!searchRole.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			data : "pager.curPageNum="+curPageNum,
			async:false,
			success : function(result) {
				$("#contentTable td").remove();
				var res = eval("(" + result + ")");
				if(res.code == 1){
					var items = res.list;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					var html = "";
					$.each(items,function(i, item){
						if(item.id != 1){
							html += "<tr>";
							html += "<td><input type=\"checkbox\" name=\"delete\" id=\"delete\" class=\"ldCheckbox\" value=\""+item.id+"\" /></td>";
							html += "<td>"+ (i+1) +"</td>";
							html += "<td>"+ item.roleName +"</td>";
							html += "<td>";
						<ld:rightMark>
						<ld:check mark="roleStatusUpdate">
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
						<ld:check mark="roleDetail">
							html += "<input type='button' value='详情' class='ldBtnLink' onclick='showItem("+item.id+");' />&nbsp;";
						</ld:check>
						<ld:check mark="roleUpdate">
							html += "<input type='button' value='编辑' class='ldBtnLink' onclick='editItem("+item.id+");' />&nbsp;";
						</ld:check>
						<ld:check mark="roleUpdateRight">
							html += "<input type='button' value='权限设置' class='ldBtnLink' onclick='setRight("+item.id+");' />";
						</ld:check>
							html += "</td>";
						
							html += "</tr>";
						}
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
		/* $("#searchBtn").bind("click", function(){
			loadData(1);
		}); */
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="searchForm" method="post">
					<div class="yhlist3">
						<div class="toolbarL">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<ld:check mark="roleInsert">
										<input type="button" class="ldBtnGray" value="新增"
											onclick="addItem();" /></ld:check>
										<ld:check mark="roleDelete">
										<input type="button" value="删除" class="ldBtnGray"
											onclick="deleteItems();" /></ld:check>
									</td>
								</tr>
							</table>
						</div>
						<!-- <div class="toolbarR">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><input id="searchBtn" type="button" class="ldBtnBlue" value="查询"/></td>
								</tr>
							</table>
						</div> -->
					</div>
				</form>
			</div>
			<div class="yhlist2">
				<form name="deleteForm" method="post" id="deleteForm">
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0"
						class="ld-datagrid">
						<tr>
							<th id="checkboxAllTh"></th>
							<th>序号</th>
							<th>角色名称</th>
							<th>状态</th>
							<th>创建时间</th>
							<th>创建人</th>
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
								<ld:check mark="roleInsert">
								<input type="button" class="ldBtnGray" value="新增"
									onclick="addItem();" /></ld:check>
								<ld:check mark="roleDelete">
								<input type="button" value="删除" class="ldBtnGray"
									onclick="deleteItems();" /></ld:check>
							</td>
						</tr>
					</table>
				</div>
				<div class="ldPager">
				</div>
			</div>
		</div>
	</div>
</body>
</html>