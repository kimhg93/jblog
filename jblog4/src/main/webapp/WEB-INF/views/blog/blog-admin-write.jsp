<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/lib.jsp"%>
<!doctype html>
<html>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="${path}/${blog.id}/admin/basic">기본설정</a></li>
					<li><a href="${path}/${blog.id}/admin/category">카테고리</a></li>
					<li class="selected">글작성</li>
				</ul>
				<form action="${path }/${blog.id }/admin/write" method="post">
			      	<table class="admin-cat-write">
			      		<tr>
			      			<td class="t">제목</td>
			      			<td>
			      				<input type="text" size="60" name="title" required>
				      			<select name="categoryNo">
				      			<c:forEach items="${category }" var="categorys" varStatus="status">
				      				<option value="${categorys.no }">${categorys.name }</option>
				      			</c:forEach>
				      			</select>
				      		</td>
			      		</tr>
			      		<tr>
			      			<td class="t">내용</td>
			      			<td><textarea name="contents"></textarea></td>
			      		</tr>
			      		<tr>
			      			<td>&nbsp;</td>
			      			<td class="s"><input type="submit" value="포스트하기"></td>
			      		</tr>
			      	</table>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>