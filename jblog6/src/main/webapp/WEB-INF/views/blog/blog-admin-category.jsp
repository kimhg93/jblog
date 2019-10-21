<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/lib.jsp"%>
<!doctype html>
<html>
<head>
<style>
	table{
		font-size:1em;
	}
</style>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="${path}/${blog.id}/admin/basic">기본설정</a></li>
					<li class="selected">카테고리</li>
					<li><a href="${path}/${blog.id}/admin/write">글작성</a></li>
				</ul>
		      	<table class="admin-cat" id="category_list">
		      		<tr>
		      			<th>번호</th>
		      			<th>카테고리명</th>
		      			<th>포스트 수</th>
		      			<th>설명</th>
		      			<th>삭제</th>      			
		      		</tr>
		      		<c:forEach items="${category }" var="categorys" varStatus="status">
					<tr id="category_${categorys.no }">
						<td>${status.index+1 }</td>
						<td>${categorys.name }</td>
						<td>${categorys.postCount }</td>
						<td>${categorys.comment }</td>
						<td>
						<form id="del_${categorys.no }">
							<input type="image" src="${path }/assets/images/delete.jpg" onclick="removeCategory(this.form);return false;">							
							<input type="hidden" id="del_url" value="${path }/${id }/admin/deleteCategory">
							<input type="hidden" id="category_no" name="no" value="${categorys.no }">
						</form>	
						</td>
					</tr>  
					</c:forEach>				  
				</table>
      			<script>
				$("#btn_del").click(function() {
					alert($("#category_no").val());
				});
				</script>
      			<h4 class="n-c">새로운 카테고리 추가</h4>
      			<form name="add" id="add_category">
		      	<table id="admin-cat-add">
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" name="name" id="add_name"></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" name="comment" id="add_comment"></td>
		      		</tr>
		      		<tr>
		      			<td class="s">&nbsp;</td>
		      			<td>
		      				<input id="btn_add" type="button" value="카테고리 추가" onclick="addCategory()">
		      				<input type="hidden" id="add_url" value="${path }/${id }/admin/category">
		      				<input type="hidden" id="path" value="${path }">
		      			</td>
		      		</tr>      		      		
		      	</table> 
		      	</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>