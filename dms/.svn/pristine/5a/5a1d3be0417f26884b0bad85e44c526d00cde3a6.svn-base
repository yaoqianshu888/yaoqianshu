<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript">
	function checkIsInherit(id, isInherit) {
		if (isInherit == 1) {
			ldDialog.alert("该权限的授权方式是继承，无下级权限");
		} else {
			window.location.href = "${basePath}core/rightSearch!searchRightByUpRightId.action?upRightId="
					+ id;
		}
	}
	function setAvailable(id) {
		var url = "${basePath}coreAjax/rightUpdate!updateStatus.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : {
				'right.id' : id
			},
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("处理完成");
					ldDialog.unmask();
				} else {
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {

			}
		});
	}

	function addItem() {
		ldDialog
				.openMini(
						"${basePath}core/rightInsert!prepare.action?right.upRightId=${upRightId}",
						"添加权限", function(window) {
							var returnValue = window.returnValue;
							if (returnValue == undefined) {//无返回值 直接关闭 
								return true;
							} else {//有返回值 处理一些事
								ldDialog.tips("处理成功！");
								var win = art.dialog.open.origin;
								win.parent.rightTree.location.reload();
								var curPageNum = $("input[name='pager.curPageNum']").val();
								loadData(curPageNum);
								return true;
							}
						});
	}

	function editItem(id) {
		ldDialog.openMini(
				"${basePath}core/rightUpdate!prepare.action?right.id=" + id,
				"编辑权限", function(window) {
					var returnValue = window.returnValue;
					if (returnValue == undefined) {//无返回值 直接关闭 
						return true;
					} else {//有返回值 处理一些事
						ldDialog.tips("处理成功！");
						var win = art.dialog.open.origin;
						win.parent.rightTree.location.reload();
						var curPageNum = $("input[name='pager.curPageNum']").val();
						loadData(curPageNum);
						return true;
					}
				});
	}
	function deleteItems() {
		var ids = getAllChose("delete");
		if (ids == "") {
			ldDialog.alert("请先选择要删除的权限");
			return;
		}
		var param = $("#deleteForm").serialize();
		ldDialog.confirm("你确定要删除这些权限吗？",
				function() {
					var url = "${basePath}coreAjax/rightSearch!deleteRight.action?"
							+ param;
					$.post(url, function(result) {
						var res = JSON.parse(result);
						if (res.code == 1) {
							ldDialog.tips("处理完成");
							reloadTree();
							var curPageNum = $("input[name='pager.curPageNum']").val();
							loadData(curPageNum);
						} else {
							ldDialog.alert(res.reason);
							var curPageNum = $("input[name='pager.curPageNum']").val();
							loadData(curPageNum);
						}
					});
				});
	}
	function reloadTree() {
		window.parent.document.rightTree.location.reload();
	}

	function showItem(id) {
		ldDialog.openMini(
				"${basePath}core/rightSearch!getRightDetail.action?right.id="
						+ id, "权限详情", function(window) {
				});
	}
	function updateOrder(lastId, currentId){
		var url = "${basePath}coreAjax/rightUpdateOrder!updateOrder.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			data : {
				'lastId' : lastId,
				'currentId' : currentId
			},
			async:false,
			success : function(result) {
				var res = JSON.parse(result);
				if (res.code == 1) {
					ldDialog.tips("处理成功");
					var curPageNum = $("input[name='pager.curPageNum']").val();
					loadData(curPageNum);
				} else {
					ldDialog.alert(res.reason);
					ldDialog.unmask();
				}
			},
			error : function() {
			}
		});
	}
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/rightSearch!searchRightByUpRightId.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			data : {
				'upRightId' : ${upRightId},
				'pager.curPageNum' : curPageNum
			},
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
					for(var i=0; i<items.length; i++){
						var item = items[i];
						if(item.id != 1){
							html += "<tr>";
							html += "<td><input type=\"checkbox\" name=\"delete\" id=\"delete\" class=\"ldCheckbox\" value=\""+item.id+"\" /></td>";
							html += "<td>"+ (i+1) +"</td>";
							html += "<td><a href=\"javascript:checkIsInherit("+item.id+","+item.isInherit+")\">";
							html += "<font class=\"font9\">"+nullToStr(item.rightName)+"</font>";
							html += "</a></td>";
							html += "<td>"+ nullToStr(item.rightMark) +"</td>";
							html += "<td>"+ nullToStr(item.rightURL) +"</td>";
							html += "<td>"+item.isMenuOptionDisplay+"</td>";
							html += "<td>";
						<ld:rightMark>
						<ld:check mark="rightStatusUpdate">
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
							
							html += "<td>"+item.logableOptionDisplay+"</td>";
							html += "<td>"+item.isFilterOptionDisplay+"</td>";
							html += "<td>"+item.isInheritOptionDisplay+"</td>";
							
							html += "<td>";
						<ld:check mark="rightDetail">
							html += "<input type='button' value='详情' class='ldBtnLink' onclick='showItem("+item.id+");' /> ";
						</ld:check>
						<ld:check mark="rightUpdate">
							html += "<input type='button' value='编辑' class='ldBtnLink' onclick='editItem("+item.id+");' /> ";
						</ld:check>
						<ld:check mark="rightOrderUpdate">
							if(i < (items.length-1)){
								html += "<input type=\"button\" value=\"下移\" class=\"ldBtnLink\" onclick=\"updateOrder("+items[i+1].id+","+item.id+")\"/> ";
							}
							if(i > 0 && i < items.length){
								html += "<input type=\"button\" value=\"上移\" class=\"ldBtnLink\" onclick=\"updateOrder("+items[i-1].id+","+item.id+")\"/>";
							}
						</ld:check>
							html += "</td>";
						
							html += "</tr>";
						}
					}
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
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhbox">
				<table width="100%" style="height: 100%;" border="0" cellspacing="0" cellpadding="0" id="dataTable">
					<tr>
						<td width="5">&nbsp;</td>
						<td valign="top">
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><ld:check mark="rightInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem()" />
												</ld:check> <ld:check mark="rightDelete">
													<input type="button" class="ldBtnGray" value="删除" onclick="deleteItems()" />
												</ld:check></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="yhlist2">
								<form name="deleteForm" method="post" id="deleteForm">
									<table id="contentTable" border="0" cellspacing="0" cellpadding="0" width="100%" class="ld-datagrid">
										<tr>
											<th id="checkboxAllTh"></th>
											<th>序号</th>
											<th>权限名称</th>
											<th>权限标志</th>
											<th>URL指向</th>
											<th>是否菜单项</th>
											<th>状态</th>
											<th>是否记录</th>
											<th>是否过滤</th>
											<th>授权方式</th>
											<th>操作</th>
										</tr>
									</table>
								</form>
							</div>
							<div class="yhlist3">
								<div class="toolbarL">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><ld:check mark="rightInsert">
													<input type="button" class="ldBtnGray" value="新增" onclick="addItem()" />
												</ld:check> <ld:check mark="rightDelete">
													<input type="button" class="ldBtnGray" value="删除" onclick="deleteItems()" />
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
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>