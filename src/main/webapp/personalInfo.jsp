<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Second-Hand Trading Market</title>

<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/css/core.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/account.css" />
<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>


<%@ include file="WEB-INF/jsp/common/managerTop.jsp"%>
<%@ include file="WEB-INF/jsp/common/managerHead.jsp"%>

</head>
<body>



     <div class="container">
		<div class="row">
			<div class="column3">
 
				
				<div class="col-sm-3">
					<%@ include file="WEB-INF/jsp/common/managerMenu.jsp"%>
				</div>
				
				
				<div class="col-sm-9">
				<div class="panel panel-default">
				<div class="panel-heading">Personal Information</div>
					
					
				
						
						
<form class="form-horizontal" id="realAuthForm" method="post" action="/ProductServlet?method=saleApplication" novalidate="novalidate">
	 <fieldset>		
	 
	 <div >				
	<h1>This is your information</h1>					
	<div >						
	   <label>Name: ${session_manager.name}</label>
       <div>
      <label> Email: ${session_manager.email} </label>
       
       <div>
       
        
      
       
</fieldset>

</form>
	
	</div>
	</div>
	</div>
	</div>
	</div>

	
	
	
			

			
				
	
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>