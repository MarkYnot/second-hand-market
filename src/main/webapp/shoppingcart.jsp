<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Second-Hand Trading Market</title>

<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="/css/core.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/account.css" />
<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript"
	src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>

<%@ include file="WEB-INF/jsp/common/top.jsp"%>
<%@ include file="WEB-INF/jsp/common/head.jsp"%>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<%@ include file="WEB-INF/jsp/common/leftMenu.jsp"%>
			</div>
			<c:choose>
			<c:when test="${empty session_user }">
				<h1>
					
					Please login first</h1>
			</c:when>
			<c:otherwise>
				<h1>
					Hello ${session_user.email}</h1>
			</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>