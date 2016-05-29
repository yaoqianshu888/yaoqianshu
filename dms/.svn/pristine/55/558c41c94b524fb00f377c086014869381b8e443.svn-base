<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<head>
<script type="text/javascript" src="${basePath}core/js/cron.js"></script>
<script type="text/javascript">
function checkSubmit() {
/* 	var keyDownloadAddress = $("#keyDownloadAddress");
	keyDownloadAddress.val($.trim(keyDownloadAddress.val()));
	if(keyDownloadAddress.val().lenth==0){
		alert("密钥更新服务器地址不能为空");
		return false;
	}
	var reg = /^(\d{1,3}).(\d{1,3}).(\d{1,3}).(\d{1,3}):(\d{1,6})$/;
	if(!reg.test(keyDownloadAddress.val())){
		alert("密钥更新服务器地址格式不对");
		return false;
	} */
	
/* 	if(!isCronExpress($("#keyDownloadTime").val())){
		alert("密钥更新服务器下载时间格式不正确");
		return false;
	} */
	
/* 	if(!isNum($("#keyDownloadFailDelay").val())){
		alert("密钥更新失败延迟时间格式不正确");
		return false;
	} */
	
	return submitForm();
}
function submitForm(){
	var url = "${basePath}coreAjax/optionUpdate!updateOption.action";
	$.ajax({
		type : "POST",
		url : url,
		dataType : "text",
		data : $("#submitForm").serialize(),
		success : function(result) {
			var res = JSON.parse(result);
			if (res.code == 1) {
				ldDialog.tips("修改成功");
			} else {
				ldDialog.alert(res.reason);
			}
			ldDialog.unmask();
		},
		error : function() {

		}
	});
}
</script>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<form id="submitForm" method="post">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div class="yhlist1L">选项设置</div>
							</div>
							<div class="yhlist2">
								<table>
									<tr>
										<td >
											<div width="200" class="toolbarR" >分页大小： </div>
										</td>
										<td>
											<div class="toolbarL">
												每页显示
												<ld:select name="defaultPageSize" value="${defaultPageSize}" groupName="pageSize" className="ldSelect select144"/>
												条数据。
												<span class="font12">*</span>
											</div>
										</td>
									</tr>
									<%-- <tr>
										<td>
											<div width="200" class="toolbarR" >密钥更新服务器地址： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="keyDownloadAddress" class="ldText input138"
													name="keyDownloadAddress" value="${keyDownloadAddress}" maxlength="50" />
												<span class="font12">*</span>
											</div>
										</td>
									</tr> --%>
									<%-- <tr>
										<td>
											<div width="200" class="toolbarR" >密钥更新时间： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="keyDownloadTime" class="ldText input138"
													name="keyDownloadTime" value="${keyDownloadTime}" maxlength="24" />(cron格式)
												<span class="font12">*</span>
											</div>
										</td>
									</tr> --%>
									<%-- <tr>
										<td>
											<div width="200" class="toolbarR" >密钥更新失败延迟时间： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="keyDownloadFailDelay" class="ldText input138"
													name="keyDownloadFailDelay" value="${keyDownloadFailDelay}" maxlength="2" />
												(秒)
												<span class="font12">*</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div width="200" class="toolbarR" >zmk密钥： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="zmk" class="ldText input138"
													name="zmk" value="${zmk}" maxlength="48" />
												<span class="font12">*</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div width="200" class="toolbarR" >tek密钥下载地址： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="tekDownloadAddress" class="ldText input138"
													name="tekDownloadAddress" value="${tekDownloadAddress}" maxlength="48" />
												<span class="font12">*</span>
											</div>
										</td>
									</tr> --%>
									<%-- <tr>
										<td>
											<div width="200" class="toolbarR" >是否核心区服务： </div>
										</td>
										<td>
											<div class="toolbarL">
												<ld:select name="isCoreSystem" value="${isCoreSystem}" groupName="yesOrNoInt" className="ldSelect select144" exceptValue="${options.common.ALL_EMPTY}"/>	
												
												<span class="font12">*</span>
											</div>
										</td>
									</tr> --%>
									<%-- <tr style="display: none;">
										<td>
											<div width="200" class="toolbarR" >签购单提交后返回的资源地址： </div>
										</td>
										<td>
											<div class="toolbarL">
												<input type="text" id="electronicvoucherHost" class="ldText input138"
													name="electronicvoucherHost" value="${electronicvoucherHost}" maxlength="50" />
												<span class="font12">*</span>
											</div>
										</td>
									</tr> --%>
								</table>
							</div>
						</div>
					</div>
					<div class="yhlist3">
						<div class="toolbarL">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<ld:check mark="updateOption">
											<input id="searchBtn" type="button" class="ldBtnBlue" value="修改" onclick="return checkSubmit();"/>
										</ld:check>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>