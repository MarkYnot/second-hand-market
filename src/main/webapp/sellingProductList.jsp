<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
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
<script type="text/javascript"
	src="/js/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript"
	src="/js/plugins/jquery.twbsPagination.min.js"></script>
x

<style type="text/css">
.picture {
	width: 160px;
	height: 150px;
	float: left;
	margin-right: 10px;
	border: 1px solid #e3e3e3;
	text-align: center;
	padding: 5px;
}

.uploadImg {
	width: 100px;
	height: 100px;
	margin-top: 5px;
}

.swfupload {
	left: 0px;
	cursor: pointer;
}

.uploadify {
	height: 20px;
	font-size: 13px;
	line-height: 20px;
	text-align: center;
	position: relative;
	margin-left: auto;
	margin-right: auto;
	cursor: pointer;
	background-color: #337ab7;
	border-color: #2e6da4;
	color: #fff;
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
		
			$(".reviewClass").click(function(){
				var json=$(this).data("json");
				$("#oid").val(json.oid);
				$("#applierEmail").html(json.applierEmail);
				$("#title").html(json.title);
				$("#price").html(json.price);
				$("#description").html(json.description);
				var bargainStatus = json.bargainStatus.toString();
				$("#bargainStatus").html(bargainStatus);
				$("#category").html(json.category);
				$("#picture1").attr("src",json.picture1);
				$("#picture2").attr("src",json.picture2);
				$("#remark").html(json.remark);
				$("#myModal").modal("show");
			});
			});
			
		

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
			<div class="col-sm-9">
				<div class="page-header">
					<h3>Selling Product</h3>
				</div>
				<form id="searchForm" class="form-inline" method="post"
					action="/ProductServlet?method=sellingProductListPage">
					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
				<div class="panel panel-default">

					<c:choose>
						<c:when test="${not empty pageResult.listData}">
							<table class="table">

								<thead>
									<tr>
										<th>Title</th>
										<th>Price</th>
										<th>Category</th>
										<th>Apply Date</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="info" items="${pageResult.listData}">
										<tr>
											<td>${info.title}</td>
											<td>${info.price}</td>
											<td>${info.category}</td>
											<td>${info.applyTime}</td>
											<td><a href="javascript:void(-1);" class="reviewClass"
												data-json='${info.jsonString}'>Review</a></td>
											<td><a
												href="ProductServlet?method=withdrawSaleProduct&oid=${info.oid}">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="text-align: center;">
								<ul id="pagination" class="pagination"></ul>
							</div>
						</c:when>
						<c:otherwise>
							<h1>You have nothing on sale at present</h1>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
						<fieldset>
							<div id="legend" class="">Product Detail</div>
							<div class="row">
								<label class="col-sm-2 control-label" for="name">Applicant
									Email</label>
								<div class="col-sm-4">
									<label class="form-control" name="applierEmail"
										id="applierEmail"></label>
								</div>
								<label class="col-sm-2 control-label" for="name">Title</label>
								<div class="col-sm-4">
									<label class="form-control" name="title" id="title"></label>
								</div>
							</div>
							<div class="row">
								<label class="col-sm-2 control-label" for="name">Price</label>
								<div class="col-sm-4">
									<label class="form-control" name="price" id="price"></label>
								</div>
								<label class="col-sm-2 control-label" for="name">Category</label>
								<div class="col-sm-4">
									<label class="form-control" id="category"></label>
								</div>
							</div>
							<div class="row">
								<label class="col-sm-2 control-label" for="name">Bargain
									Status</label>
								<div class="col-sm-4">
									<label class="form-control" id="bargainStatus"></label>
								</div>
								<label class="col-sm-2 control-label" for="name">Description</label>
								<div class="col-sm-4">
									<label class="form-control" id="description"></label>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-sm-2 control-label" for="name">Picture
									1</label>
								<div class="col-sm-4">
									<img src="" id="picture1" style="width: 150px; height: 150px;" />
								</div>
								<label class="col-sm-2 control-label" for="name">Picture
									2</label>
								<div class="col-sm-4">
									<img src="" id="picture2" style="width: 150px; height: 150px;" />
								</div>
							</div>
							<br>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="name">Audit
									remark</label>
								<div class="col-sm-6">
									<label class="form-control" id="remark"></label>
								</div>
							</div>
						</fieldset>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>