<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div class="navbar navbar-default el-navbar">
	<div class="container">
		<div class="navbar-header">
			<a href="/">
				<img alt="Brand" src="/images/icon.png">
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li id="ShoppingPage" ><a href="/ProductServlet?method=allProductListPage">ShoppingPage</a></li>
			<li id="invest"><a href="/">Purchase Order</a></li>
			<li id="borrow"><a href="/">Sale Order</a></li>
			<li><a href="#">About Us</a></li>
		</ul>
	</div>
</div>

