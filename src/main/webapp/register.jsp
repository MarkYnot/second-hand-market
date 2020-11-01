<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Second-Hand->Registration</title>
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/css/core.css" type="text/css" />


<style type="text/css">
	.el-register-form{
		width:600px; 
		margin-left:auto;
		margin-right:auto;
		margin-top: 20px;
	}
	.el-register-form .form-control{
		width: 220px;
		display: inline;
	}
</style>
 <script type="text/javascript">
	
</script>
</head>
<body>

	<div class="el-header" >
		<div class="container" style="position: relative;">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/index.jsp">HomePage</a></li>
				<li><a href="/login.jsp">Login</a></li>
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
		<form id="registerForm" class="form-horizontal el-register-form"  action="/UserServlet" method="post" >
	    <input type="hidden" name="method" value="register"/>  
		<p class="h2" style="margin: 10px 100px 20px;color:#000;">Create Account</p>
			<div class="form-group">
				<label class="control-label col-sm-2">Email</label>
				<div class="col-sm-10">
					<input type="text" autocomplete="off" name="email" class="form-control" id="email" value="${user.email}"/> 
					<p style="color: red; font-weight: 900">${msg}</p> 
				 	<p class="help-block">Enter your Email Address</p>
				<span style="color: red; font-weight: 900">${errors.email }</span><br/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Password</label>
				<div class="col-sm-10">
					<input type="password" autocomplete="off" name="password" id="password" class="form-control" value="${user.password}"/>
					 <p class="help-block">you can use 6~16 letters & numbers</p> 
					<span style="color: red; font-weight: 900">${errors.password }</span><br/>
				</div> 
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Repeat Password</label>
				<div class="col-sm-10">
					<input type="password" autocomplete="off" name="confirmPwd" class="form-control" value="${confirmPwd}" />
					<p class="help-block">Please fill in your password again</p>
					<span style="color: red; font-weight: 900">${errors.repeatPwd }</span><br/>	
					
				</div>
			</div> 
			<div class="form-gorup">   
				<div class="col-sm-offset-2">  
				&emsp;&emsp;&emsp;&emsp;&emsp;
					<button type="submit" class="btn btn-success">
						Sign up
					</button>
					&emsp;&emsp;&emsp;&emsp;
					Already have an account? <a href="/login.jsp" class="text-primary">Sign-in</a>
					<p style="padding-left: 0px;margin-top: 15px;">
						By creating an account, you agree to our <br> <a href="#">Conditions of Use </a> and <a href="#"> Pricacy Notice</a>.
					</p>
				</div>
			</div>
		</form>
	</div>

	<div class="container-foot-2">
		<div class="context">
			<div class="left">
				<p> Online Second-Hand trading market</p>
				<p> Develop&emsp;&emsp;&emsp;by:&emsp;ASD Group one</p>
				<p> Contact Address:&emsp;University of Technology, Sydney</p>
				<p> Contact Number:&emsp;0424666666</p>
				<p> Email Address &emsp;:&emsp;GroupOne@Student.uts.edu.au</p>
			</div>
			<div class="right">
			<br><br><br><br><br><br>
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