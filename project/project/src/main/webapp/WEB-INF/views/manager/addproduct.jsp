<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



	<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
	<title>Admin</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,600;1,300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,600;1,300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
        
        <script src="<c:url value='${base}/src/main/webapp/ckeditor/ckeditor.js' />"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/manager/css/Admin.css">
</head>
<body>
	<div class="header">
		<div>Mona Media</div>
		<div class="header-right">
			<i class="fas fa-user"></i>
			<c:if test ="${isLogined }">
				${userLogined.email}
				</c:if>
			<i class="fas fa-sign-out-alt"></i><a href=""></a>
			<c:if test ="${isLogined }">
				<a href="${base }/logout">Logout</a>
				</c:if>
		</div>
	</div>
	<div class="content">
		<div class="nav">
			<ul>
				<li><a href=""><i class="fas fa-border-all"></i>Tổng Quan</a></li>
				<li><a href="${base }/admin/list?&page=1"><i class="fas fa-list"></i>Quản Lý Sản Phẩm</a></li>
				<li><a href="${base }/admin/addproduct"><i class="fas fa-user-friends"></i>Thêm Sản Phẩm</a></li>
				<li><a href=""><i class="fas fa-receipt"></i>Đơn Đặt Hàng</a></li>
				<li><a href=""><i class="fas fa-comments"></i>Bình Luận Của Khách</a></li>
				<li><a href=""><i class="fas fa-percentage"></i>Khuyến Mãi</a></li>
				<li><a href=""><i class="fas fa-warehouse"></i>Kho Hàng</a></li>
				<li><a href=""><i class="fas fa-ad"></i>Quảng Cáo</a></li>
			</ul>
		</div >
		<div class="add">
		  <div class="d-flex" id="wrapper">
            
                
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">Add Products</h1>
                    <p>

						<sf:form method="post" action="${base}/admin/addproduct" modelAttribute="product" enctype="multipart/form-data">
	
							<sf:hidden path="id"/>
	
							<div class="form-group">
								<label for="category">Category </label>
								<sf:select path="categories.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />
								</sf:select>
							</div>
							
							<div class="form-group">
								<label for="title">Title </label>
								<sf:input path="title" autocomplete="off" type="text" class="form-control" id="title" placeholder="Title" required="required"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="price">Price </label>
								<sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="priceSale">Price Sale </label>
								<sf:input type="number" autocomplete="off" path="priceSale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="short_description">Description </label>
								<sf:textarea autocomplete="off" path="shortDes" class="form-control" placeholder="Short Description" id="short_description" rows="3" required="required"></sf:textarea>
							</div>
							
							<div class="form-group">
								<label for="detail_description">Details </label>
								<sf:textarea autocomplete="off" path="details" class="form-control summernote" id="detail_description" rows="3" required="required"></sf:textarea>
							</div>
							
							
							<div class="form-group form-check">
								<sf:checkbox path="isHot" class="form-check-input" id="is_hot" />
								<label class="form-check-label" for="is_hot">Is Hot Product?</label>
							</div>
	
							<div class="form-group">
								<label for="fileProductAvatar">Avatar</label> 
								<input id="fileProductAvatar" name="productAvatar" type="file" class="form-control-file">
							</div>
							
							<%-- <div class="form-group">
								<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.avatar}">
							</div> --%>
	
							<div class="form-group">
								<label for="fileProductPictures">Picture(Multiple)</label> 
								<input id="fileProductPictures" name="productPictures" type="file" class="form-control-file" multiple="multiple">
							</div>
							
							<%-- <div class="form-group">
								<c:forEach items="${product.productImages }" var="productImage">
									<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
								</c:forEach>
							</div> --%>
							
							<a href="/admin/list" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
							<button type="submit" class="btn btn-primary">Save Product</button>
	
						</sf:form>

					</p>
                </div>
            </div>
        </div>
        </div>
			
	


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" type="text/javascript"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src=".."></script>
</body>
</html>