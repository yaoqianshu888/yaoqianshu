<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	//倒计时
	function GetRTime(){
		var lotteryTime='${ nowPeriod.lotteryTime.year+1900}'+'/'+'${ nowPeriod.lotteryTime.month+1}'+'/'+'${ nowPeriod.lotteryTime.date}'+' '+'${ nowPeriod.lotteryTime.hours}'+':'+'${ nowPeriod.lotteryTime.minutes}'+':'+'${ nowPeriod.lotteryTime.seconds}';
		var EndTime= new Date(lotteryTime);
		var NowTime = new Date();
		var t =EndTime.getTime() - NowTime.getTime();
		var d=0;
		var h=0;
		var m=0;
		var s=0;
		if(t>=0){
		  d=Math.floor(t/1000/60/60/24);
		  h=Math.floor(t/1000/60/60%24);
		  m=Math.floor(t/1000/60%60);
		  s=Math.floor(t/1000%60);
		}
		document.getElementById("day").innerHTML = d;
		document.getElementById("hour").innerHTML = h;
		document.getElementById("min").innerHTML = m;
		document.getElementById("sec").innerHTML = s;
	}
	setInterval(GetRTime,0);
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
							<div style="margin-left:8%"><span style="color:#ffb800;font-weight:bold">上一期:</span>第 <span style="color:#ffb800;font-weight:bold">${prePeriod.period }</span> 期开奖号码：<span style="color:#ffb800;font-weight:bold">${prePeriod.lotteryResult }</span>  <span style="margin-left:8%">下期：<span style="color:#ffb800;font-weight:bold;color:red;margin-right:8%;font-size:22px">第${nowPeriod.period }期</span>开奖时间：<span style="color:#ffb800;font-weight:bold"><f:formatDate value="${ nowPeriod.lotteryTime}" pattern="yyyy-MM-dd  HH:mm" /></span></span>    <span style="margin-left:8%">剩余投注时间：<span style="color:#ffb800;font-weight:bold"><span id="day">0</span> 天  <span id="hour">00</span>:<span id="min">00</span>:<span id="sec">00</span></span></span></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="yhlist">
				<div class="conditionsbox">
					<div id="conditionsbox">
						<div class="yhlist1">
						<h1>请先设置上家倍数和返点</h1><br/>
						<img src="core/images/usersetting.png"  width="1000px" height="520px"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

