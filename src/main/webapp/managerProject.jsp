<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Second-Hand Trading Market</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/js/bootstrap-3.3.2-dist/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="css/core.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/account.css" />
<link rel="stylesheet"
	href="js/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.form.js"></script>
<script type="text/javascript"
	src="js/plugins/jquery.twbsPagination.min.js"></script>

<style>
#footer {
	padding: 15px 0;
	background: #fff;
	border-top: 1px solid #ddd;
	text-align: center;
}

#topcontrol {
	color: #fff;
	z-index: 99;
	width: 30px;
	height: 30px;
	font-size: 20px;
	background: #222;
	position: relative;
	right: 14px !important;
	bottom: 11px !important;
	border-radius: 3px !important;
}

#topcontrol:after {
	/*top: -2px;*/
	left: 8.5px;
	content: "\f106";
	position: absolute;
	text-align: center;
	font-family: FontAwesome;
}

#topcontrol:hover {
	color: #fff;
	background: #18ba9b;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.label-type, .label-status, .label-order {
	background-color: #fff;
	color: #f60;
	padding: 5px;
	border: 1px #f60 solid;
}

#typeList












  












:not












 












(
:first-child












 












)
{
margin-top
























:












 












20
px
























;
}
.label-text {
	margin: 0 10px;
}

.panel {
	border-radius: 0;
}

h3.break {
	font-size: 16px;
	display: block;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	text-overflow: ellipsis;
}

h3.break>a {
	text-decoration: none;
}
</style>
<script type="text/javascript">

	$(function() {
		$('#pagination').twbsPagination({
			totalPages : ${pageResult.totalPage},
			startPage : ${pageResult.currentPage},
			visiblePages : 5,
			first : "first",
			prev : "pre",
			next : "next",
			last : "last",
			onPageClick : function(event, page) {
				$("#currentPage").val(page);
				$("#searchForm").submit();
			}
		});
		
		
		
		$("#query").click(function(){
			$("#currentPage").val(1);
			$("#searchForm").submit();
		})
	});
	</script>
<%@ include file="WEB-INF/jsp/common/managerTop.jsp"%>
<%@ include file="WEB-INF/jsp/common/managerHead.jsp"%>
</head>
<body>

	<div class="container theme-showcase" role="main">
		<!-- <div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default" role="navigation">
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a
									href="/ProductServlet?method=allProductListPage"><i
										class="glyphicon glyphicon-th-large"></i> Product overview</a></li>
								<li><a rel="nofollow" href="/saleApplication.jsp"><i
										class="glyphicon glyphicon-edit"></i> Sale product</a></li>
								<li><a rel="nofollow" href="/home.jsp"><i
										class="glyphicon glyphicon-user"></i> Personal management</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div> -->

		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav navbar-nav">
								<li>Category:</li>
								<br />
								<c:if test="${category eq null && sortBy eq null}">
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Home & Garden</a></li>

									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Electronics' && sortBy eq null}">
									<li><a href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> All Categories</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Electronics"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Electronics"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Fashion' && sortBy eq null}">
									<li><a href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Electronics</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Fashion"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Fashion"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'SportingGoods' && sortBy eq null}">
									<li><a href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Fashion</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=SportingGoods"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=SportingGoods"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'HomeGarden' && sortBy eq null}">
									<li><a href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sporting goods</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=HomeGarden"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=HomeGarden"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								
								
								<c:if test="${category eq null && sortBy eq -1}">
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=-1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=-1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=-1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=-1"
										style="color: #555"> Home & Garden</a></li>

									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> Sort by Release Date</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Electronics' && sortBy eq -1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> All Categories</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=-1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=-1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=-1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=-1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Sort by Release Date</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Electronics"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Electronics"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Fashion' && sortBy eq -1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=-1"
										style="color: #555"> Electronics</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=-1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=-1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=-1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Sort by Release Date</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Fashion"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Fashion"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'SportingGoods' && sortBy eq -1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=-1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=-1"
										style="color: #555"> Fashion</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=-1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=-1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sort by Release Date</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=SportingGoods"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=SportingGoods"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'HomeGarden' && sortBy eq -1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=-1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=-1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=-1"
										style="color: #555"> Sporting goods</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=-1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Sort by Release Date</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=HomeGarden"
										style="color: #555"> Sort by Higher Price</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=HomeGarden"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								
								
								<c:if test="${category eq null && sortBy eq 1}">
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=1"
										style="color: #555"> Home & Garden</a></li>

									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1"
										style="color: #555"> Sort by Higher Price</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Electronics' && sortBy eq 1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> All Categories</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Electronics"
										style="color: #555"> Sort by Higher Price</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Electronics"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'Fashion' && sortBy eq 1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=1"
										style="color: #555"> Electronics</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=Fashion"
										style="color: #555"> Sort by Higher Price</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=Fashion"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'SportingGoods' && sortBy eq 1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=1"
										style="color: #555"> Fashion</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=1"
										style="color: #555"> Sporting goods</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=SportingGoods"
										style="color: #555"> Sort by Higher Price</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=SportingGoods"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								<c:if test="${category eq 'HomeGarden' && sortBy eq 1}">
									<li><a href="/managerProductServlet?method=allProductListPage&sortBy=1"
										style="color: #555"> All Categories</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Electronics&sortBy=1"
										style="color: #555"> Electronics</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=Fashion&sortBy=1"
										style="color: #555"> Fashion</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&category=SportingGoods&sortBy=1"
										style="color: #555"> Sporting goods</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden&sortBy=1"
										style="color: #555"> Home & Garden</a></li>
									<br />
									<br />
									<br />
									<br />
									<li>Sort by: <br /></li>
									<li ><a
										href="/managerProductServlet?method=allProductListPage&category=HomeGarden"
										style="color: #555"> Sort by Release Date</a></li>
									<li><a
										href="/managerProductServlet?method=allProductListPage&sortBy=-1&category=HomeGarden"
										style="color: #555"> Sort by Higher Price</a></li>
									<li style="background-color: #B8B8B8;"><a
										href="/managerProductServlet?method=allProductListPage&sortBy=1&category=HomeGarden"
										style="color: #555"> Sort by Lower Price</a></li>
								</c:if>
								
							</ul>
						</div>
						<div class="panel-footer" style="height: 50px; padding: 0;">
							<div style="float: left; padding: 15px;">There are
								${pageResult.totalCount} matched products</div>
							<div style="float: right;">
								<!-- <form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Enter to search">
									</div>
									<button type="submit" class="btn btn-default">
										<i class="glyphicon glyphicon-search"></i> Search
									</button>
								</form> -->

								<form id="searchForm" class="form-inline" method="post"
									action="/managerProductServlet?method=allProductListPage">
									<input type="hidden" id="currentPage" name="currentPage"
										value="" />
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Enter to search" name="keyword"
											value="${keyword }"> <input type="hidden"
											id="category" name="category" value="${category }" />
											<input type="hidden"
											id="sortBy" name="sortBy" value="${sortBy }" />
										<button id="query" class="btn btn-success">
											<i class="icon-search"></i> Search
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<c:forEach var="product" items="${pageResult.listData}"
			varStatus="index">
			<c:if test="${index.index==0 || index.index%4==0}">
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="row">
								<div class="col-md-3">
									<div class="thumbnail">
										<img alt="300x200" src="${product.picture1}" />
										<div class="caption">
											<h3 class="break">
												<a href="project.html">${product.title}</a>
											</h3>
											<p>
											<div style="float: left;">
												<i class="glyphicon glyphicon-screenshot" title="price"></i>
												$${product.price }
											</div>

											<br>
											<div>
												<span style="float: right;"><i
													class="glyphicon glyphicon-star-empty"></i></span> <span><i
													class="glyphicon glyphicon-user" title="user"></i>
													${product.applierEmail }</span>
											</div>
										</div>
									</div>
								</div>
			</c:if>
			<c:if test="${index.index!=0 && index.index%4!=0}">
				<div class="col-md-3">
					<div class="thumbnail">
						<img alt="300x200" src="${product.picture1}" />
						<div class="caption">
							<h3 class="break">
								<a href="project.html">${product.title}</a>
							</h3>
							<p>
							<div style="float: left;">
								<i class="glyphicon glyphicon-screenshot" title="price"></i>
								$${product.price }
							</div>

							<br>
							<div>
								<span style="float: right;"><i
									class="glyphicon glyphicon-star-empty"></i></span> <span><i
									class="glyphicon glyphicon-user" title="user"></i>
									${product.applierEmail }</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>

	</div>

	<div style="text-align: center;">
		<ul id="pagination" class="pagination"></ul>
	</div>
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>