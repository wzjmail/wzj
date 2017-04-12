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
<title>新增跟踪记录</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.css" />
<link rel="stylesheet" href="assets/css/colorpicker.css" />
<!-- 操作下的小图标 -->
<link rel="stylesheet"
	href="assets/css/font-awesome.min.css?v=${version}" />
<!-- 页面只要的 样式 -->
<link rel="stylesheet" href="assets/css/ace.min.css?v=${version}" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>
<style type="text/css">
.sright {
	float: right;
}

pre {
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
	word-wrap: break-word;
}
</style>
</head>

<body style="background-color: #FFFFFF">
	<div class="table-header"
		style="margin-top: 10px; margin-left: 18px; margin-right: 18px">新增跟踪记录</div>
	<form id="addForm" method="post" action="logM/addRecord.action">
		<input value="${cus.id }" class="hide" name="id" />
		<table style="margin-left: 18px; width: 97%;" id="sample-table-1"
			class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td width="10%">客户姓名:</td>
					<td width="15%"><input type="text" name="name"
						class=" col-xs-12 name" value="${cus.name }" />
						<input type="text" name="startTime"
						style="display: none" value="${cus.startTime }" />
						<input type="text" name="endTime"
						style="display: none" value="${cus.endTime }" />
						<input type="text" name="restatus"
						style="display: none" value="${cus.restatus }" />
						</td>
					<td width="10%">客户地址:</td>
					<td width="15%"><input type="text" name="address"
						class=" col-xs-12 address" value="${cus.address }" /></td>
					<td width="10%">客户QQ/微信:</td>
					<td width="15%"><input type="text" name="qq"
						class=" col-xs-12 qq" value="${cus.qq }" /></td>
					<td width="10%">客户电话:</td>
					<td width="15%"><input type="text" name="tel"
						class=" col-xs-12 tel" value="${cus.tel }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td width="10%">客户来源:</td>
					<td width="15%"><input type="text" name="cfrom"
						class=" col-xs-12 cfrom" value="${cus.cfrom }" /></td>
					<td width="10%">客户类别:</td>
					<td width="15%"><select class="typec" name="type">
							<option value="1"
								<c:if test="${cus.type eq 0 }">selected="selected"</c:if>>请选择</option>
							<option value="1"
								<c:if test="${cus.type eq 1 }">selected="selected"</c:if>>A+</option>
							<option value="2"
								<c:if test="${cus.type eq 2 }">selected="selected"</c:if>>A</option>
							<option value="3"
								<c:if test="${cus.type eq 3 }">selected="selected"</c:if>>B</option>
							<option value="4"
								<c:if test="${cus.type eq 4 }">selected="selected"</c:if>>C</option>
							<option value="5"
								<c:if test="${cus.type eq 5 }">selected="selected"</c:if>>D</option>
							<option value="6"
								<c:if test="${cus.type eq 6 }">selected="selected"</c:if>>E</option>
							<option value="7"
								<c:if test="${cus.type eq 7 }">selected="selected"</c:if>>F</option>
					</select></td>
					<td width="10%">通话时长:</td>
					<td width="15%"><input type="text" name="talktime" value="0" /></td>
					<td width="10%">咨询项目:</td>
					<td width="15%"><select name="project">
							<option value="1"
								<c:if test="${log.project eq 1 }">selected="selected"</c:if>>好味至</option>
							<option value="2"
								<c:if test="${log.project eq 2 }">selected="selected"</c:if>>有碗面</option>
							<option value="3"
								<c:if test="${log.project eq 3 }">selected="selected"</c:if>>坛香园</option>
					</select></td>
				</tr>
				<tr>
					<td width="10%">所报费用:</td>
					<td width="15%"><input type="text" name="money"
						onkeyup="this.value=this.value.replace(/[^\d.]/g,'') "
						onafterpaste="this.value=this.value.replace(/[^\d.]/g,'') "
						class=" col-xs-12 money" /></td>
					<td width="10%">联系进度:</td>
					<td width="15%"><select name="rate" class="rate">
							<option value="1"
								<c:if test="${MaxRate eq 1}">selected="selected"</c:if>>联系中</option>
							<option value="0"
								<c:if test="${MaxRate eq 0}">selected="selected"</c:if>>没联系上</option>
							<option value="2"
								<c:if test="${MaxRate eq 2}">selected="selected"</c:if>>来访签约</option>
							<option value="3"
								<c:if test="${MaxRate eq 3}">selected="selected"</c:if>>来访未签约</option>
					</select></td>
					<td width="10%">客户意向:</td>
					<td width="15%"><c:if test="${cus.caim eq 0}">
							<select name="caim" class="caim">
								<option value="0" selected="selected">未选择</option>
								<option value="1">针</option>
								<option value="2">创</option>
								<option value="3">无</option>
							</select>
						</c:if>
						<c:if test="${cus.caim eq 1}">针<input name="caim" value="${cus.caim}" class="hide" /></c:if>
						<c:if test="${cus.caim eq 2}">创<input name="caim" value="${cus.caim}"  class="hide"  /></c:if>
						<c:if test="${cus.caim eq 3}">无<input name="caim" value="${cus.caim}"  class="hide"  /></c:if></td>
				</tr>
			</tbody>
		</table>
		<div class=row>
			<div class="col-xs-6">
				<div class="row"
					style="height: 100px; padding-top: 13px; padding-left: 10px">
					<div class="col-xs-2" style="padding-top: 13px">
						<span class="sright"><font size="3">客户问题:</font></span>
					</div>
					<div style="padding-top: 13px" class="col-xs-10">
						<span><textarea name="question"
								class="form-control  col-xs-12 question" id="form-field-8"
								style="height: 85px"></textarea></span>
					</div>
				</div>
				<div class="row"
					style="height: 230px; padding-top: 13px; padding-left: 10px">
					<div class="col-xs-2" style="padding-top: 13px">
						<span class="sright"><font size="3">沟通内容: </font></span>
					</div>
					<div style="padding-top: 13px" class="col-xs-10">
						<span><textarea name="remark"
								class="form-control  col-xs-12 remark" id="form-field-8"
								style="height: 215px"></textarea></span>
					</div>
					<c:if test="${loginU.role eq 0 }">
						<input class="hide belongsname" value="${loginU.name }"
							name="belongsname" />
					</c:if>
				</div>
			</div>
			<div class="co-xs-6"
				style="height: 245px; padding-top: 13px; padding-left: 10px; margin-top: 13px">
				<div class="row">
					<div class="col-xs-1">
						<span><font size="3">历史记录:</font></span>
					</div>
					<div
						style="max-height: 320px; border: 1px solid #D5D5D5; overflow-y: auto;"
						class="col-xs-4">
						<c:forEach items="${list}" var="li">
							<div onmouseover="this.style.backgroundColor='#ffe9c9'"
								onmouseout="this.style.backgroundColor='#fff'">
								<p onmouseover="">时间:${li.time }管理者:${li.belongsname}</p>
								<p>问题:${li.question }</p>
								<p>内容:${li.remark }</p>
								<hr />
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="height: 50px">
			<div class="col-xs-9" style="padding-top: 7px; margin-left: 20%">
				<div class="col-xs-3"></div>
				<a onclick="history.go(-1)"><button type="button"
						class="btn  btn-warning ">
						<i class="icon-undo bigger-100"></i> 上一步
					</button></a>
				<button type="button" class="btn  btn-success  save">
					保存 <i class="icon-ok bigger-100"></i>
				</button>
			</div>
		</div>
	</form>
	<script src="assets/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			$(".save").off("click").on("click", function() {
				var talktime = $(".talktime").val();
				var rate = $(".rate").val();
				var typec = $(".typec").val();
				var remark = $(".remark").val();
				var caim = $(".caim").val();
				if (rate.length == 0 || typec == 0 || remark.length == 0||caim == 0) {
					alert("进度，客户类别，沟通内容，客户意向必填！");
				} else {
					if (confirm("确定保存?")) {
						$("#addForm").submit();
					}
				}
			});
			var rate = $(".rate").val();
			$(".rate").change(function() {
				var rats = $(this).val();
				if (rate > rats) {
					alert("联系进度不可逆！");
					$(".rate").val(rate);
				}
			});
		})
	</script>
</body>
</html>
