<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	function t() {
		var json = {title:"t", content:"xxxx", tt:"2012-12-12 1:1:1"};
		$.get("articals/test", json, function(result){
			
		}, "json");
	}
</script>
</head>
<body>
	<button class="btn" onclick="t()">test</button>
	<div class="container" style="margin-top:10px">
		<div class="row">
			<div class="col-xs-12">
				<h4>zailinZhao's note online v1.0</h4>
			</div>
		</div>
		<div class="row" id="queryBtnField">
			<div class="col-xs-12">
				<div class="input-group">
					<input type="text" class="form-control">
					<span class="input-group-btn">
						<button class="btn btn-success" type="button" id="queryBtn">Go</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-xs-12">
				
			</div>
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
</body>
</html>