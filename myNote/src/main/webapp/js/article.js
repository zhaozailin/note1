//文章对象
var article = {};

//页面加载后执行
$(document).ready(function(){
	article.queryList();
});

article.queryList = function() {
	$.get("articles/")
};