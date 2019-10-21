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
				<li><a href="${path }/user/${authUser.id}">내블로그</a></li>
			</c:otherwise>
		</c:choose>			
		</ul>
		<form class="login-form" method="post" action="${path }/user/auth">
      		<label>아이디</label><input type="text" name="id" required>
      		<label>패스워드</label><input type="password" name="password" required>
      		<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>
