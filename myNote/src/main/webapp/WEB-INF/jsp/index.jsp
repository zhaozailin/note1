<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zailinZhao's note</title>
<!-- 语法高亮插件 -->
<link type="text/css" rel="stylesheet" href="styles/plugin/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css"/>
<!-- font awesome -->
<link type="text/css" rel="stylesheet" href="styles/plugin/font-awesome-4.0.1/css/font-awesome.css"/>
<!-- bootstrap -->
<link type="text/css" rel="stylesheet" href="js/dist/css/bootstrap.css"/>
<!-- 公用样式 -->
<link type="text/css" rel="stylesheet" href="styles/common.css"/>

<script type="text/javascript">
// 	$(document).ready(function(){
// 		dp.SyntaxHighlighter.ClipboardSwf = 'styles/plugin/dp.SyntaxHighlighter/Scripts/clipboard.swf';
// 	    dp.SyntaxHighlighter.HighlightAll('code');
// 	});
</script>
</head>
<body>
	<div class="container" style="margin-top:10px" id="queryFieldset">
		<div class="row">
			<div class="col-xs-12">
				<p class="text-muted">zailinZhao's note online v1.0</p>
			</div>
		</div>
		<div class="row" id="queryBtnField">
			<div class="col-xs-12">
				<div class="input-group">
					<input type="text" class="form-control" id="queryKeyword">
					<span class="input-group-btn">
						<button class="btn btn-success" type="button" id="queryIconBtn">Go</button>
					</span>
				</div>
			</div>
		</div>
		<div style="height: 30px; margin-top: 10px; font-size: 20px;">
			<i class="fa fa-spinner fa-spin" id="loadingUI" style="display: none;"></i>
		</div>
	</div>
	<div style="position: relative;">
		<div class="container" id="mainContents" style="min-height:650px"></div>
		<div class="container" id="viewContents" style="display: none;height: 1px;position: absolute;background-color:#ffffff;left: 50%;margin-left: -485px;z-index:2;">
			<div style="font-size:20px;" id="articleTitle"></div>
			<div style="" id="articleContent"></div>
			<ul class="pager">
			  <li class="previous"><a href="javascript:void(0)" id="returnBtn">&larr; 返回</a></li>
			</ul>
		</div>
	</div>
	
	
<!-- jquery -->
<script type="text/javascript" src="js/plugin/jquery-1.10.2.min.js"></script>
<!-- 语法高亮插件 -->
<script language="javascript" src="styles/plugin/dp.SyntaxHighlighter/Scripts/shCore.js"></script>
<script language="javascript" src="styles/plugin/dp.SyntaxHighlighter/Scripts/shBrushCSharp.js"></script>
<script language="javascript" src="styles/plugin/dp.SyntaxHighlighter/Scripts/shBrushXml.js"></script>
<!-- bootstrap -->
<script language="javascript" src="js/dist/js/bootstrap.min.js"></script>
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/article.js"></script>
</body>
</html>