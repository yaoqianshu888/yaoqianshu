<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	if ('${insertOk }' == '1') {
		ldDialog.alert("提交成功!");
	} else if ('${insertOk }' == '2') {
		ldDialog.alert("未填写数据!");
	}

	function searchApprentice(curPageNum) {
		$('#pagenum').val(curPageNum);
		$('#apprenticeForm').action = "${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action";
		$('#apprenticeForm').submit();

	}

	function chooseApprentice(id, apprenticeName) {
		$("#apprentice\\.id").val(id);
		$("#choseName").html(apprenticeName);
	}

	function checkSubmit() {
		if ($("#apprentice\\.id").val() == '') {
			ldDialog.alert("请先选择下家！");
			return false;
		}
		document.subForm.submit();
	}
</script>
<style>
.ldPager div.skip {
	right: 70%
}
</style>
</head>
<body>
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
				<div class="conditionsbox">
					<div id="conditionsbox">
						<div class="yhlist1">
							<div style="margin-left: 8%;">
								<span style="color: #ffb800; font-weight: bold">本期期数</span>第 <span
									style="color: #ffb800; font-weight: bold">${nowPeriod.period }</span>
								期开奖号码：<span style="color: #f00; font-weight: bold">${prePeriod.lotteryResult }</span>
								<span style="margin-left: 8%">下期开奖时间：<span
									style="color: #ffb800; font-weight: bold"><f:formatDate
											value="${ nowPeriod.lotteryTime}" pattern="yyyy-MM-dd  HH:mm" /></span></span>
								<span style="margin-left: 8%">剩余投注时间：<span
									style="color: #ffb800; font-weight: bold">0 天 00:35:12</span></span>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div style="width: 44%; float: left; margin-left: 10px">
			<div style="margin-bottom: 5px">
				<form
					action="${basePath}moneyXuyu/analysisSearch!getAnalysis.action"
					method="post">
					<!-- 只允许输入数字 -->
					<input name="eatValue" class="ldText"
						style="width: 100px; margin-left: 10px; IME-MODE: disabled;"
						onkeyup="this.value=this.value.replace(/\D/g,'')"
						onafterpaste="this.value=this.value.replace(/\D/g,'')"
						maxlength="5" size="14" id="eatValue" value="" type="text" /> <input
						id="searchBtn" type="submit" class="ldBtnBlue" value="分析" />
					提示：请输入吃数数值
				</form>
				<br />
				<h2 style="color: red;">当前吃数值：${eatValue }</h2>
				<br />
				<table id="contentTable" width="100%" border="0" cellspacing="1"
					cellpadding="0" class="ld-datagrid">
					<tr>
						<td style="font-weight: bold">赚钱概率</td>
						<td>${analysisIRecord.winProbability }%</td>
					</tr>
					<tr>
						<td style="font-weight: bold">赚钱号码个数</td>
						<td>${analysisIRecord.winCount }</td>
					</tr>
					<tr>
						<td style="font-weight: bold">赚钱最大值/号码</td>
						<td>${analysisIRecord.winMaxValue}</td>
					</tr>
					<tr>
						<td style="font-weight: bold">最赚钱号码</td>
						<td>${analysisIRecord.winMaxNum}</td>
					</tr>
					<tr>
						<td style="font-weight: bold">亏钱最大值/号码</td>
						<td>${analysisIRecord.loseMaxValue}/${analysisIRecord.loseMaxNum}</td>
					</tr>
					<tr>
						<td style="font-weight: bold">最亏钱号码</td>
						<td>${analysisIRecord.loseMaxNum}</td>
					</tr>
				</table>
				<br />

				<div id="rightcontent">
					<h1>盈亏分析</h1>
					<br />
					<div style="width: 50%; float: left; margin-left: 0px">
						<table id="contentTable" style="float: left; margin-left: 0px;"
							width="100%" border="0" cellspacing="1" cellpadding="0"
							class="ld-datagrid">
							<tr>
								<td style="font-weight: bold">赚钱号码</td>
								<td style="font-weight: bold">英葵情况</td>
							</tr>
							<c:forEach items="${profitSituation}" var="item"
								varStatus="status">
								<c:if test="${ !(fn:startsWith(item.chargeMoney,'-'))}">
									<tr>
										<td>${ item.chargeNumber}</td>
										<td>${ item.chargeMoney}</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
					<div style="width: 50%; float: left; margin-left: 0px">
						<table id="contentTable" style="float: left; margin-left: 0px;"
							width="100%" border="0" cellspacing="1" cellpadding="0"
							class="ld-datagrid">
							<tr>
								<td style="font-weight: bold">亏钱号码</td>
								<td style="font-weight: bold">英葵情况</td>
							</tr>
							<c:forEach items="${profitSituation}" var="item"
								varStatus="status">
								<c:if test="${ (fn:startsWith(item.chargeMoney,'-'))}">
									<tr>
										<td>${ item.chargeNumber}</td>
										<td>${ item.chargeMoney}</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- 总收数情况表 begin -->
		<div style="width: 50%; float: left; margin-left: 15px;">
			<input type="hidden" name="nowPeriod.id" id="nowPeriod.id"
				value="${ nowPeriod.id}" />
			<h1>汇总情况</h1>
			<table id="contentTable" width="100%" border="0" cellspacing="1"
				cellpadding="0" class="ld-datagrid">
				<tr>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
				</tr>
				<tr>
					<td><img title="01" src="moneyTree/images/num01.gif" /></td>
					<td>${totalCharge[0] }</td>
					<td><img title="13" src="moneyTree/images/num13.gif" /></td>
					<td>${totalCharge[12] }</td>
					<td><img title="25" src="moneyTree/images/num25.gif" /></td>
					<td>${totalCharge[24] }</td>
					<td><img title="37" src="moneyTree/images/num37.gif" /></td>
					<td>${totalCharge[36] }</td>
					<td><img title="49" src="moneyTree/images/num49.gif" /></td>
					<td>${totalCharge[48] }</td>
				</tr>
				<tr>
					<td><img title="02" src="moneyTree/images/num02.gif" /></td>
					<td>${totalCharge[1] }</td>
					<td><img title="14" src="moneyTree/images/num14.gif" /></td>
					<td>${totalCharge[13] }</td>
					<td><img title="26" src="moneyTree/images/num26.gif" /></td>
					<td>${totalCharge[25] }</td>
					<td><img title="38" src="moneyTree/images/num38.gif" /></td>
					<td>${totalCharge[37] }</td>

				</tr>
				<tr>
					<td><img title="03" src="moneyTree/images/num03.gif" /></td>
					<td>${totalCharge[2] }</td>
					<td><img title="15" src="moneyTree/images/num15.gif" /></td>
					<td>${totalCharge[14] }</td>
					<td><img title="27" src="moneyTree/images/num27.gif" /></td>
					<td>${totalCharge[26] }</td>
					<td><img title="39" src="moneyTree/images/num39.gif" /></td>
					<td>${totalCharge[38] }</td>

				</tr>
				<tr>
					<td><img title="04" src="moneyTree/images/num04.gif" /></td>
					<td>${totalCharge[3] }</td>
					<td><img title="16" src="moneyTree/images/num16.gif" /></td>
					<td>${totalCharge[15] }</td>
					<td><img title="28" src="moneyTree/images/num28.gif" /></td>
					<td>${totalCharge[27] }</td>
					<td><img title="40" src="moneyTree/images/num40.gif" /></td>
					<td>${totalCharge[39] }</td>

				</tr>
				<tr>
					<td><img title="05" src="moneyTree/images/num05.gif" /></td>
					<td>${totalCharge[4] }</td>
					<td><img title="17" src="moneyTree/images/num17.gif" /></td>
					<td>${totalCharge[16] }</td>
					<td><img title="29" src="moneyTree/images/num29.gif" /></td>
					<td>${totalCharge[28] }</td>
					<td><img title="41" src="moneyTree/images/num41.gif" /></td>
					<td>${totalCharge[40] }</td>

				</tr>
				<tr>
					<td><img title="06" src="moneyTree/images/num06.gif" /></td>
					<td>${totalCharge[5] }</td>
					<td><img title="18" src="moneyTree/images/num18.gif" /></td>
					<td>${totalCharge[17] }</td>
					<td><img title="30" src="moneyTree/images/num30.gif" /></td>
					<td>${totalCharge[29] }</td>
					<td><img title="42" src="moneyTree/images/num42.gif" /></td>
					<td>${totalCharge[41] }</td>

				</tr>
				<tr>
					<td><img title="07" src="moneyTree/images/num07.gif" /></td>
					<td>${totalCharge[6] }</td>
					<td><img title="19" src="moneyTree/images/num19.gif" /></td>
					<td>${totalCharge[18] }</td>
					<td><img title="31" src="moneyTree/images/num31.gif" /></td>
					<td>${totalCharge[30] }</td>
					<td><img title="43" src="moneyTree/images/num43.gif" /></td>
					<td>${totalCharge[42] }</td>

				</tr>
				<tr>
					<td><img title="08" src="moneyTree/images/num08.gif" /></td>
					<td>${totalCharge[9] }</td>
					<td><img title="20" src="moneyTree/images/num20.gif" /></td>
					<td>${totalCharge[19] }</td>
					<td><img title="32" src="moneyTree/images/num32.gif" /></td>
					<td>${totalCharge[31] }</td>
					<td><img title="44" src="moneyTree/images/num44.gif" /></td>
					<td>${totalCharge[43] }</td>

				</tr>
				<tr>
					<td><img title="09" src="moneyTree/images/num09.gif" /></td>
					<td>${totalCharge[8] }</td>
					<td><img title="21" src="moneyTree/images/num21.gif" /></td>
					<td>${totalCharge[20] }</td>
					<td><img title="33" src="moneyTree/images/num33.gif" /></td>
					<td>${totalCharge[32] }</td>
					<td><img title="45" src="moneyTree/images/num45.gif" /></td>
					<td>${totalCharge[44] }</td>

				</tr>
				<tr>
					<td><img title="10" src="moneyTree/images/num10.gif" /></td>
					<td>${totalCharge[9] }</td>
					<td><img title="22" src="moneyTree/images/num22.gif" /></td>
					<td>${totalCharge[21] }</td>
					<td><img title="34" src="moneyTree/images/num34.gif" /></td>
					<td>${totalCharge[33] }</td>
					<td><img title="46" src="moneyTree/images/num46.gif" /></td>
					<td>${totalCharge[45] }</td>

				</tr>
				<tr>
					<td><img title="11" src="moneyTree/images/num11.gif" /></td>
					<td>${totalCharge[10] }</td>
					<td><img title="23" src="moneyTree/images/num23.gif" /></td>
					<td>${totalCharge[22] }</td>
					<td><img title="35" src="moneyTree/images/num35.gif" /></td>
					<td>${totalCharge[34] }</td>
					<td><img title="47" src="moneyTree/images/num47.gif" /></td>
					<td>${totalCharge[46] }</td>

				</tr>
				<tr>
					<td><img title="12" src="moneyTree/images/num12.gif" /></td>
					<td>${totalCharge[11] }</td>
					<td><img title="24" src="moneyTree/images/num24.gif" /></td>
					<td>${totalCharge[23] }</td>
					<td><img title="36" src="moneyTree/images/num36.gif" /></td>
					<td>${totalCharge[35] }</td>
					<td><img title="48" src="moneyTree/images/num48.gif" /></td>
					<td>${totalCharge[47] }</td>
				</tr>
			</table>
		</div>
		<!-- 总收数情况表 end -->

		<br />
		<!-- 上报情况表 begin -->

		<div style="width: 50%; float: left; margin-left: 15px;">
			<input type="hidden" name="nowPeriod.id" id="nowPeriod.id"
				value="${ nowPeriod.id}" />
			<h1>上报情况</h1>
			<table id="contentTable" width="100%" border="0" cellspacing="1"
				cellpadding="0" class="ld-datagrid">
				<tr>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
					<td>号码</td>
					<td>金额</td>
				</tr>
				<tr>
					<td><img title="01" src="moneyTree/images/num01.gif" /></td>
					<td>${reportedCharge[0] }</td>
					<td><img title="13" src="moneyTree/images/num13.gif" /></td>
					<td>${reportedCharge[12] }</td>
					<td><img title="25" src="moneyTree/images/num25.gif" /></td>
					<td>${reportedCharge[24] }</td>
					<td><img title="37" src="moneyTree/images/num37.gif" /></td>
					<td>${reportedCharge[36] }</td>
					<td><img title="49" src="moneyTree/images/num49.gif" /></td>
					<td>${reportedCharge[48] }</td>
				</tr>
				<tr>
					<td><img title="02" src="moneyTree/images/num02.gif" /></td>
					<td>${reportedCharge[1] }</td>
					<td><img title="14" src="moneyTree/images/num14.gif" /></td>
					<td>${reportedCharge[13] }</td>
					<td><img title="26" src="moneyTree/images/num26.gif" /></td>
					<td>${reportedCharge[25] }</td>
					<td><img title="38" src="moneyTree/images/num38.gif" /></td>
					<td>${reportedCharge[37] }</td>

				</tr>
				<tr>
					<td><img title="03" src="moneyTree/images/num03.gif" /></td>
					<td>${reportedCharge[2] }</td>
					<td><img title="15" src="moneyTree/images/num15.gif" /></td>
					<td>${reportedCharge[14] }</td>
					<td><img title="27" src="moneyTree/images/num27.gif" /></td>
					<td>${reportedCharge[26] }</td>
					<td><img title="39" src="moneyTree/images/num39.gif" /></td>
					<td>${reportedCharge[38] }</td>

				</tr>
				<tr>
					<td><img title="04" src="moneyTree/images/num04.gif" /></td>
					<td>${reportedCharge[3] }</td>
					<td><img title="16" src="moneyTree/images/num16.gif" /></td>
					<td>${reportedCharge[15] }</td>
					<td><img title="28" src="moneyTree/images/num28.gif" /></td>
					<td>${reportedCharge[27] }</td>
					<td><img title="40" src="moneyTree/images/num40.gif" /></td>
					<td>${reportedCharge[39] }</td>

				</tr>
				<tr>
					<td><img title="05" src="moneyTree/images/num05.gif" /></td>
					<td>${reportedCharge[4] }</td>
					<td><img title="17" src="moneyTree/images/num17.gif" /></td>
					<td>${reportedCharge[16] }</td>
					<td><img title="29" src="moneyTree/images/num29.gif" /></td>
					<td>${reportedCharge[28] }</td>
					<td><img title="41" src="moneyTree/images/num41.gif" /></td>
					<td>${reportedCharge[40] }</td>

				</tr>
				<tr>
					<td><img title="06" src="moneyTree/images/num06.gif" /></td>
					<td>${reportedCharge[5] }</td>
					<td><img title="18" src="moneyTree/images/num18.gif" /></td>
					<td>${reportedCharge[17] }</td>
					<td><img title="30" src="moneyTree/images/num30.gif" /></td>
					<td>${reportedCharge[29] }</td>
					<td><img title="42" src="moneyTree/images/num42.gif" /></td>
					<td>${reportedCharge[41] }</td>

				</tr>
				<tr>
					<td><img title="07" src="moneyTree/images/num07.gif" /></td>
					<td>${reportedCharge[6] }</td>
					<td><img title="19" src="moneyTree/images/num19.gif" /></td>
					<td>${reportedCharge[18] }</td>
					<td><img title="31" src="moneyTree/images/num31.gif" /></td>
					<td>${reportedCharge[30] }</td>
					<td><img title="43" src="moneyTree/images/num43.gif" /></td>
					<td>${reportedCharge[42] }</td>

				</tr>
				<tr>
					<td><img title="08" src="moneyTree/images/num08.gif" /></td>
					<td>${reportedCharge[9] }</td>
					<td><img title="20" src="moneyTree/images/num20.gif" /></td>
					<td>${reportedCharge[19] }</td>
					<td><img title="32" src="moneyTree/images/num32.gif" /></td>
					<td>${reportedCharge[31] }</td>
					<td><img title="44" src="moneyTree/images/num44.gif" /></td>
					<td>${reportedCharge[43] }</td>

				</tr>
				<tr>
					<td><img title="09" src="moneyTree/images/num09.gif" /></td>
					<td>${reportedCharge[8] }</td>
					<td><img title="21" src="moneyTree/images/num21.gif" /></td>
					<td>${reportedCharge[20] }</td>
					<td><img title="33" src="moneyTree/images/num33.gif" /></td>
					<td>${reportedCharge[32] }</td>
					<td><img title="45" src="moneyTree/images/num45.gif" /></td>
					<td>${reportedCharge[44] }</td>

				</tr>
				<tr>
					<td><img title="10" src="moneyTree/images/num10.gif" /></td>
					<td>${reportedCharge[9] }</td>
					<td><img title="22" src="moneyTree/images/num22.gif" /></td>
					<td>${reportedCharge[21] }</td>
					<td><img title="34" src="moneyTree/images/num34.gif" /></td>
					<td>${reportedCharge[33] }</td>
					<td><img title="46" src="moneyTree/images/num46.gif" /></td>
					<td>${reportedCharge[45] }</td>

				</tr>
				<tr>
					<td><img title="11" src="moneyTree/images/num11.gif" /></td>
					<td>${reportedCharge[10] }</td>
					<td><img title="23" src="moneyTree/images/num23.gif" /></td>
					<td>${reportedCharge[22] }</td>
					<td><img title="35" src="moneyTree/images/num35.gif" /></td>
					<td>${reportedCharge[34] }</td>
					<td><img title="47" src="moneyTree/images/num47.gif" /></td>
					<td>${reportedCharge[46] }</td>

				</tr>
				<tr>
					<td><img title="12" src="moneyTree/images/num12.gif" /></td>
					<td>${reportedCharge[11] }</td>
					<td><img title="24" src="moneyTree/images/num24.gif" /></td>
					<td>${reportedCharge[23] }</td>
					<td><img title="36" src="moneyTree/images/num36.gif" /></td>
					<td>${reportedCharge[35] }</td>
					<td><img title="48" src="moneyTree/images/num48.gif" /></td>
					<td>${reportedCharge[47] }</td>
				</tr>
			</table>
		</div>
		<!-- 上报情况表 end -->

	</div>
	</div>
</body>

</html>

