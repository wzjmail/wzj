<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=path%>" />
<link rel="shortcut icon" href="images/logo/plogo.png"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>米良后台管理系统</title>
<!-- basic styles -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css?v=${version}" />


<script src="assets/js/ace-extra.min.js"></script>
<script type="text/javascript">
	function resize() {
		var bWidth = (document.documentElement.scrollWidth > document.documentElement.clientWidth) ? document.documentElement.scrollWidth
				: document.documentElement.scrollWidth;
		//console.log(bWidth);
		if (bWidth < 1200) {

			$("#sidebar").attr("class", "sidebar sidebar-fixed menu-min");
			$("#change").attr("class", "icon-double-angle-right");
			$("#breadcrumbs").attr("style", "height: 51px;left: 2.7%;");
			$("#concent")
					.attr("style",
							"border: 0px; width: 97%; position: absolute; top: 95px;left:2.7%");
		} else {
			$("#sidebar").attr("class", "sidebar sidebar-fixed");
			$("#change").attr("class", "icon-double-angle-left");
			$("#breadcrumbs").attr("style", "height: 51px;left: 13%;");
			$("#concent")
					.attr("style",
							"border: 0px; width: 87%; position: absolute; top: 95px;left:13%");
		}
	}
</script>
</head>

<body onresize="resize()">
	<div class="navbar fixed navbar-fixed-top " id="navbar">
		<div class="navbar-container" id="navbar-container">
			<div style="height: 55px;" class="navbar-header pull-left">
				<a class="ind"> <img style="height: 55px;"
					src="images/logo/logo.png" />
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-header pull-right" role="navigation"
				style="position: absolute; right: 0px">
				<ul class="nav ace-nav" style="height: 55px;">
			<!-- 		<c:if test="${loginU.role eq 0 }">
						<li class="grey"><a style="width: 80px;"
							href="cusM/dayout.action" target="rightJsp"> <i
								class="icon-tasks bigger-130" style="font-size: 20px"></i> <span
								class="badge badge-danger"
								style="font-size: 18px; padding-top: 4px; padding-bottom: 4px">${dt}</span>
						</a></li>
						<li class="grey"><a data-toggle="dropdown"
							class="dropdown-toggle" style="width: 80px;" href="#"> <i
								class="icon-tasks bigger-130" style="font-size: 20px"></i> <span
								class="badge badge-danger num"
								style="font-size: 18px; padding-top: 4px; padding-bottom: 4px">${newNum}</span>
						</a>
							<ul
								class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header"><i class="icon-warning-sign "></i>
									共${newNum}个新任务</li>

							
							
							<li style="width: 238px; height: 50px"><a
									style="border-bottom: 0px solid"
									href="cusM/noLook.action?look=0" onclick="$('.num').html('0');"
									target="rightJsp">
										<div class="clearfix">
											<span class="pull-left">新任务${newNum},占总数:</span> <span
												class="pull-right">${newNumB}%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:${newNumB}%" class="progress-bar "></div>
										</div>
								</a></li> 
								
								<li style="width: 238px; height: 50px"><a
									style="border-bottom: 0px solid"
									href="cusM/noLook.action?look=0" onclick="$('.num').html('0');"
									target="rightJsp">
										<div class="clearfix">
											<span class="pull-left">新任务${newNum},占总数:</span> <span
												class="pull-right">${newNumB}%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:${newNumB}%" class="progress-bar "></div>
										</div>
								</a></li>
								<li class="divider" style="width: 238px;"></li>
								<li style="width: 238px; height: 50px"><a
									href="logM/record.action?rate=-5" target="rightJsp">
										<div class="clearfix">
											<span class="pull-left">完成${num}个.完成率:</span> <span
												class="pull-right">${number}%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:${number}%"
												class="progress-bar progress-bar-info "></div>
										</div>
								</a></li>
								<li style="width: 238px; height: 35px" class="dropdown-header">
								</li>
							</ul></li>
								
								
								
									
				
				</c:if>
					<c:if test="${loginU.role eq 3 }">
						<li class="grey"><a data-toggle="dropdown"
							class="dropdown-toggle" style="width: 80px;" href="#"><i
								class="icon-tasks bigger-130" style="font-size: 20px"></i> <span
								class="badge badge-danger num"
								style="font-size: 18px; padding-top: 4px; padding-bottom: 4px">${newNum}</span>
						</a>
							<ul
								class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header"><i class="icon-ok"></i>
									共${newNum}个新任务</li>

								<li style="width: 238px; height: 50px"><a
									href="cusM/list.action?restatus=0" target="rightJsp">
										<div class="clearfix">
											<span class="pull-left">新任务${newNum},完成率:</span> <span
												class="pull-right">${100-newNumB}%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:${100-newNumB}%" class="progress-bar "></div>
										</div>
								</a></li>
								<li class="divider" style="width: 238px;"></li>
								<li style="width: 238px; height: 35px" class="dropdown-header">
								</li>
							</ul></li>
					</c:if>    -->
					
					<li class="light-blue"><a data-toggle="dropdown"
						style="font-size: 20px; height: 55px; width: 170px" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" /> <span class="user-info"
							style="font-size: 12px; position: relative; top: 15px"> <small>欢迎光临</small>
								${loginU.name }
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="userM\query.action?id=${loginU.id}"
								target="rightJsp"> <i class="icon-user"></i> 个人资料
							</a></li>

							<li class="divider"></li>

							<li><a href="userM/loginOut.action"> <i class="icon-off"></i>
									退出
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"
				style="z-index: 2000;"> <span class="menu-text"></span>
			</a>

			<div class="sidebar sidebar-fixed" style="top: 55px;" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div style="height: 40px;" class="sidebar-shortcuts-large"
						id="sidebar-shortcuts-large">
						<button style="height: 80%; width: 20%" class="btn btn-success">
							<i style="height: 30px" class="icon-signal"></i>
						</button>

						<button style="height: 80%; width: 20%" class="btn btn-info">
							<i style="height: 30px" class="icon-pencil"></i>
						</button>

						<button style="height: 80%; width: 20%" class="btn btn-warning">
							<i style="height: 30px" class="icon-group"></i>
						</button>

						<button style="height: 80%; width: 20%" class="btn btn-danger">
							<i style="height: 30px" class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">

					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-group"></i> <span class="menu-text">订单信息 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">

							<c:if test="${loginU.role eq 0 }">
								<li class="menu-list"><a
									href="cusM/list.action?belongs=-1&restatus=-1"
									target="rightJsp"> <span class="menu-list"> </span>
								</a></li>
							</c:if>
									<li class="menu-list"><a
								href="orderM/list.action?rate=2&restatus=-1" target="rightJsp">
									<span class="menu-list">全部订单 </span>
							</a></li>
							<li class="menu-list"><a
								href="cusM/list.action?rate=2&restatus=-1" target="rightJsp">
									<span class="menu-list">出货单 </span>
							</a></li>
							<li class="menu-list"><a
								href="cusM/list.action?rate=3&restatus=-1" target="rightJsp">
									<span class="menu-list">进货单</span>
							</a></li>
							<%--<c:if test="${loginU.role eq 0 || loginU.role eq 1 }">       
								<li class="menu-list"><a
									href="logM/record.action?rate=-1&belongsname=0"
									target="rightJsp"><span class="menu-list">跟踪记录 </span> </a></li>
							</c:if>
							<c:if test="${loginU.role eq 3 ||loginU.role eq 1||loginU.role eq 0 }">
								<li class="menu-list"><a href="visM/list.action?status=-1&belongs=-2"
									target="rightJsp"><span class="menu-list">回访记录 </span> </a></li>
							</c:if> --%>
						</ul></li>
						
						<li><a href="#" class="dropdown-toggle"> <i
								class="icon-cogs"></i> <span class="menu-text">商品信息  </span> <b
								class="arrow icon-angle-down"></b>
						</a>
							<ul class="submenu">
								<li class="menu-list"><a href="goodsM/list.action?role=-1"
									target="rightJsp"> <span class="menu-list">商品管理 </span>
								</a>
								</li>
								
								<%--<li class="menu-list"><a href="userM/list.action?role=-1"
									target="rightJsp"> <span class="menu-list">零食/茶酒 </span>
								</a>
								
								</li>
								<li class="menu-list"><a href="userM/list.action?role=-1"
									target="rightJsp"> <span class="menu-list">厨具/收纳 </span>
								</a>
								
								</li>
								<li class="menu-list"><a href="userM/list.action?role=-1"
									target="rightJsp"> <span class="menu-list">服装 </span>
								</a>
								
								</li>--%>
								
								
							</ul>
							</li>
							
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-group"></i> <span class="menu-text">合作商信息 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">

							
							<li class="menu-list"><a
								href="cusM/list.action?role=-1" target="rightJsp">
									<span class="menu-list">顾客管理 </span>
							</a></li>
							<li class="menu-list"><a
								href="provM/list.action?role=-1"target="rightJsp">
									<span class="menu-list">供应商管理</span>
							</a></li>
							
						</ul></li>
						
					
						
						
				
						
							
							
							
							
							
							
							
							
							
					<c:if test="${loginU.role eq 1 }">
						<li><a href="#" class="dropdown-toggle"> <i
								class="icon-cogs"></i> <span class="menu-text">用户管理 </span> <b
								class="arrow icon-angle-down"></b>
						</a>
							<ul class="submenu">
								<li class="menu-list"><a href="userM/list.action?role=-1"
									target="rightJsp"> <span class="menu-list">员工信息 </span>
								</a>
								
								</li>
							</ul></li>
					</c:if>


				</ul>
				<!-- -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i id="change" class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
			</div>

			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>
		</div>
		<!-- /.main-container-inner -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<script src="assets/js/jquery-2.0.3.min.js"></script>

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<" + "script>");
	</script>

	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/jquery.slimscroll.min.js"></script>
	<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
	<script src="assets/js/jquery.sparkline.min.js"></script>
	<script src="assets/js/flot/jquery.flot.min.js"></script>
	<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
	<script src="assets/js/flot/jquery.flot.resize.min.js"></script>


	<!-- ace scripts -->
	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			var sr = $("#change").attr("class");
			if (sr.indexOf("left") >= 0) {
				$("#breadcrumbs").attr("style", "height: 51px;left: 13%;");
				$("#concent")
						.attr("style",
								"border: 0px; width: 87%; position: absolute; top: 95px;left:13%");
			} else {
				$("#breadcrumbs").attr("style", "height: 51px;left: 2.7%;");
				$("#concent")
						.attr("style",
								"border: 0px; width: 97%; position: absolute; top: 95px;left:2.7%");
			}

			$('#change')
					.click(
							function() {
								var str = $(this).attr("class");
								if (str.indexOf("left") >= 0) {
									$("#breadcrumbs").attr("style",
											"height: 51px;left: 2.7%;");
									$("#concent")
											.attr("style",
													"border: 0px; width: 97%; position: absolute; top: 95px;left:2.7%");
								} else {
									$("#breadcrumbs").attr("style",
											"height: 51px;left: 13%;");
									$("#concent")
											.attr("style",
													"border: 0px; width: 87%; position: absolute; top: 95px;left:13%");
								}
							});
			//动态加载导航栏
			$(".menu-text")
					.click(
							function() {
								var menu = $(this).html();
								var base = "<ul class='breadcrumb'><li style='line-height: 61px;'><i class='icon-home home-icon'></i><a href='userM/index.action'>首页</a></li><li style='line-height: 61px;'>"
										+ menu + "</li></ul>";
								$("#breadcrumbs").html(base);
							});

			$(".menu-list")
					.click(
							function() {
								var obj = $(this).parent().parent().parent()
										.parent();
								var parentMenu = obj.find(".menu-text").html();
								var menu = $(this).html();
								var base = "<ul class='breadcrumb'><li style='line-height: 61px;'><i class='icon-home home-icon'></i><a href='userM/index.action'>首页</a></li><li style='line-height: 61px;'>"
										+ parentMenu
										+ "</li><li style='line-height: 61px;'>"
										+ menu + "</li></ul>";
								$("#breadcrumbs").html(base);

							});
		});

		function iFrameHeight() {
			var ifm = document.getElementById("concent");
			var subWeb = document.frames ? document.frames["concent"].document
					: ifm.contentDocument;
			if (ifm != null && subWeb != null) {
				ifm.height = subWeb.body.scrollHeight;
			}
			//console.log(ifm.height);
		}
	</script>
	<div class="main-content" id="right">
		<div class="breadcrumbs fixed" style="height: 51px;" id="breadcrumbs">
			<ul class="breadcrumb">
				<li style="line-height: 61px;"><i class="icon-home home-icon"></i>
					<a class="ind">首页</a></li>
				<li style="line-height: 61px;">主面板</li>
			</ul>
		</div>
		<iframe src="welcome.jsp" id="concent" name="rightJsp" scrolling="no"
			frameborder="0" onLoad="iFrameHeight()"
			style="border: 0px; position: absolute; top: 95px;" scrolling="no"></iframe>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse" style="position: fixed;">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<script type="text/javascript">
		function reinitIframe() {
			var iframe = document.getElementById("concent");
			try {
				iframe.height = iframe.contentWindow.document.documentElement.scrollHeight;
			} catch (ex) {
			}
		}
		window.setInterval("reinitIframe()", 200);
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			$.post("userM/checkLogin.action", {}, function(data, success) {
				if (data == 0) {
					window.location.href = "login.jsp";
				}
			});
			$(".ind").off("click").on("click", function() {
				window.location.href = "userM/index.action";
			});
		});
	</script>
</body>

</html>