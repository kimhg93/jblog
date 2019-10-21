<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/lib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<Link rel="stylesheet" href="${path}/assets/css/jblog.css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="wrapper">
			<div id="content">				
				<div class="blog-content">
				<c:choose>
					<c:when test="${view==null}">			
						<h4>${post[0].title}</h4>
						<p>
							${post[0].contents }
						<p>						
					</c:when>								
					<c:otherwise>								
						<h4>${view.title}</h4>
						<p>
							${view.contents }
						<p>
					</c:otherwise>								
				</c:choose>		
				</div>
				<h3>${currentCategory==0 ? '모든 포스트' : categoryName}</h3>
				<ul class="blog-list">
				<c:forEach items="${post }" var="posts" varStatus="status">	
					<c:choose>
						<c:when test="${currentCategory==0 }">
							<li><a href="${path}/${blog.id }/${posts.no }">${posts.title }</a> <span>${posts.regDate }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="${path}/${blog.id }/c${currentCategory }/${posts.no }">${posts.title }</a> <span>${posts.regDate }</span></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	
				</ul>
			</div>
		</div>

		<div id="extra">
			<div class="blog-logo">
				<img src="${path}/assets/logos/${blog.logo}">
			</div>
		</div>

		<div id="navigation">
			<h2>카테고리</h2>
			<ul>
				<li><a href="${path}/${blog.id }">모든 포스트</a></li>
			<c:forEach items="${category }" var="categorys" varStatus="status">
				<li><a href="${path}/${blog.id }/c${categorys.no }">${categorys.name }</a></li>
			</c:forEach>
			</ul>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>