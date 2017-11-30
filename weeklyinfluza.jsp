<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String refererUrl = request.getHeader("Referer");
	request.setAttribute("MENU_INDEX", "mainBaseData");
%>
<%@ include file="../../taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/css.css" type="text/css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/equipment/css.css" type="text/css" rel="stylesheet">
<title>基础数据管理</title>
</head>
<body>
	<%@ include file="../public/top.jsp"%>
	<table class="main-table" cellpadding="0" cellspacing="0">
		<tr style="border-bottom-color: white;">
			<td style="height: 44px; border: none; padding: 1px" colspan="2">
				<%@ include file="../public/nav.jsp"%>
			</td>
		</tr>
		<tr>
			<td id="current-location" align="left" colspan="2">&nbsp;&nbsp;<b>当前位置：</b>&nbsp;<span
				id="cur-title"></span></td>
		</tr>
		<tr valign="top">
			<td class="main-table-left"><%@ include file="left-nav.jsp"%>
			</td>
			<td align="center" class="main-table-right">
				<form method="post"
					action="/mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt">
					<input type="hidden" name="page" value="${lo.curPage}" />
					<table id="container" cellpadding="0" cellspacing="0" rules="none">
						<tr height="20">
							<td align="left">
								<fieldset>
									<legend></legend>
									<table border="0" cellpadding="2" cellspacing="0" width="100%"
										id="search">
										<tr>
											<td align="right" width="300px">周序号:</td>
											<td width="150px"><input type="text" name="weekNo"></td>

											<td align="left"><input type="button" class="btn search"
												onclick="Query()" value="查询" title="Search"></td>

											<td align="center"><input type="button" class="btn add"
												value="新增" onclick="add()" title="Add Case"></td>
										</tr>
									</table>

								</fieldset>
							</td>
						</tr>
						<tr>
							<td align="center" id="main">
								<table border="1" cellpadding="0" cellspacing="0">
									<thead align="center">
										<tr>
											<td>序 号</td>
											<td>周序号</td>
											<td>北方ILI%</td>
											<td>南方ILI%</td>
											<td>全国ILI%</td>
											<td>详细信息</td>
											<td>编辑</td>
											<td>删除</td>
										</tr>
									</thead>
									<c:if test="${not empty lo.resultList}">
										<c:forEach var="itembean" items="${lo.resultList}"
											varStatus="status">
											<tr>
												<td>${status.count+(lo.curPage-1)*lo.pageSize}</td>
												<td>${itembean.weekNo}</td>
												<td>${itembean.northIli}</td>
												<td>${itembean.sourthIli}</td>

												<td>${itembean.nationIli}</td>

												<td><a
													href="javascript:contentdetail('${itembean.id}')"
													class="detail" title="detail"></a></td>
												<td><a href="javascript:edit('${itembean.id}')"
													class="edit" title="edit"></a></td>
												<td><a href="javascript:del('${itembean.id}')"
													class="delete" title="delete"></a></td>
											</tr>
										</c:forEach>
									</c:if>
									<tr class="page_nav">
										<td colspan="3" align="left" class="left_page_nav">
											&nbsp; 共 ${lo.totalCount} 项&nbsp;&nbsp;&nbsp; ${lo.curPage} 页
											&nbsp;&nbsp;&nbsp; <a href="javascript:GoPage(0);"> 更新</a>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td colspan="5" align="right" class="right_page_nav"><c:choose>
												<c:when test="${lo.curPage>1}">
													<a href="javascript:GoPage(1);">第一页 </a>
									&nbsp;
									<a href="javascript:GoPage(${lo.curPage-1 });">上一页</a>
												</c:when>
												<c:otherwise>
													<font color=#CCCCCC>第一页</font>
									&nbsp;
									<font color=#CCCCCC>上一页</font>
												</c:otherwise>
											</c:choose> &nbsp; <c:choose>
												<c:when test="${lo.curPage<lo.totalPage}">
													<a href="javascript:GoPage(${lo.curPage+1});">下一页</a>
									&nbsp;
									<a href="javascript:GoPage(${lo.totalPage});">末页</a>
												</c:when>
												<c:otherwise>
													<font color=#CCCCCC>下一页</font>
									&nbsp;
									<font color=#CCCCCC>末页</font>
												</c:otherwise>
											</c:choose> &nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="../js/common.js"></script>
	<script src="../js/boot.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jqueryForm.js"></script>
	<script type="text/javascript" src="../js/alertBoot.js"></script>
	<script type="text/javascript" src="../js/echarts.js"></script>
	<script type="text/javascript">
		$('#weeklyInfluzaMgmt').parent().children('a').show();
		$('#weeklyInfluzaMgmt').addClass('left-nav-active');
		$('#cur-title').html("基础数据管理 -> 每周流感信息管理 ");
		function GoPage(NewPageNum) {
			if (NewPageNum > 0)
				document.forms[0].page.value = NewPageNum;
			document.forms[0].action = "../mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt";
			document.forms[0].submit();
		}

		function Query() {
			document.forms[0].action = "../mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt";
			document.forms[0].page.value = 1;
			document.forms[0].submit();
		}

		function contentdetail(id) {
			mini
					.open({
						url : "../mainBaseData/weeklyInfluzaMgmt.do?method=toweeklyinfluzadetail&id="
								+ id,
						showMaxButton : true,
						title : "详细信息",
						width : 700,
						height : 500,
						ondestroy : function(action) {
							if (action == 'save') {
								window
										.open(
												'../mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt',
												'_self');
							}
						}
					});
		}

		function add() {
			mini
					.open({
						url : "../mainBaseData/weeklyInfluzaMgmt.do?method=toaddWeeklyInfluzaMgmt",
						showMaxButton : true,
						title : "增加",
						width : 700,
						height : 700,
						ondestroy : function(action) {
							if (action == 'save') {
								window
										.open(
												'../mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt',
												'_self');
							}
						}
					});
		}

		function edit(id) {
			mini
					.open({
						url : "../mainBaseData/weeklyInfluzaMgmt.do?method=toeditweeklyInfluzaMgmt&id="
								+ id,
						showMaxButton : true,
						title : "编辑",
						width : 700,
						height : 700,
						ondestroy : function(action) {
							if (action == 'save') {
								window
										.open(
												'../mainBaseData/weeklyInfluzaMgmt.do?method=listWeeklyInfluzaMgmt',
												'_self');
							}
						}
					});
		}

		function del(id) {
			askmsg = "确定删除？";
			cfm(askmsg, function() {
				deleteItems(id);
			}, function() {
				window.location.reload();
			});
		}
		function deleteItems(id) {
			document.forms[0].action = "../mainBaseData/weeklyInfluzaMgmt.do?method=deleteweeklyInfluzaMgmt&id="
					+ id;

			var options = {
				beforeSubmit : showRequest, // pre-submit callback 
				success : showResponse, // post-submit callback 
				type : 'post', // 'get' or 'post', override for form's 'method' attribute 
				dataType : 'xml', // 'xml', 'script', or 'json' (expected server response type) 
				clearForm : true, // clear all form fields after successful submit 
				resetForm : true
			// reset the form after successful submit  
			};
			$(document.forms[0]).ajaxSubmit(options);

			function showRequest(formData, jqForm, options) {
			}
			function showResponse(responseXML, statusText) {
				var statu = $('statu', responseXML).text();
				var messages = $('message', responseXML).text();

				if (statu == 'true') {
					infoMsg(messages, function() {
						window.location.reload();
					});
				} else
					alertMsg(messages);
			}
		}
	</script>
</body>
</html>