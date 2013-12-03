//文章对象
var article = {};

//页面加载后执行
$(document).ready(function(){
	article.queryList();
});

article.queryList = function() {
	var json = {pageNo:0, limit:10};
	$.get("articles/queryList", json, function() {
		
	}, "html");
};