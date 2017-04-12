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
<title>GoodsList</title>
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
</head>
<body>
	<div class="content">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<div class="table-header">顾客列表</div>
					<div class="table-responsive">
						<s:form action="cusM/list.action" method="post" id="form-list"
							commandName="cus">
							<table id="sample-table-1"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<td colspan="8">
											<div class="col-xs-12 col-sm-12">
												检索:<input type="text" name="search" placeholder="单位名称/电话"
													value="${us.search}" />
												<c:if test="${loginU.role eq 1 }">&nbsp;单位类型 <select
														name="role" >
														<option value="-1"
															<c:if test="${us.role eq -1 }">selected="selected"</c:if>>全选</option>
														<option value="1"
															<c:if test="${us.role eq 1 }">selected="selected"</c:if>>经销商</option>
														<option value="0"
															<c:if test="${us.role eq 0}">selected="selected"</c:if>>供应商</option>
														
													</select>
												</c:if>
												&nbsp;
												<button class="btn btn-primary search">
													<i class="icon-cloud-upload bigger-110"></i> 查询
												</button>
												&nbsp;
												
													<a href="cusM/addCus.action"><button type="button"
															class="btn btn-success radius-5">
															<i class="icon-save bigger-110"></i>增加
														</button></a>
												
											</div>
										</td>
									</tr>
								</thead>
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace"> <span class="lbl"></span>
										</label></th>
										<th class="center">单位名称</th>
										<th class="center">电话</th>
										<th class="center">单位类型</th>
										<th class="center">操作</th>
									</tr>
								</thead>
								<tbody>
								<%-- <c:if test="${loginU.role eq  1 }">--%>	
										<c:forEach items="${list}" var="li">
											<tr>
												<td class="center"><label> <input
														type="checkbox" class="ace" /> <span class="lbl"></span>
												</label> <input class="id" type="hidden" value="${li.id}" /></td>
												<td class="center name">${li.name}</td>
												<td class="center tel">${li.tel}</td>
												<td class="center">
													<div class="chanR" style="display: none">
														<select class="type">
															<option value="1"
																<c:if test="${li.type eq 1 }">selected="selected"</c:if>>经销商</option>
															<option value="0"
																<c:if test="${li.type eq 0 }">selected="selected"</c:if>>供应商</option>
															
														</select>
													</div>
													<div class="showR">
														<%-- <c:if test="${li.role eq 0}"> 
															<span
																class="label label-success arrowed-in-right arrowed"></span>
														</c:if>--%>
														<c:if test="${li.type eq 1}">
															<span class="label label-danger arrowed-in-right arrowed">经销商</span>
														</c:if>
														<c:if test="${li.type eq 0}">
															<span
																class="label label-warning arrowed-in-right arrowed">供应商</span>
														</c:if>
														
													</div>
												</td>
											<%--<td class="center">${li.time}</td> --%>
												
												<td class="center">
													<div
														class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														
																<a class="green updateGoods"
																	href="cusM/query.action?id=${li.id}"> <i
																	class="icon-pencil bigger-130"></i>
																</a>
					
												                <a class="red delete"> <i
																class="icon-trash bigger-130"></i>
															</a>
													</div>
												</td>
											</tr>
										</c:forEach>
					
								</tbody>
								<tfoot>
									<tr>
										<td colspan="8" style="background-color: #ffffff"
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
	<script src="assets/js/jquery-ui-1.10.3.full.min.js?v=${version}"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js?v=${version}"></script>
	<!-- ace scripts -->
	<script src="assets/js/ace.min.js?v=${version}"></script>
	<!-- 分页插件 -->
	<script type="text/javascript" src="js/page.js?v=${version}"></script>  <%-- javascript 常用来给web页面 添加各种动态功能，比如响应客户的 --%>>
	<script>
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
			$(".delete").click(function() {
				var obj = $(this).parent().parent().parent();
				var id = obj.find(".id").val();
				if (confirm("确定删除吗？")) {
					$.post("cusM/delete.action", {
						"id" : id
					}, function(data, success) {
						
							$(obj).hide();
						
					});
				}
			});
	/*	更改权限
			$(".showR").click(function() {
				var ts = $(this);
				var id = $(this).parent().parent().find(".id").val();
				$(this).hide();
				var div = $(this).parent().find(".chanR");
				div.show();
				$(".ro").focus().select();
				var sel = div.find(".ro");
				$(sel).change(function() {
				var sa = $(sel).val();
					if (confirm("确定修改商品类型么？")) {
						$.post("goodsM/updateRole.action", {
							"role" : $(sel).val(),
							"id" : id
						}, function(data, success) {
							if (data == 1) {
								if (sa == 1) {
									$(ts).html("<span class='label label-success arrowed-in-right arrowed'>个人护理</span>");
								}if (sa == 2) {
									$(ts).html("<span class='label label-warning arrowed-in-right arrowed'>零食/茶酒</span>");
								}if (sa == 3) {
									$(ts).html("<span class='label label-danger arrowed-in-right arrowed'>厨具/收纳</span>");
								}if (sa == 4) {
									$(ts).html("<span class='label label-info arrowed-in-right arrowed'>服装饰品</span>");
								}
							} else {
								alert("失败,该用户名下还有客户，请交接完成再进行操作");
							}
						});
					}
					div.hide();
					$(div).parent().find(".showR").show();
				});
				$(".ro").blur(function() {
					history.go(0);
					$(".showR").show();
					$(".chanR").hide();
				});

			});
	
	*/

			//选择时间插件
			$(".datepicker").datepicker({
				showOtherMonths : true,
				selectOtherMonths : false,
			});

		})
	</script>
</body>
</html>
