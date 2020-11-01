<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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

<script type="text/javascript">
	
</script>

<%@ include file="WEB-INF/jsp/common/top.jsp"%>

</head>
</head>
<body>
	<div style="width: 1300px; background-color: burlywood;">
		<div style="width: 80%; margin: 0 auto">
			<a href="home.jsp">home</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="./CartServlet?method=cartList">Shopping Cart</a>
		</div>
		<div>

<!-- 			<div style="float: left; margin-left: 25px; width: 300px; height: 300px" style="border:1px solid;">
				<a href="detail?id=1"  width="100%" height="80%"> 
					<img alt="earphone" src="img/earphone.jpg" width="100%" height="100%">
				</a>
				<div width="100%" height="20%">
				3
				</div>
			</div>
			<div
				style="float: left; margin-left: 25px; width: 300px; height: 300px"  style="border:1px solid;">
				<a href="detail?id=2" width="100%" height="80%"> <img alt="iwatch" src="img/iwatch.jpg" width="100%" height="100%">
				</a>
				<div width="100%" height="20%" >
					1
				</div>
			</div>
			<div
				style="float: left; margin-left: 25px; width: 300px; height: 300px">
				<a href="detail?id=3"  width="100%" height="80%"> <img alt="pc" src="img/pc.jpg" width="100%" height="100%">
				</a>
				<div width="100%" height="20%">
				2
				</div>
			</div>
			<div
				style="float: left; margin-left: 25px; width: 300px; height: 300px">
				<a href="detail?id=4"> <img alt="ipad" src="img/ipad.jpg" width="100%" height="80%">
				</a>
				<div width="100%" height="20%" style="background-color:red;"></div>
			</div> -->
		</div>

	</div>
			<c:set var="string1" value="<br/>"/>
			<table>
				<c:forEach items="${pageResult.listData}" var="product" varStatus="status">
					<c:if test="${status.count%4==1 }" >
						<tr>

					</c:if>
							<td>
								<div style="float: left; margin-left: 25px; width: 300px; height: 300px;border:1px solid;margin-top:30px;">
									<a href="detail?id=1"  width="100%" height="75%"> 
										<img alt="${product.description}" src="${product.picture1}" width="100%" height="100%">
									</a>
									<div width="100%" height="25%">
									${product.title} &nbsp;&nbsp;&nbsp;&nbsp;$${product.price} ${status.count}&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javaScript:addCart('${product.oid}')"><img style="height:20px;width:32px;" alt="add to shopping cart" src="./images/cart1.jpeg"></a>
									</div>
								</div>
							
							</td>

					<c:if test="${status.count%4==0}" >
						</tr>

					</c:if>
				</c:forEach>
			</table>
</body>
<script type="text/javascript">
	//add goods to cart
	function addCart(productId){
	        //请求参数
	        var list = {};
	        //
	        $.ajax({
	            //请求方式
	            type : "POST",
	            //请求的媒体类型
	            //contentType: "application/json;charset=UTF-8",
	            //请求地址
	            url : "./CartServlet?method=cartAdd&productId="+productId,
	            //数据，json字符串
	            //data : JSON.stringify(list),
	            //请求成功
	            success : function(result) {
	                console.log(result);
	            },
	            //请求失败，包含具体的错误信息
	            error : function(e){
	                console.log(e.status);
	                console.log(e.responseText);
	            }
	        });
	}
</script>
</html>