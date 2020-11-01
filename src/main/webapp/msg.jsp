<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><--Second-Hand--></title>
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/css/core.css" type="text/css" />

<style type="text/css">
	.el-login-form{
		width:600px; 
		margin-left:auto;
		margin-right:auto;
		margin-top: 20px;
	}
	.el-login-form .form-control{
		width: 220px;
		display: inline;
	}
	
	.abc a{padding:10px 20px;border:1px solid #000} 
</style>

<script type="text/javascript">
	
</script>

</head>
<body>

	<div class="el-header" >
		<div class="container" style="position: relative;">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/index.jsp">HomePage</a></li>
				<li><a href="/register.jsp">Sign-up</a></li>
				<li><a href="/login.jsp">Sign-in</a></li>
			</ul>
		</div>
	</div>
	

	<div class="navbar navbar-default el-navbar">
		<div class="container">
			<div class="navbar-header">
				<a href=""><img alt="Brand" src="/images/icon.png"></a>
				<span class="el-page-title"></span>
			</div>
		</div>
	</div>
	
	<div class="container">  
	<div class="form-horizontal el-login-form" >
	<p class="h2" style="margin: 10px 10px 20px 110px;color:#000;">&emsp;${msg }</p> 
	<br>
	  <div class="abc">
	   Enter to :
	  <a href="<c:url value='/index.jsp'/>">HomePage</a>
	  </div>
	  <br>  <br>
	  <div class="abc">
	   Enter to :
	  <a href="<c:url value='/login.jsp'/>">Sign-in</a>
	  </div>
	  <br>  <br>
	  <div class="abc">
	  Enter to :
	  <a href="<c:url value='/register.jsp'/>">Sign-up</a>
	  </div>
	  <br><br><br>
	  
	<br>
	</div>
	</div>	

	<div class="container-foot-2">
		<div class="context">
				<div class="left">
				<p> Online Second-Hand trading market</p>
				<p> Develop&emsp;&emsp;&emsp;by：&emsp;ASD Group one</p>
				<p> Contact Address：&emsp;University of Technology, Sydney</p>
				<p> Contact Number：&emsp;0424666666</p>
				<p> Email Address &emsp;：&emsp;GroupOne@Student.uts.edu.au</p>
			</div>
			<div class="right">
			<br><br><br><br><br>
				<a target="_blank" href="https://www.facebook.com/"><img
					src="/images/facebook.png"></a>
				<a target="_blank" href="https://www.twitter.com/"><img
					src="/images/twitter.png"></a>
				<a target="_blank" href="https://www.youtube.com/"><img
					src="/images/youtube.png"></a>
				<a target="_blank" href="https://www.github.com/"><img
					src="/images/github.png"></a>
			</div>
		</div>
	</div>
</body>
</html>