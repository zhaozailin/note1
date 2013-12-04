//文章对象
var article = {};

//页面加载后执行
$(document).ready(function(){
	article.queryList();
	//绑定查询事件
	$("#queryIconBtn").click(function(){
		article.queryList();
	});
});

//分页查询
article.queryList = function() {
	$("#loadingUI").show();
	var json = {pageNo:0, limit:10, keyword:$("#queryKeyword").val().trim()};
	$.get("articles/queryList", json, function(resultHtml) {
		$("#loadingUI").hide();
		$("#mainContents").html(resultHtml);
		//
	}, "html");
};