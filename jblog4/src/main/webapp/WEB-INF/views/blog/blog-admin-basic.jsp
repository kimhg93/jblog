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
					<li class="selected">기본설정</li>
					<li><a href="${path}/${blog.id}/admin/category">카테고리</a></li>					
					<li><a href="${path}/${blog.id}/admin/write">글작성</a></li>
				</ul>
				<form action="" id="update_form" method="post" enctype="multipart/form-data">
	 		      	<table class="admin-config">
			      		<tr>
			      			<td class="t">블로그 제목</td>
			      			<td><input type="text" size="40" id="title" name="title" value="${blog.title }"></td>
			      		</tr>
			      		<tr>
			      			<td class="t">로고이미지</td>
			      			<td><img id="logo_img" src="${path }/assets/logos/${blog.logo }"></td>      			
			      		</tr>      		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="newlogo" id="newlogo"></td>      			
			      		</tr>           		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="button" value="기본설정 변경" onclick="updateBlog(); return false;"></td>      			
			      		</tr>           		
			      	</table>
			      	<input type="hidden" name="logo" value="${blog.logo }">
				</form>
				<input type="hidden" id="update_path" value="${path }/${blog.id }/admin/basic">
				<input type="hidden" id="path" value="${path }">
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>