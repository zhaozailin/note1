//文章对象
var article = {};

//页面加载后执行
$(document).ready(function(){
	article.queryList();
	commonJSObj.pageOnload("articles/queryList");
	//绑定查询事件
	$("#queryIconBtn").click(function(){
		article.queryList();
	});
});

//分页查询
article.queryList = function() {
	$("#loadingUI").show();
	commonJSObj.ori_queryOrgs.keyword = $("#queryKeyword").val().trim();
	$.get(url, commonJSObj.ori_queryOrgs, function(resultHtml) {
		$("#loadingUI").hide();
		$("#mainContents").html(resultHtml);
		//输出分页
		commonJSObj.outputPageBtn(commonJSObj.url);
		//页面加载后初始化原始查询条件，为了清空翻页查询时的条件
//		commonJSObj.ori_queryOrgs = {pageNo:0, limit:10};
	}, "html");
};