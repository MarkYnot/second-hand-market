<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
	
<ul id="menu" class="list-group">
	<li class="list-group-item">
		<a href="javascript:;"><span>Purchase</span></a>
		<ul>
			<li name="bid"><a href="/OrderServlet?method=getOrderList&typeId=1"><span>My Order</span></a></li>
			<li name="receive"><a href="#"><span>Pending order</span></a></li>
		</ul>
	</li>
	<li class="list-group-item">
		<a href="#"><span class="text-title">My Account</span></a>
		<ul class="in">
			<li name="personal"><a href="#">Account Information</a></li>
			<li name="userFile"><a href="/">Address Management</a></li>
			<li name="bankInfo"><a href="/">Bank Card Management</a></li>
			<li name="ipLog"><a href="/">Login Record</a></li>
			<li name="realAuth"><a href="/">Personal Message</a></li>
		</ul>
	</li>
	<li class="list-group-item">
		<a href="#"><span>Sale</span></a>
		<ul class="in">
			<li name="accountFlow_list"><a href="/OrderServlet?method=getOrderList&typeId=2">My Order</a></li>
			<li name="SellingProductPage"><a href="/ProductServlet?method=sellingProductListPage">Your Products On Sale</a></li>
			<li name="saleApplyingListPage"><a href="/ProductServlet?method=saleApplyingListPage">Your Products In Application</a></li>
			<li name="saleApplication"><a href="/saleApplication.jsp">Apply A New Sale Product </a></li>
			<li name="refusedSaleApplication"><a href="/ProductServlet?method=refusedSaleApplyingListPage">Refused Sale Application</a></li>
		</ul>
	</li>
</ul>

<!-- <#if currentMenu??>
<script type="text/javascript">
	$(".list-group-item li[name=${currentMenu}]").addClass("active");
</script>
</#if> -->