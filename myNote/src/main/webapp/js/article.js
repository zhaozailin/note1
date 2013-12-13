//文章对象
var article = {};

//页面加载后执行
$(document).ready(function() {
	
	dp.SyntaxHighlighter.ClipboardSwf = 'styles/plugin/dp.SyntaxHighlighter/Scripts/clipboard.swf';
	
	commonJSObj.pageOnload("articles/queryList");
	article.queryList();
	//绑定查询事件
	$("#queryIconBtn").click(function() {
		article.queryList();
	});
	//绑定发帖事件
	$("#addArticleBtn").click(function() {
		article.slideUp("add");
	});
	//绑定查看返回事件
	$("#returnBtn").click(function() {
		article.slideDown("view");
	});
	//绑定发帖返回事件
	$("#addReturnBtn").click(function() {
		article.slideDown("add");
	});
	//绑定发帖保存事件
	$("#addArticleBtnSave").click(function() {
		article.save();
	});
	//绑定添加代码样式事件
	$("a[name=code]").click(function() {
		var type = $(this).children("span").html();
		article.addCodeCss(type);
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
			dp.SyntaxHighlighter.HighlightAll('code'); 
			article.slideUp("view");
		}
	}, "json");
};

//保存帖子
article.save = function() {
	var json = {};
	var title = $("#addArticleTitle").val().trim();
	var content = $("#addArticleContent").html().trim();
	content = content.replace("<small style=\"color:#999999;\">html-begin</small>&nbsp;<div style=\"min-height:20px\" name=\"htmlCode\" contenteditable=\"true\">", "<pre name=\"code\" class=\"html\">");
	content = content.replace("</div><small style=\"color:#999999;\">html-end</small>&nbsp;", "</pre>");
	var simpleContent = "";
	var nodes = document.getElementById("addArticleContent").childNodes;
	for(var i=0; i<nodes.length; i++) {
		if(nodes[i].nodeType == 3) {
			simpleContent += nodes[i].nodeValue;
		}
	}
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
	json.simpleContent = simpleContent;
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

//添加代码
article.addCodeCss = function(type) {
	//在光标处插入字符串
    // myField    文本框对象
    // myValue 要插入的值
    function insertAtCursor(myField, myValue)
    {
        //IE support
        if (document.selection)
        {
            myField.focus();
            sel            = document.selection.createRange();
            sel.text    = myValue;
            sel.select();
        }
        //MOZILLA/NETSCAPE support
        else if (myField.selectionStart || myField.selectionStart == '0')
        {
            var startPos    = myField.selectionStart;
            var endPos = myField.selectionEnd;
            // save scrollTop before insert
            var restoreTop    = myField.scrollTop;
            myField.value    = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
            if (restoreTop > 0)
            {
                // restore previous scrollTop
                myField.scrollTop = restoreTop;
            }
            myField.focus();
            myField.selectionStart    = startPos + myValue.length;
            myField.selectionEnd    = startPos + myValue.length;
        } else {
            myField.value += myValue;
            myField.focus();
        }
    }

	
	
	
	//ie
	var obj = $("#addArticleContent");
	var str = "[" + type + "][/" + type + "]";
	if (document.selection) {
	   obj.focus();
	   var sel = document.selection.createRange();
	   sel.text = str;
	} else if (typeof obj.selectionStart === 'number' && typeof obj.selectionEnd === 'number') {
	   var startPos = obj.selectionStart;
	   var endPos = obj.selectionEnd;
	   var tmpStr = obj.value;
	   obj.value = tmpStr.substring(0, startPos) + str + tmpStr.substring(endPos, tmpStr.length);
	} else {
	   obj.value += str;
	}
};