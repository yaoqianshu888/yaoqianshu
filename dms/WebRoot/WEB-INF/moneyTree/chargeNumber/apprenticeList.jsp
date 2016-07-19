<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function showDetail(id,apprenticeName){
		ldDialog.openMedium("${basePath}moneyJinliang/chargeNumber!showDetail.action?apprentice.id="+id,
			"明细查询("+apprenticeName+")     当前期:  "+${prePeriod.period }, 
			function(window) {
				var returnValue = window.returnValue;
				if (returnValue == undefined) {//无返回值 直接关闭 
					return true;
				} else {//有返回值 处理一些事
					ldDialog.tips("处理成功！");
					document.pagerForm.submit();
					return true;
				}
		});
	}
	
	function chooseApprentice(id,apprenticeName){
		parent.document.getElementById('apprentice.id').value=id;
		//$("#apprentice\\.id").val(id);
		$("#choseName").html(apprenticeName);
	}
</script>
</head>
<body>
	<div style="margin-bottom:5px">
				<form action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action"
							  method="post">
					<input name="apprentice.apprenticeName" class="ldText" style="width:100px" id="apprentice.apprenticeName"
						value="${apprentice.apprenticeName}" />
					<input id="searchBtn" type="submit" class="ldBtnBlue" value="查询" />
					<input type="hidden" value="0" name="pager.curPageNum" />
					<input type="hidden" name="pagenum" value="3"/>
				</form>
				</div>
				<table style="border:1px solid #dadada;width:100%" cellspacing="6" cellpadding="1">
				<tr>
					<td style="font-weight:bold;">请选择下家：</td>
					<td><span id="choseName" style="color:red"></span></td>
				</tr>
				<c:forEach items="${apprenticeList }" var="item" varStatus="status">
					<tr>
						<td><input type="button" value="${ item.apprenticeName}" class="ldBtnGray" onclick="chooseApprentice(${item.id},'${item.apprenticeName}')"/></td>
						<td><input type="button" value="明细查询" class="ldBtnGray" onclick="showDetail(${item.id},'${item.apprenticeName}')"/></td>
					</tr>
				</c:forEach>
				</table>
				<div class="toolbarR">
						<div class="ldPager">
						<form action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action"
							  method="post" name="pagerForm">
							    <input name="apprentice.apprenticeName" type="hidden"
								value="${apprentice.apprenticeName}" /> 
							<ld:pager type="form" action="pagerForm" />
						</form>
						</div>
				</div>
</body>
</html>


