<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="el-header">
		<div class="container" style="position: relative;">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty sessionScope.session_user }">
						<li><a href="/login.jsp">Login</a></li>
						<li><a href="/register.jsp">Register</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="el-current-user" href="/personal.do">${sessionScope.session_user.email}</a>
						</li>
						<li><a href="/cartList.jsp">ShoppingCart</a></li>
						<li><a href="/home.jsp">PersonalManage</a></li>
						<li><a href="/UserServlet?method=logout">Logout</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="#">Help</a></li>
				<li><a href="#">Balance: $ ${session_user.getBalance()}</a></li>
				<li>
				<form action="/UserServlet" method="get">
					<input type = "hidden" name="method" value="topupBalance">
					<input type="text" name="balance" placeholder="enter balance">
					<input type="submit" name="submit" value="Top Up">
				</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>

