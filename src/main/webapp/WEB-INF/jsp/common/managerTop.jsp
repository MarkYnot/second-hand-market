<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="el-header" >
		<div class="container" style="position: relative;">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/managerManagement.jsp">MainPage</a></li>
					
					<li>
						  <a class="el-current-user" href="/personal.do">${sessionScope.session_manager.name}</a>
					</li>
					<li><a  href="/ManagerServlet?method=logout">Logout</a></li>
					
			
			</ul>
		</div>
</div>
</body>
</html>
