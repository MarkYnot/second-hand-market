<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Second-Hand->Login</title>
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/css/core.css" type="text/css" />
<script src="js/jquery/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.form.js"></script>
<title>${product.getTitle()}</title>
</head>
<%@ include file="WEB-INF/jsp/common/top.jsp"%>
<%@ include file="WEB-INF/jsp/common/head.jsp"%>
<body>
	<ul>
		<li>Title: ${product.getTitle()}</li>
		<li><img alt="300x200" src="${product.getPicture1()}" /></li>
		<li><img alt="300x200" src="${product.getPicture2()}" /></li>
		<li>category: ${product.getCategory()}</li>
		<li>price: $ ${product.getPrice()}</li>
		<li>description: ${product.getDescription()}</li>
		<li>applierEmail: ${product.getApplierEmail()}</li>
		<li>remark: ${product.getRemark()}</li>
	</ul>
	<span  style="margin-left: 120px;" onClick="addCart('${product.getOid()}','${product.getTitle()}')">
												<img alt="添加到购物车" src="./images/cart1.jpeg" style="width:15px;height:15px;margin-Right:10px;">
											</span>									
	
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
 <script type="text/javascript">

	//add goods to cart
	function addCart(productId,title){
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
	                alert("YOU HAVE PUT "+product.getTitle()+" INTO CART!");
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