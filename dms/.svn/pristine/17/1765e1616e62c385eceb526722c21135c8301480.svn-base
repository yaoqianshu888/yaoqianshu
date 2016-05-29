<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部门选择</title>
<script type="text/javascript">
	function selectItem(itemStr) {
		var array = itemStr.split("|");
		var area = new Object();
		area.id = array[0];
		area.areaMark = array[1];
		area.areaMark = array[1];
		area.areaName = array[2];
		area.name = array[2];
		var win = art.dialog.open.origin;
		win.parent.ldDialog.close(area);
	}
	function detailItem(id) {
		ldDialog.open(
						"${basePath}core/areaSearch!getAreaDetail.action?area.id="
								+ id, "部门详情", function(window) {
						}, 600, 500);
	}
	function loadData(curPageNum){
		var url = "${basePath}coreAjax/areaForChoose!search.action";
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
					var items = res.bean;
					var pagerStr = res.pagerStr;
					$(".ldPager").empty();
					$(".ldPager").append(pagerStr);
					var html = "";
					$.each(items,function(i, item){
						html += "<tr>";
						html += "<td>"+ (i+1) +"</td>";
						html += "<td>"+ item.areaMark +"</td>";
						html += "<td>"+ item.areaName +"</td>";
						html += "<td>"+ item.availableOptionDisplay +"</td>";
						html += "<td>";
						if(item.available == ${options.common.AVAILABLE }){
							html += "<input type=\"button\" class=\"ldBtnLink\" value=\"选择\" style=\"cursor: pointer;\" onclick=\"selectItem('"+item.id+"|"+item.areaMark+"|"+item.areaName+"')\" />";
						}
						html += "&nbsp;<input type='button' value='详情' class='ldBtnLink' onclick='detailItem("+item.id+");'  style=\"cursor: pointer;\"/>";
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
		initSkip();
	}
	$(function(){
		loadData(1);
		$("#searchBtn").bind("click", function(){
			loadData(1);
		});
		var iframe = window.parent.document.getElementById("areaForChooseList");
		iframe.height = document.body.scrollHeight;
	});
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<div class="conditionsbox">
					<form id="searchForm" method="post">
						<input type="hidden" name="notChooseIds" value="${notChooseIds }" />
						<input type="hidden" name="chooseType" value="${chooseType}" /> <input
							type="hidden" name="superAreaId" value="${superAreaId}" />
						<div class="yhlist1">
							<div class="yhlist1L">查询条件</div>
						</div>
						<div class="yhlist2">
							<div class="conditionsrow">
								<div class="conditionsitem">
									<div class="conditionsitemL">部门编码：</div>
									<div class="conditionsitemR">
										<input type="text" class="ldText" name="area.areaMark"
											value="${area.areaMark}" />
									</div>
									<div class="conditionsitemL">部门名称：</div>
									<div class="conditionsitemR">
										<input type="text" class="ldText" name="area.areaName"
											value="${area.areaName}" />
									</div>
									<div class="conditionsitemL">状态：</div>
									<div class="conditionsitemR">
										<ld:select name="area.available" value="${area.available }"
											groupName="availableAll" className="ldSelect select144" />
									</div>
								</div>
							</div>
						</div>

						<div class="yhlist3">
							<div class="toolbarR">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<input id="searchBtn" type="button" class="ldBtnBlue"
												value="查询" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form>
				</div>
				<div class="yhlist2">
					<table id="contentTable" width="100%" border="0" cellspacing="0" cellpadding="0"
						class="ld-datagrid">
						<tr>
							<th>序号</th>
							<th>部门编码</th>
							<th>部门名称</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</table>
				</div>
				<div class="yhlist3">
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
	</div>
</body>
</html>