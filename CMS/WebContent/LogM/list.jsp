<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=path%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跟踪记录列表</title>
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
<style type="text/css">
.tel {
	backcolor: green;
}
</style>
</head>
<body>
	<div class="content">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<div class="table-header">跟踪记录列表</div>
					<s:form action="logM/record.action" method="post" id="form-list">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<td colspan="16">
										<div class="col-xs-12">

											筛选:<input name="search" placeholder="姓名/项目"
												value="${log.search}" />
											<c:if test="${loginU.role ne 0 }">&nbsp;员工:<select
													name="belongsname">
													<option value="0">全部</option>
													<c:forEach items="${suser}" var="su">
														<option value="${su.name}"
															<c:if test="${log.belongsname eq su.name}">selected="selected"</c:if>>${su.name}</option>
													</c:forEach>
												</select>
											</c:if>
											&nbsp;跟踪进度: <select name="rate">
												<option value="-1"
													<c:if test="${log.rate eq -1}">selected="selected"</c:if>>全部</option>
												<option value="0"
													<c:if test="${log.rate eq 0}">selected="selected"</c:if>>未联系上</option>
												<option value="1"
													<c:if test="${log.rate eq 1}">selected="selected"</c:if>>联系中</option>
												<option value="2"
													<c:if test="${log.rate eq 2}">selected="selected"</c:if>>来访签约</option>
												<option value="3"
													<c:if test="${log.rate eq 3}">selected="selected"</c:if>>来访未签约</option>
											</select> &nbsp;日期:<input type="text" name="startTime"
												placeholder="开始日期" class="datepicker"
												value="${log.startTime}" />到:<input type="text"
												name="endTime" placeholder="结束日期" value="${log.endTime}"
												class="datepicker" />&nbsp;
											<button class="btn btn-primary  search">
												<i class="icon-cloud-upload bigger-110"></i> 查询
											</button>

										</div>
									</td>
								</tr>
							</thead>

							<thead>
								<tr class="center">
									<th class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></th>
									<th style="text-align: center">姓名</th>
									<c:if test="${loginU.role ne 0 }">
										<th style="text-align: center">管理者</th>
									</c:if>
									<th style="text-align: center">客户来源</th>
									<th style="text-align: center">联系进度</th>
									<th style="text-align: center">通话时长</th>
									<th style="text-align: center">所报费用</th>
									<th style="text-align: center">创建时间</th>
									<th style="text-align: center">客户问题</th>
									<th style="text-align: center">沟通内容</th>
									<c:if test="${loginU.role eq 0 }">
										<th style="text-align: center">操作</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="li">
									<tr style="">
										<td style="padding-top: 14px" class="center itd"><label>
												<input type="checkbox" class="ace" /> <span class="lbl">
											</span>
										</label><input value="${li.id}" class="hide" /></td>
										<td style="padding-top: 14px" class="center">${li.name}</td>
										<c:if test="${loginU.role ne 0 }">
											<td style="padding-top: 14px" class="center">${li.belongsname}</td>
										</c:if>
										<td style="padding-top: 14px" class="center">${li.cfrom}</td>
										<td style="padding-top: 14px" class="center"><c:if test="${li.rate eq 3}">
												<span class="label label-gray arrowed-in-right arrowed">来访未签约</span>
											</c:if> <c:if test="${li.rate eq 2}">
												<span class="label label-success arrowed-in-right arrowed">来访签约</span>
											</c:if> <c:if test="${li.rate eq 1}">
												<span class="label label-warning arrowed-in-right arrowed">联系中</span>
											</c:if> <c:if test="${li.rate eq 0}">
												<span class="label label-info arrowed-in-right arrowed">未联系上</span>
											</c:if></td>
										<td style="padding-top: 14px" class="center tel">${li.talktime}</td>
										<td style="padding-top: 14px" class="center">${li.money}</td>
										<td style="padding-top: 14px" class="center">${li.time}</td>
										<td style="padding-top: 14px" class="center">
											<div
												class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<a data-toggle="modal"> <!-- data-target="#myModal"> -->
													<i class="icon-zoom-in bigger-130 mod" title="查看客户问题"></i>
											</div>
											<div class="modal fade myModal" id="myModal" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog"
													style="position: absolute; left: 350px; top: 150px;">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close closeM"
																data-dismiss="modal" aria-hidden="true">&times;</button>
															<h4 class="modal-title" id="myModalLabel">查看客户问题</h4>
														</div>
														<div class="modal-body">${li.question}</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default closeM"
																data-dismiss="modal">关闭</button>
														</div>
													</div>
												</div>
											</div>



										</td>
										<td style="padding-top: 14px" class="center">
											<div
												class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<a data-toggle="modal"> <!-- data-target="#myModal"> -->
													<i class="icon-zoom-in bigger-130 mop" title="查看沟通内容"></i>
											</div>
											<div class="modal fade myMopal" id="myMopal" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog"
													style="position: absolute; left: 350px; top: 150px;">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close closeM"
																data-dismiss="modal" aria-hidden="true">&times;</button>
															<h4 class="modal-title" id="myModalLabel">查看沟通内容</h4>
														</div>
														<div class="modal-body">${li.remark}</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default closeM"
																data-dismiss="modal">关闭</button>
														</div>
													</div>
												</div>
											</div>
										</td>
										<c:if test="${loginU.role eq 0 }">
											<td style="padding-top: 14px" class="center">
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="red" href="cusM/find.action?id=${li.id}"
														title="添加"> <i class="icon-pencil bigger-130"></i>
													</a>
												</div>
											</td>
										</c:if>
									</tr>
									<!-- 模态框（Modal） -->
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td <c:if test="${loginU.role ne 0 }">colspan="5"</c:if>
										<c:if test="${loginU.role eq 0 }">colspan="4"</c:if>
										style="padding-top: 14px" class="center"><b><font
											class="danger">小计</font></b></td>
									<td style="padding-top: 14px" class="center" id="sumTel"></td>
									<td colspan="16"></td>
								</tr>
								<tr>
									<td colspan="20" style="background-color: #ffffff"
										align="right">
										<ul class="pagination" style="margin-top: 0px; height: 10px">
											${page.pageFooter }
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</s:form>
				</div>
			</div>
		</div>
	</div>
	<!-- basic scripts -->
	<script src="assets/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<!-- 时间选择JS -->
	<script src="assets/js/jquery-ui-1.10.3.full.min.js?=1333s"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<!-- ace scripts -->
	<script src="assets/js/ace.min.js?v=${version}"></script>
	<!-- 分页插件 -->
	<script type="text/javascript" src="js/page.js?v=${version}"></script>
	<script type="text/javascript">
		jQuery(function($) {
			// checkbox 全选
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});
			//选择时间插件
			$(".datepicker").datepicker({
				showOtherMonths : true,
				selectOtherMonths : false,
			});
			$(".mod").click(
					function() {
						var modal = $(this).parent().parent().parent().find(
								".myModal");
						$(modal).attr("class", "modal fade in myModal");
						$(modal).attr("aria-hidden", "false");
						$(modal).show();
						$(".closeM").click(function() {
							$(modal).attr("class", "modal fade myModal");
							$(modal).attr("aria-hidden", "true");
							$(modal).hide();
						});
					});
			$(".mop").click(
					function() {
						var modal = $(this).parent().parent().parent().find(
								".myMopal");
						$(modal).attr("class", "modal fade in myMopal");
						$(modal).attr("aria-hidden", "false");
						$(modal).show();
						$(".closeM").click(function() {
							$(modal).attr("class", "modal fade myMopal");
							$(modal).attr("aria-hidden", "true");
							$(modal).hide();
						});
					});
			var sumTel = 0;

			$(".tel").each(function() {
				var time = $(this).html();
				$(".tel").css("font-color", "success");
				sumTel = sumTel + parseFloat(time);
			});
			$("#sumTel").html(sumTel.toFixed(2));
			$("#sumTel").css("font-color", "danger");
		});
	</script>
</body>
</html>
