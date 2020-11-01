<%@page import="cn.second_hand.product.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<style>
a {
	color: white;
	background: #1E63B0; //
	默认的颜色 border-radius: 5px;
}

a:active {
	color: black;
	border-radius: 5px;
	background: #4a9bfa;
	黑色 opacity: 0.5;
	//
	这里重要，就是通过这个透明度来设置
}

h6 {
	margin: 0;
	padding: 0;
	margin-top: 6px;
}
</style>
</head>
<body>
	<%
		Product date = (Product) request.getAttribute("product");
	%>
	<div style="width: 1300px; margin: 0 auto">
		<div style="width: 850px; margin: 0 auto;background-color: burlywood">
			<a href="index.jsp" style="margin-left: 200px">home</a>
		</div>
		<div
			style="width: 850px; height: 400px; border: 1px solid #000; margin: 0 auto; background-color: burlywood">
			<div
				style="width: 300px; height: 300px; margin-left: 200px; margin-top: 45px; float: left">
				<img alt="laptop" src="img/laptop.jpg" width="100%" height="100%" border="4">
			</div>
			<div style="float: left">
				<div style="margin-left: 25px; width: 300px; margin-top: 45px;">
					<h3><%=date.getTitle()%></h3>
				</div>
				<div style="margin-left: 25px; width: 300px">
					<h6>
						Ex Tax : $<%=date.getPrice()%></h6>
					<h6>
						Price in ward points :
						<%=date.getPrice()%></h6>
					<h6>
						Brand :
						<%=date.getTitle()%></h6>
					<h6>
						Description :
						<%=date.getDescription()%></h6>
					
					<h6>
						Bargain Status :
						<%=date.isBargainStatus()%></h6>
					<h6>
						remark :
						<%=date.getRemark()%></h6>
					<h6>
						Category :
						<%=date.getCategory()%></h6>
				</div>
			</div>
		</div>
	</div>
</body>
</html>