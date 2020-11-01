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
			<li id="index" ><a href="/managerManagement.jsp">MainPage</a></li>
			<li id="Monitoring"><a href="/UserServlet?method=findAll ">Monitoring</a></li>
			<li id="Categories"><a href="<c:url value ='/CategoryServlet?method=findAll'/>">Categories</a></li>
			<li id="personal"><a href="/personalInfo.jsp">Personal Information</a></li>
			
		</ul>
	</div>
</div>

<script type="text/javascript">
	$("#"+"${currentNav}").addClass("active");
</script>
