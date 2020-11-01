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
<script type="text/javascript"
	src="/js/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript"
	src="/js/plugins/jquery.twbsPagination.min.js"></script>

<script type="text/javascript">

 
	</script>

<%@ include file="WEB-INF/jsp/common/managerTop.jsp"%>
<%@ include file="WEB-INF/jsp/common/managerHead.jsp"%>

</head>
<body>

	<div class="col-sm-3">
		<%@ include file="WEB-INF/jsp/common/managerMenu.jsp"%>
	</div>
	
	<div class="col-sm-9">
		<div class="page-header">
			<h3>All Users</h3>
		</div>
					
			<div class="panel panel-default">
			<table class="table">
				<thead>
					<tr>
						<th>Email</th>
					    <th>password</th>	
						<th>Active Status</th>
						
					</tr>
				</thead>

				<tbody>
					  
						<tr>
						<c:forEach var="user" items="${userList}">
							
							<td>${user.email}</td>
							<td>${user.password}</td> 
							<td>${user.activeStatus}</td>
							
						<%-- 	${session_user.saleApplyStatus} --%>
						</tr>
                    </c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul id="pagination" class="pagination"></ul>
			</div>
		</div>
	</div>
	

	
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>
