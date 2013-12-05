//文章对象
var article = {};

//页面加载后执行
$(document).ready(function(){
	commonJSObj.pageOnload("articles/queryList");
	article.queryList();
	//绑定查询事件
	$("#queryIconBtn").click(function(){
		article.queryList();
	});
	//绑定发帖事件
	$("#addArticleBtn").click(function(){
		article.slideUp("add");
	});
	//绑定查看返回事件
	$("#returnBtn").click(function(){
		article.slideDown("view");
	});
	//绑定发帖返回事件
	$("#addReturnBtn").click(function(){
		article.slideDown("add");
	});
	//绑定发帖保存事件
	$("#addArticleBtnSave").click(function(){
		article.save();
	});
});

//分页查询
article.queryList = function() {
	$("#loadingUI").show();
	commonJSObj.ori_queryOrgs.keyword = $("#queryKeyword").val().trim();
	commonJSObj.ori_queryOrgs.pageNo = 0;
	$.get(commonJSObj.url, commonJSObj.ori_queryOrgs, function(resultHtml) {
		$("#loadingUI").hide();
		$("#mainContents").html(resultHtml);
		//输出分页
		commonJSObj.outputPageBtn(commonJSObj.url);
		//绑定点击标题事件
		$("a[name=title]").click(function(){
			article.view($(this).attr("aid"));
		});
	}, "html");
};

//查看
article.view = function(id) {
	$.get("articles/view", {id:id}, function(result){
		if(result.status == 1) {
			$("#articleTitle").html(result.article.title);
			$("#articleContent").html(result.article.content);
			article.slideUp("view");
		}
	}, "json");
};

//保存帖子
article.save = function() {
	var json = {};
	var title = $("#addArticleTitle").val();
	var content = $("#addArticleContent").val();
	var valid = true;
	if(title == "") {
		$("#addArticleTitle").parent().addClass("has-error");
		valid = false;
	} else {
		$("#addArticleTitle").parent().removeClass("has-error");
	}
	if(content == "") {
		$("#addArticleContent").parent().addClass("has-error");
		valid = false;
	} else {
		$("#addArticleContent").parent().removeClass("has-error");
	}
	if(!valid) {
		return;
	}
	json.title = title;
	json.content = content;
	$("#loadingDiv").show();
	$.post("articles/save", json, function(result){
		$("#loadingDiv").hide();
		if(result.status == 1) {
			article.slideDown("add");
			//刷新
			article.queryList();
		}
	}, "json");
};

//下滑隐藏
article.slideDown = function(type) {
	var id = "viewContents";
	if(type == "add") {
		id = "addContents";
	}
	$("#" + id).animate({
		height:"1px",
		top:"650px"
	}, function(){
		$("#" + id).hide();
		$("#mainContents").show();
	});
};

//上滑显示
article.slideUp = function(type) {
	var id = "viewContents";
	if(type == "add") {
		id = "addContents";
	}
	$("#" + id).show();
	$("#mainContents").hide();
	$("#" + id).animate({
		height:"650px",
		top:"0px"
	});
};