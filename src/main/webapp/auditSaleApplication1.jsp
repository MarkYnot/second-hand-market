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
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript"
	src="/js/plugins/jquery.twbsPagination.min.js"></script>

<script type="text/javascript">
		$(function() {
			$('#pagination').twbsPagination(
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
			
			$(".btn_audit").click(function(){
				var form=$("#editform");
				form.find("[name=state]").val($(this).val());
				$("#myModal").modal("hide");
				form.ajaxSubmit(function(data){
					if(data.success){
						$.messager.confirm("提示","Audit Successful!",function(){
							window.location.reload();
						});
					}else{
						$.messager.alert("提示",data.msg);
					}
				});
				return false;
			});
			
			$(".auditClass").click(function(){
				var json=$(this).data("json");
				$("#applierEmail").html(json.applierEmail);
				$("#title").html(json.title);
				$("#price").html(json.price);
				$("#description").html(json.description);
				$("#bargainStatus").html(json.bargainStatus);
				$("#category").html(json.category);
				$("#picture1").attr("src",json.picture1);
				$("#picture2").attr("src",json.picture2);
				
				$("#myModal").modal("show");
			});
		});
	</script>

<%@ include file="WEB-INF/jsp/common/managerTop.jsp"%>
<%@ include file="WEB-INF/jsp/common/managerHead.jsp"%>

</head>
<body>

	<div class="col-sm-3">
		<%@ include file="WEB-INF/jsp/common/managerMenu.jsp"%>
	</div>
	<!-- 功能页面 -->
	<div class="col-sm-9">
		<div class="page-header">
			<h3>Sale Application Management</h3>
		</div>
		<form id="searchForm" class="form-inline" method="post"
			action="/ProductServlet?method=auditSaleApplyPage">
			<input type="hidden" id="currentPage" name="currentPage" value="" />
			<div class="form-group">
				<label>Status</label> <select class="form-control" name="state">
					<c:if test="${state eq null}">
						<option value="-1">All</option>
						<option value="0">In the application</option>
						<option value="1">Approved</option>
						<option value="2">Refused</option>
					</c:if>
					<c:if test="${state eq 0 }">
						<option value="-1">All</option>
						<option value="0" selected>In the application</option>
						<option value="1">Approved</option>
						<option value="2">Refused</option>
					</c:if>
					<c:if test="${state eq 1 }">
						<option value="-1">All</option>
						<option value="0">In the application</option>
						<option value="1" selected>Approved</option>
						<option value="2">Refused</option>
					</c:if>
					<c:if test="${state eq 2 }">
						<option value="-1">All</option>
						<option value="0">In the application</option>
						<option value="1">Approved</option>
						<option value="2" selected>Refused</option>
					</c:if>

				</select>

			</div>
			<div class="form-group">
				<label>Apply Time</label> <input class="form-control" type="text"
					name="beginDate" id="beginDate" value="${qo.beginDate}" />to <input
					class="form-control" type="text" name="endDate" id="endDate"
					value="${qo.endDate}" />
			</div>
			<div class="form-group">
				<button id="query" class="btn btn-success">
					<i class="icon-search"></i> Search
				</button>
			</div>
		</form>
		<div class="panel panel-default">
			<table class="table">
				<thead>
					<tr>
						<th>Applicant Email</th>
						<th>Title</th>
						<th>Price</th>
						<th>Category</th>
						<th>Apply Date</th>
						<th>Audit Status</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="info" items="${pageResult.listData }">
						<tr>
							<td>${info.applierEmail}</td>
							<td>${info.title}</td>
							<td>${info.price}</td>
							<td>${info.category}</td>
							<td>${info.applyTime}</td>
							<c:if test="${info.auditState eq 0}">
								<td>Processing</td>
							</c:if>
							<c:if test="${info.auditState eq 1}">
								<td>Approved</td>
							</c:if>
							<c:if test="${info.auditState eq 2}">
								<td>Refused</td>
							</c:if>
							<td><c:if test="${info.auditState ==0}">
									<a href="javascript:void(-1);" class="auditClass"
										data-json='${info.jsonString}'>Audit</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="text-align: center;">
			<ul id="pagination" class="pagination"></ul>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="editform" method="post"
						action="/">
						<fieldset>
							<div id="legend" class="">
								<legend>Audit Sale Application</legend>
							</div>
							<!-- <input type="hidden" name="id" id="id" value="" /> -->
							<input type="hidden" name="state" id="state" value="" />
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
									<textarea name="remark" rows="4" cols="60"></textarea>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-success btn_audit" value="1">Approve</button>
					<button type="button" class="btn btn-warning btn_audit" value="2">Refuse</button>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="WEB-INF/jsp/common/footer.jsp"%>
</html>