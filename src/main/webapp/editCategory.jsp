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
       /*  document.getElementById("value").value="${category.description}" */
       $(function() {
    	   $("#editForm").ajaxForm(
   				function() {
   					$.messager.confirm("Congradulation",
   							"you have edit this category successfully",
   							function() {
   								window.location.reload();
   								document.getElementById("editForm")
   								.reset();
   								
   							});
   				});
   	}); 
    	   
       
       
	</script>
	
	<style>
#box_relative {
  position: relative;
  left: 30px;
 
}
	
	</style>

<%@ include file="WEB-INF/jsp/common/managerTop.jsp"%>
<%@ include file="WEB-INF/jsp/common/managerHead.jsp"%>

</head>
<body>

	<div class="col-sm-3">
		<%@ include file="WEB-INF/jsp/common/managerMenu.jsp"%>
	</div>
	
	<div class="col-sm-9">
		<div class="page-header">
			<h3>Edit Categories</h3>
		</div>
	<!-- <div class="panel panel-default"> -->
			
		<!-- id = "editForm"	 -->
    <p style="font-weight: 900; color: red">${msg }</p>
    <form id="editForm" action="<c:url value='/CategoryServlet'/>" method="post">
   <input type="hidden" name="method" value="edit"/>
  <input type="hidden" name="oid" value="${category.oid}"/>  
    <br/>
    	<div><label for="categoriesName">
    	 
    	CategoryName：</label></div>
    	<input type="text" name="categoriesName" value="${category.categoriesName}"/>
    	<br/>
    	<div><label for="description">Description:</label></div>
    	<textarea name="description" cols="40" rows="10" >${category.description}</textarea>
    	  <!-- <input type="text" style="width:300px; height:100px; line-height:100px; maxlength:30;" name="description"/> -->
    		<!-- id="value" -->
    	   <br/>
    	   <br/>	
    	<div class= "#box_relative">
    	<input onclick="return confirm('You sure want to edit this category?')"type="submit" value="edit" style="width:50px; height:30px;"/>
    	<input type="reset" value="reset"style="width:50px; height:30px;"/>
<!--     	onclick="return confirm('You sure want to edit this category?')" -->
    	
          </div>
    
	 	</form>
			
			<div style="text-align: center;">
				<ul id="pagination" class="pagination"></ul>
			</div>
			
		</div>

</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>