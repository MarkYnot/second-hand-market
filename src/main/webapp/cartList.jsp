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
        <c:choose>
            <c:when test="${empty cartVos }">
                <div class="alert alert-warning">
                    No products added to your shopping cart.
                </div>
            </c:when>
            <c:otherwise>
                <table data-toggle="table" style="width:70%;">
                    <thead>
                    <tr>
                        <th>Select all</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Date</th>
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${cartVos}">
                           <tr>
                           		<td><input name="productSelect" type="checkbox" value="${item.productId}"></td>
                                <td>${item.productTitle }</td>
                                <td>${item.productPrice }</td>
                                <td>${item.quantity }</td>
                                <td>${item.createAt }</td>
                                <td>${item.productTitle }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="button" value="Pay" id="pay">
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script type="text/javascript">
	$(function(){
		
		$("#pay").click(function(){
			var vals = [];
		    $('input:checkbox:checked').each(function (index, item) {
		        vals.push($(this).val());
		    });
		    if(vals.length>0){
		    	window.open("./PayServlet?method=payList&productIds="+vals, "_self");
		        
		    }
		});
	});
</script>
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>