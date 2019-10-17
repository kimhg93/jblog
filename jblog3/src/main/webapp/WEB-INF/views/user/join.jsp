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
				<li><a href="${path }/user/login">회원가입</a></li>		
			</c:when>
			<c:otherwise>
				<li><a href="${path }/user/login">로그아웃</a></li>
				<li><a href="${path }/user/login">내블로그</a></li>
			</c:otherwise>
		</c:choose>		
		</ul>
		<form class="join-form" id="join-form" method="post" action="">
			<label class="block-label" for="name">이름</label>
			<input id="name"name="name" type="text" value="">
			
			<label class="block-label" for="blog-id">아이디</label>
			<input id="blog-id" name="id" type="text" onchange="hideResult();" required> 
			<input id="btn-checkemail" type="button" value="id 중복체크" onclick="checkId()" required>
			<p id="fail" style="color:red;display:none">이미 사용중인 아이디 입니다.</p>
			<p id="success" style="color:green;display:none">사용 가능합니다</p>
			<img id="img-checkemail" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">

			<label class="block-label" for="password">패스워드</label>
			<input id="password" name="password" type="password" required/>

		<!-- 	<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset> -->

			<input type="submit" value="가입하기">

		</form>
		<input type="hidden" value="${path }/user/checkid" id="check_path">
	</div>
</body>
</html>
