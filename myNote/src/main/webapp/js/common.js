/**
 * 全局方法对象 
 */
var commonJSObj = {
	//当前菜单url
	url:null,
	//原始查询条件
	ori_queryOrgs:{},
	//状态码
	status:{
		//成功
		global_result_success:1,
		//失败
		global_result_fail:-2
	},
	//提示信息
	globalPromptInfo:"<div id='promptInfoDiv' class='alert alert-info'><button type='button' class='close' data-dismiss='alert'>×</button><span>"
};



/**
 * 显示分页组件
 * @param pageNo 页码
 * @param pageSum 总页数
 */
commonJSObj.showPageUI = function(pageNo, pageSum, href)
{
	var pageFlag = false;
	if(pageNo == undefined)
	{
		pageNo = 1;
	}
	//begin
	//开始显示的页码为：当前选择的页码减去余数 + 1
	if(pageNo % 10 == 0) {
		pageNo--;
		pageFlag = true;
	}
	var startPageNo =  parseInt(pageNo / 10) * 10 + 1;
	
	var showPageSum = 10;
	if(pageSum < startPageNo + 10 - 1) {
		showPageSum = pageSum - startPageNo + 1;
	}
	//end
	var pageString = "";
	if(pageNo == 1)
	{
		pageString += "<li class='disabled previous'><span class='fui-arrow-left'></span></li>";
	}
	else
	{
		pageString += "<li class='previous'><a href='javascript:void(0)' onclick='commonJSObj.switchPage(2, null, \"" + href + "\")' class='fui-arrow-left'></a></li>";
	}
	//若没有记录则显示0页
	if(showPageSum <= 0)
	{
		pageString += "<li class='active'><span>0</span></li>";
	}
	else
	{
		if(pageFlag) {
			pageNo++;
		}
		for(var i=0; i<showPageSum; i++)
		{
			if(pageNo == startPageNo)
			{
				pageString += "<li class='active'><span>" + startPageNo + "</span></li>";
			}
			else
			{
				pageString += "<li><a href='javascript:void(0)' onclick='commonJSObj.switchPage(3, this, \"" + href + "\")'>" + startPageNo + "</a></li>";
			}
			startPageNo++;
		}
	}
	if(pageNo == pageSum || pageSum <= 0)
	{
		pageString += "<li class='disabled next'><span class='fui-arrow-right'></span></li>";
	}
	else
	{
		pageString += "<li class='next'><a href='javascript:void(0)' onclick='commonJSObj.switchPage(1, null, \"" + href + "\")' class='fui-arrow-right'></a></li>";
	}
	$("#pageUI").html(pageString);
};

/**
 * 上一页、下一页
 * @param type 类型 1：上一页，2：下一页，3：点击的页码，4：刷新当前页
 * @param obj 标签对象
 * @param href 链接
 * @param listId 列表id
 */
commonJSObj.switchPage = function(type, obj, href)
{
	$("#bg").show();
	var pageNo = $("#pageNoId").val();
	if(pageNo == "" || pageNo == 0)
	{
		pageNo = 1;
	}
	if(type == 1)
	{
		//下一页
		pageNo++;
	}
	else if(type == 2)
	{
		//上一页
		pageNo--;
	}
	else if(type == 3)
	{
		pageNo = $(obj).html();
	}
	commonJSObj.ori_queryOrgs.page = pageNo - 1;
	//ajax获取下一页内容
	$.get(href, commonJSObj.ori_queryOrgs, function(data){
		$("#ajaxQueryList").html(data);
		//输出分页
		commonJSObj.outputPageBtn(href);
		showListIndexNo();
		//绑定相关事件
		commonJSObj.afterAjaxBandEvent(href);
		$("#bg").hide();
	}, "html");
};

//ajax分页查询后绑定相关事件
commonJSObj.afterAjaxBandEvent = function(href) {
	switch (href) {
	case "supplier/query":
		bandEditKeyboard();
		break;
	case "customer/query":
		customer.bandEditKeyboard();
		break;
	default:
		break;
	}
};

/**
 * 输出分页
 */
commonJSObj.outputPageBtn = function(url)
{
	var pageNo = $("#pageNoId").val();
	if(pageNo == "")
	{
		pageNo = 0;
	}
	var pageSum = parseInt($("#pageSumId").val());
	pageNo++;
	$("#pageNoId").val(pageNo);
	commonJSObj.showPageUI(pageNo, pageSum, commonJSObj.url);
};

/**
 * bootstrap弹出框
 * @param content 弹出框内容
 * @param type 1：成功，0：失败
 */
commonJSObj.bsAlert = function(content, type)
{
	$("#alertContent").html(content);
	$("#resultFlag").removeClass();
	$("#resultFlag").html("");
	if(type == 1)
	{
		$("#resultFlag").addClass("fui-check");
		$("#resultFlag").css("color","green");
	}
	else if(type == 2)
	{
		$("#resultFlag").addClass("fui-cross");
		$("#resultFlag").css("color","red");
	}
	else if(type == 3)
	{
		$("#resultFlag").html("<i class='icon-exclamation'></i>");
		$("#resultFlag").css("color","#FF8000");
	}
	if(content == timeout_prompt)
	{
		$("#common_alert_btn").html("确定");
		$("#common_alert_btn").click(function(){
			location = "login";
		});
	}
	$('#alertDiv').modal('show');
	//聚焦，按enter后消失
	$("#common_alert_btn").focus();
};

/**
 * 公用onload
 * @param href
 */
commonJSObj.pageOnload = function(href)
{
	commonJSObj.url = href;
	//输出分页
	commonJSObj.outputPageBtn(commonJSObj.url);
	//页面加载后初始化原始查询条件，为了清空翻页查询时的条件
	commonJSObj.ori_queryOrgs = {ajax:1, limit:10};
	//输出序号
//	showListIndexNo();
	//给搜索按钮注册键盘监听
	$("#queryFieldset").keypress(function(event){
		if (event.keyCode == 13) {
			$("#queryIconBtn").click();
			return false;
		}
	});
};

/**
 * 公用分页查询
 */
commonJSObj.queryByPage = function()
{
	$("#bg").show();
	//每次点击查询按钮，都清掉页码，独立的查询方法只需关心其特有的查询条件，无需考虑页码
	commonJSObj.ori_queryOrgs.page = 0;
	//解决ajax缓存
	var noCacheUrl = commonJSObj.url + ((commonJSObj.url.indexOf("?") == -1) ? "?" : "&") + "random=" + new Date();
	$.ajax({
		type : "GET",
		url : noCacheUrl,
		data : commonJSObj.ori_queryOrgs,
		dataType : "html",
		async : false,
		success : function(data)
		{
			$("#ajaxQueryList").html(data);
			//输出分页
			commonJSObj.outputPageBtn(commonJSObj.url);
			//输出序号
			showListIndexNo();
			$("#bg").hide();
		}
	});
};

commonJSObj.myTrim = function(str)
{
	return str.replace(/(^\s*)|(\s*$)/g, "");
};
