<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Cart List Page</title>

    <link rel="stylesheet" href="./js/bootstrap-3.3.2-dist/css/bootstrap.css"
          type="text/css" />
    <link rel="stylesheet" href="./css/core.css" type="text/css" />
    <link type="text/css" rel="stylesheet" href="./css/account.css" />
    <script type="text/javascript" src="./js/jquery/jquery-2.1.3.js"></script>
    <script type="text/javascript"
            src="./js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="./js/jquery.bootstrap.min.js"></script>

    <script type="text/javascript">

    </script>

    <%@ include file="WEB-INF/jsp/common/top.jsp"%>
    <%@ include file="WEB-INF/jsp/common/head.jsp"%>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <%@ include file="WEB-INF/jsp/common/leftMenu.jsp"%>
        </div>
      pay Number：<input id="cardNo" type="text" value=""/><br>
     pay Password：<input id="cardPwd" type="password" value=""/><br>  
     pay Money：<input id="cardMoney" type="text" value="${totalPrice }" readonly="readonly"/><br> 
    <input type="button" value="pay" id="pay">   
    </div>
</div>
<script type="text/javascript">
	$(function(){
		
		$("#pay").click(function(){
			var cardNo = $("#cardNo").val();
			var cardPwd = $("#cardPwd").val();
			var cardMoney = $("#cardMoney").val();
			if(cardNo!=null && cardPwd!=null &&cardMoney!=null ){
				alert("Pay Success!");
			}
		});
	});
</script>
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>