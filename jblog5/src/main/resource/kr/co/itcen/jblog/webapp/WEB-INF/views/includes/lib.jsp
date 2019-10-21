<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<title>JBlog</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<Link rel="stylesheet" href="${path }/assets/css/jblog.css">
<script src="${path }/assets/js/jquery/jquery-1.9.0.js" type="text/javascript"></script>
<script src="${path }/assets/js/ajax.js" type="text/javascript"></script>
</head>