<%@page import="cn.second_hand.query.PageResult"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.util.*,cn.second_hand.product.domain.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BuyersOrder</title>
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css" type="text/css" />
</head>
<body>
 <%
    PageResult userlist=(PageResult)request.getAttribute("pageResult");
    List<Order> orders =  (ArrayList)userlist.getListData();
  %>
<div class="search-form">
 
	<form action="/OrderServlet" method="get">
	<input type="hidden" name="method" value="getOrderList">
	<input type="hidden" name="typeId" value="1">
	<p style="text-align:center;">
		<input type="text" value="${searchParam}" placeholder="enter order number" name="keywords">
		<input type="submit" value="Search" name="search">
	</p>
	</form>

</div>
<table class="table">
	<thead>
		<tr>
			<th>orderNumber</th>
			<th>userName</th>
			<th>purchaseQuantity</th>
			<th>totalPrice</th>
			<th>productName</th>
			<th>category</th>
			<th>payType</th>
			<th>description</th>
			<th>orderState</th>
			<th>deliveryAddress</th>
			<th>logistic</th>
			<th>createTime</th>
			<th>updateTime</th>
			<th>operation</th>
		</tr>
	</thead>
	<tbody>
	<h2>BuyersOrder</h3>
	<%for(int i=0;i<orders.size();i++){
        Order order=(Order)orders.get(i);%>
        <tr>
       <th class="danger"><%=order.getoId() %></th>
       <th class="danger"><%=order.getoId() %></th>
        <th class="danger"><%=order.getCategory() %></th>
      <th class="danger"><%=order.getMoney() %></th>
        <th class="danger"><%=order.getCategory() %></th>
        <th class="danger"><%=order.getCategory() %></th>
        <th class="success"><%=order.getPayType() %></th>
         <th class="success"><%=order.getDescription() %></th>
        <th class="success"><%=order.getOrderState() %></th>
         <th class="success"><%=order.getDeliveryAddress() %></th>
        <th class="success"><%=order.getLogistic() %></th>
          <th class="success"><%=order.getCreateTime() %></th>
          <th class="success"><%=order.getUpdateTime() %></th>
        <%-- <th><%=order.getLogistic() %></th>
        <th><%=order.getLogistic() %></th> --%>
        <th><a href="/prj-servlet-22/modify.jsp">update/</a><a href="/prj-servlet-22/delete.jsp">del</a></th>
         <% 
        } %>
	</tbody>
</table>
<div style="width:200px;margin: 0 auto;">
<ul class="pager" >
	<li class="previous">
		<a Onclick="oldPage()" href="javascript:void(0)">&larr; Older</a>
	</li>
	<li class="next">
		<a Onclick="newPage()" href="javascript:void(0)">Newer &rarr;</a>
	</li>
</ul>
</div>
<script>
var pageInt = 1;
function oldPage(){
	pageInt--;
	if(pageInt<0){
		alert("没有喽！");
		return;
	}
	window.self.location.href="http://localhost:8080/second-hand/OrderServlet?method=getOrderList&typeId=1&currentPage="+pageInt;
}
function newPage(){
	pageInt+1;
	alert(pageInt);
	if(pageInt<0){
		alert("没有喽！");
		return;
	}
	window.self.location.href="http://localhost:8080/second-hand/OrderServlet?method=getOrderList&typeId=1&currentPage="+pageInt;
}
</script>

</body>
</html>