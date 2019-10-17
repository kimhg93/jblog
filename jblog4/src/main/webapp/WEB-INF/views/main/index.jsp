<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/lib.jsp"%>
<html>
<body>
	<div class="center-content">
		<h1 class="logo">JBlog</h1>
		<ul class="menu">
		<li><a href="${path }/list">블로그 목록</a></li>
			<c:choose>
				<c:when test="${empty authUser }">
					<li><a href="${path }/user/login">로그인</a></li>
					<li><a href="${path }/user/join">회원가입</a></li>				
				</c:when>
				<c:otherwise>
					<li><a href="${path }/user/logout">로그아웃</a></li>
					<li><a href="${path }/${authUser.id}">내블로그</a></li>
				</c:otherwise>
			</c:choose>
			
		</ul>
		<form class="search-form">
			<fieldset>
				<input type="text" name="keyword" />
				<input type="submit" value="검색" />
			</fieldset>
			<fieldset>
				<input type="radio" name="which" value="blog-title"> <label>블로그 제목</label>
				<input type="radio" name="which" value="tag"> <label>태그</label>
				<input type="radio" name="which" value="blog-user"> <label>블로거</label>
			</fieldset>
		</form>
	</div>
</body>
</html>