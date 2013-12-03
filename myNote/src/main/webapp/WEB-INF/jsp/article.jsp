<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach items="${articles}" var="article">
	<div class="row">
		<div class="col-xs-12">
			<h2>${article.title}</h2>
			<p>${article.title}</p>
		</div>
	</div>
</c:forEach>
<div class="row-fluid">
	<div class="span12">
		<input type="hidden" id="pageNoId" value="${pageNo}">
		<input type="hidden" id="pageSumId" value="${totalPages}">
		<div class="pagination pagination-centered">
			<ul id="pageUI"></ul>
		</div>
	</div>
</div>

