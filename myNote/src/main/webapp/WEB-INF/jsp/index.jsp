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
	<div class="container" style="margin-bottom:20px;">
		<a class="btn btn-success btn-sm" href="javascript:void(0)" id="addArticleBtn">
			<i class="fa fa-pencil fa-fw"></i>
			发帖
		</a>
	</div>
	<div style="position: relative;">
		<div class="container" id="mainContents" style="min-height:650px"></div>
		<!-- 查看begin -->
		<div class="container slideDiv" id="viewContents">
			<div style="font-size:20px;" id="articleTitle"></div>
			<div style="" id="articleContent"></div>
			<ul class="pager">
			  <li class="previous"><a href="javascript:void(0)" id="returnBtn">&larr; 返回</a></li>
			</ul>
		</div>
		<!-- 查看end -->
		<!-- 发帖begin -->
		<div class="container slideDiv" id="addContents">
			<div class="row">
				<div class="col-xs-12">
					<div style="font-size:17px;">帖子标题</div>
					<input type="text" class="form-control" placeholder="请输入标题" id="addArticleTitle"/>
				</div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-xs-12">
					<div style="font-size:17px;">帖子内容</div> 
					<div class="row">
						<div class="col-xs-12">
							<div style="background-color: #f2f2f2;border-radius:4px 4px 0 0;border:1px solid #CCCCCC;border-bottom:0px;">
								<a href="javascript:void(0)" name="code"><span class="badge zzl_codeBtn">html</span></a>
							</div>
						</div>
					</div>
					<textarea class="form-control" id="addArticleContent" placeholder="请输入内容" style="border-radius:0px 0px 4px 4px;height: 250px;"></textarea>
				</div>
			</div>
			<ul class="pager">
			  <li class="previous"><a href="javascript:void(0)" id="addReturnBtn">&larr; 返回</a></li>
			  <li class="next">
			  	<a class="btn btn-success btn-sm" href="javascript:void(0)" id="addArticleBtnSave" style="background-color: green;">
					<i class="fa fa-arrow-circle-up"></i>
					发布
				</a>
			  </li>
			</ul>
		</div>
		<!-- 发帖end -->
	</div>
	
	<div class="zzl_loadingUI" id="loadingDiv">
		<img alt="" src="images/loading.gif">
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