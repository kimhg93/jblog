<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/jstl.jsp"%>
		<div id="header">
			<a href="${path}/${blog.id }"><h1>${blog.title }</h1></a>				
			<ul>
			<li><a href="${path }/list">블로그 목록</a></li>
			<c:choose>
				<c:when test="${empty authUser }">
					<li><a href="${path }/user/login">로그인</a></li>				
				</c:when>
				<c:otherwise>
					<li><a href="${path }/user/logout">로그아웃</a></li>
					<c:choose>
						<c:when test="${authUser.id==blog.id }">
						<li><a href="${path }/${blog.id}/admin/basic">블로그 관리</a></li>	
						</c:when>	
						<c:otherwise>
						<li><a href="${path }/${authUser.id}">내 블로그</a></li>
						</c:otherwise>			
					</c:choose>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>