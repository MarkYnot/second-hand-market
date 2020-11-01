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

<style type="text/css">
#saleApplyForm input, #saleApplyForm select {
	width: 260px;
}

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
	width: 120px;
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

#viewExample {
	position: relative;
	left: 50px;
	top: 60px;
}

.uploadExample {
	width: 200px;
	height: 130px;
	margin-bottom: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#uploadBtn1").uploadify({
			buttonText : "Picture1",
			fileObjName : "file",
			fileTypeDesc : "Picture1",
			fileTypeExts : "*.gif; *.jpg; *.png",
			multi : false,
			swf : "/js/plugins/uploadify/uploadify.swf",
			uploader : "/UpdatePictureServlet",
			overrideEvents : [ "onUploadSuccess", "onSelect" ],
			onUploadSuccess : function(file, data) {
				$("#uploadImg1").attr("src", data);
				$("#uploadImage1").val(data);
			}
		});

		$("#uploadBtn2").uploadify({
			buttonText : "Picture2",
			fileObjName : "file",
			fileTypeDesc : "Picture2",
			fileTypeExts : "*.gif; *.jpg; *.png",
			multi : false,
			swf : "/js/plugins/uploadify/uploadify.swf",
			uploader : "/UpdatePictureServlet",
			overrideEvents : [ "onUploadSuccess", "onSelect" ],
			onUploadSuccess : function(file, data) {
				$("#uploadImg2").attr("src", data);
				$("#uploadImage2").val(data);
			}
		});

		$("#saleApplyForm").ajaxForm(
				function() {
					$.messager.confirm("Congratulation",
							"Product application submitted successfully!",
							function() {
								window.location.reload();
								document.getElementById("saleApplyForm")
								.reset();
							});
				});
	});
	
	function beforeSubmit(form){
		if(form.title.value==''){
		alert('title can not be empty！');
		form.title.focus();
		return false;
		}
		if(form.salePrice.value==''){
		alert('salePrice can not be empty！');
		form.salePrice.focus();
		return false;
		}
		if(form.description.value==''){
		alert('description can not be empty！');
		form.description.focus();
		return false;
		}
		return true;
		}
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
				<div class="panel panel-default">
					<div class="panel-heading">Sale Application</div>
					<form class="form-horizontal" id="saleApplyForm" method="post"
						action="/ProductServlet?method=saleApplication" onSubmit="return beforeSubmit(this);"
						novalidate="novalidate">
						<fieldset>
							<div class="form-group">
								<p class="text-center text-danger">Please fill in the true
									and valid product information!</p>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label ">Applier Email</label>
								<div class="col-sm-8">
									<p class="form-control-static">${session_user.email }</p>
									<input type="hidden" name="applierEmail"
										value="${session_user.email }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="title">Title</label>
								<div class="col-sm-8">
									<input id="title" name="title" class="form-control" type="text"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4  control-label" for="catgory">Category</label>
								<div class="col-sm-8">
									<select id="category" class="form-control" name="category"
										size="1">
										<!-- <option >Please select a category</option> -->
										<option value="Fashion">Fashion</option>
										<option value="Electronics">Electronics</option>
										<option value="SportingGoods">Sporting goods</option>
										<option value="HomeGarden">Home & Garden</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4  control-label" for="salePrice">Sale
									Price</label>
								<div class="col-sm-8">
									<input id="salePrice" class="form-control" name="salePrice"
										type="text" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4  control-label" for="description">Description</label>
								<div class="col-sm-8">
									<input id="description" class="form-control" name="description"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4  control-label" for="bargainStatus">Bargain
									Status</label>
								<div class="col-sm-8">
									<select id="bargainStatus" class="form-control"
										name="bargainStatus" size="1">
										<option value="0">Yes</option>
										<option value="1">No</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4  control-label" for="picture">Picture</label>
								<div class="col-sm-8">
									<p class="text-help text-primary">Please click "Select
										picture" to upload the picture of the product!</p>
									<div class=picture>
										<div>
											<a href="javascript:;" id="uploadBtn1">Picture1</a>
										</div>
										<img alt="" src="" class="uploadImg" id="uploadImg1" /> <input
											type="hidden" name="image1" id="uploadImage1" />
									</div>
									<div class="picture">
										<div>
											<a href="javascript:;" id="uploadBtn2">Picture2</a>
										</div>
										<img alt="" src="" class="uploadImg" id="uploadImg2" /> <input
											type="hidden" name="image2" id="uploadImage2" />
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" id="asubmit"
									class="btn btn-primary col-sm-offset-4"
									data-loading-text="Submitting">
									<i class="icon-ok"></i> Submit
								</button>
							</div>
						</fieldset>
					</form>
					<%-- 	<c:if test="${session_user.saleApplyStatus }">
						<p>
						<div class="el-tip-info">
							<h3>Sale Application</h3>
							<br>
							<p class="text-info">The sale application materials have been submitted. Please wait patiently for the salesman's review. If the audit is urgently needed, please contact manager;</p>
						</div>
						<p>
						</c:if> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>