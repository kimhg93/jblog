<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/lib.jsp"%>
<html>
<body>
	<div id="container">
		<div id="header">
			<h1>인기 있는 블로그</h1>		
			<ul>
			<c:choose>
				<c:when test="${empty authUser }">
					<li><a href="${path }/user/login">로그인</a></li>	
					<li><a href="${path }/">메인</a></li>			
				</c:when>
				<c:otherwise>
					<li><a href="${path }/user/logout">로그아웃</a></li>					
					<li><a href="${path }/${authUser.id}">내 블로그</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>		
		<div id="wrapper">
			<div id="blog_list">	
				<c:forEach items="${vo }" var="blog" varStatus="status">
				<div id="blog_panel">					
					<div id="blog_title">
						<p>${blog.title }</p>
						<span><strong>HIT</strong> ${blog.hit }</span>
					</div>
					<a href="${path }/${blog.id}"><img id="blog_img" src="${path }/assets/logos/${blog.logo}"></a>		
							
				</div>
				</c:forEach>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>			