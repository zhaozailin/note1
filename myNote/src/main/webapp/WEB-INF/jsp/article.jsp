<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${fn:length(articles) eq 0}">
	<div class="row">
		<div class="col-xs-12">
			<p style="font-size:15px;font-family: 宋体 ;color: gray;">找不到该关键字</p>
		</div>
	</div>
</c:if>
<c:forEach items="${articles}" var="article">
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-xs-12">
			<div><a href="javascript:void(0)" class="zzl_articleTitle" name="title" aid="${article.id}">${article.title}</a></div>
			<div class="zzl_articleContent">${article.simpleContent}</div>
			<em class="text-success">author:${article.author} date:<fmt:formatDate value="${article.updateDate}"  pattern="yyyy-MM-dd HH:mm:ss"/></em>
		</div>
	</div>
</c:forEach>
<div class="row-fluid">
	<div class="span12" style="text-align:center">
		<input type="hidden" id="pageNoId" value="${pageNo}">
		<input type="hidden" id="pageSumId" value="${totalPages}">
		<ul class="pagination" id="pageUI"></ul>
	</div>
</div>

