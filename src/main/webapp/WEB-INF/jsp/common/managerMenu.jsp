<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
	
<ul id="menu" class="list-group">
	<li class="list-group-item">
		<a href="javascript:;"><span>Personal Information</span></a>
		<ul>
			<li name="ld"><a href="personalInfo.jsp"><span>Login detail</span></a></li>
		</ul>
	</li>
	<li class="list-group-item">
		<a href="#"><span class="text-title">Monitoring</span></a>
		<ul class="in">
			<li name="allProducts"><a href="/managerProject.jsp">View all products</a></li>
			<li name="buyer"><a href="/UserServlet?method=findAll">View all User</a></li>
			<li name="auditSaleApplyPage"><a href="/ProductServlet?method=auditSaleApplyPage">audit Sale Application</a></li>
			
		</ul>
	</li>
	<li class="list-group-item">
		<a href="#"><span>Categories</span></a>
		<ul class="in">
			<li name="viewCategories"><a href="<c:url value ='/CategoryServlet?method=findAll'/>">view all categories</a></li>
			<li name="AddCatogory"><a href="/addCategory.jsp">Add category</a></li>
			<li name="productOfCategory"><a href="/managerProject.jsp">view Products by Categories</a></li>
			
		</ul>
	</li>
</ul>


