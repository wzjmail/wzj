<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=path%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- 操作下的小图标 -->
<link rel="stylesheet"
	href="assets/css/font-awesome.min.css?v=${version}" />
<!-- 页面只要的 样式 -->
<link rel="stylesheet" href="assets/css/ace.min.css?v=${version}" />
<!-- 时间样式 -->
<link rel="stylesheet"
	href="assets/css/jquery-ui-1.10.3.full.min.css?v=${version}" />
<!-- 模态框样式 -->
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="content">
		<div class="page-content">
			<div style="width: 100%">
				<h3 align="center">
					<i class="icon-rss orange"></i>历史记录
				</h3>
				<div id="feed" class="tab-pane">
					<div class="profile-feed row-fluid">
						<div class="span6">
							<c:forEach items="${list}" var="li" begin="0" end="9"
								varStatus="status">
								<div class="profile-activity clearfix"
									style="border: 1px; border-style: dotted; border-color: #d0d8e0">
									<div class="pull-left" style="width: 80px; height: 80px">
										<br /> <font size="6" face="黑体" style="visibility: visible;">${page.total-(status.index)}通:</font>
									</div>
									<div>
										<input class="hide id" value="${li.id}" />
										<p>
											<span><i class=" icon-lightbulb red bigger-150"></i></span>&nbsp;<span>问题:</span>
											<span class="text-danger">${li.question}</span>
										</p>
										<p>
											<span><i class="icon-bullhorn blue bigger-100"></i></span>&nbsp;<span
												class="text-primary">内容:</span><span>${li.remark}</span>
										</p>
										<div class="time">
											<span><i class="icon-time bigger-130"></i></span>&nbsp;<span>时间:</span><span>
												${li.time}</span>
										</div>
										<input class="hide recordSize" value="${fn:length(list) }" />
									</div>
								</div>
							</c:forEach>
							<div class="addPage"></div>
						</div>
					</div>
					<!-- /row -->
					<div class="space-12"></div>
					<div class="profile-activity clearfix"
									style="border: 1px; border-style: dotted; border-color: #d0d8e0">
							<input class="hide pageNum" value="${page.pageNum}" />
							<center><span>
								<button class="btn" type="button" onclick="history.go(-1)">
									<i class="icon-undo bigger-110"></i> 返回
								</button>
							</span>
							<button type="button" class="btn btn-small btn-primary"
								id="pageNext" style="display: none">查看后十条</button>
							<span class="noMore">
								<button type="button" disabled="disabled"
									class="btn btn-small btn-primary" id="pageNext">没有更多了....</button>
							</span></center>
						</div>
					</div>
				</div>
				<!-- /#feed -->
			</div>
		</div>
</body>
<script type="text/javascript">
	jQuery(function($) {
		var id = $(".id").val();
		var page = $(".pageNum").val();
		var recordSize = $(".recordSize").val();
		if (recordSize == 10) {
			$("#pageNext").show();
			$(".noMore").hide();
			$("#pageNext")
					.click(
							function() {
								$
										.post(
												"logM/findNextRecord.action",
												{
													"id" : id,
													"pageNum" : page
												},
												function(data, status) {
													page = data[data.length - 1]["pageNum"];
													for (var i = 0; i < data.length; i++) {
														if (i + 1 != data.length) {
															$(".addPage")
																	.append(
																			"<p><div class='profile-activity clearfix'><div class='pull-left' style='width: 80px;height:80px'><br /><font size='6' face='黑体' style='visibility: visible;'>"
																					+ (parseInt(data[data.length - 1]["total"])-(parseInt(page)-parseInt(1))*parseInt(10)-i)
																					+ "通:</font></div><div><p><span><i class='icon-comment-alt red bigger-130'></i></span>&nbsp;<span>问题:</span><span class='text-danger'>"
																					+ data[i]["question"]
																					+ "</span></p><p><span><i class='icon-comments-alt blue bigger-130'></i></span>&nbsp;<spanclass='text-primary'>内容:</span><span>"
																					+ data[i]["remark"]
																					+ "</span></p><div class='time'><span><i class='icon-time bigger-150'></i></span>&nbsp;<span>时间:</span><span>"
																					+ data[i]["time"]
																					+ "</span></div>");
														}
													}
													if (data.length >= 0) {
														if (data.length < 10) {
															$("#pageNext")
																	.hide();
															$(".noMore").show();
														}
													}
												});
							});
		}
	});
</script>
</html>