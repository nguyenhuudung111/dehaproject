<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




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
				<li><a href="${base }/admin/category"><i class="fas fa-list"></i>Quản Lý Sản Phẩm</a></li>
				<li><a href="${base }/admin/addproduct"><i class="fas fa-user-friends"></i>Thêm Sản Phẩm</a></li>
				<li><a href="${base }/admin/list?&page=1"><i class="fas fa-receipt"></i>Đơn Đặt Hàng</a></li>
				<li><a href=""><i class="fas fa-comments"></i>Bình Luận Của Khách</a></li>
				<li><a href=""><i class="fas fa-percentage"></i>Khuyến Mãi</a></li>
				<li><a href=""><i class="fas fa-warehouse"></i>Kho Hàng</a></li>
				<li><a href=""><i class="fas fa-ad"></i>Quảng Cáo</a></li>
			</ul>
		</div>
		<div class="table">
			<div class="text">Bảng Điều Khiên</div>
			<div class="control">
				<div class="control-item col-lg-2 col-md-3 col-sm-6">
					<a href="">Đơn hàng mới</a>
				</div>
				<div class="control-item col-lg-2 col-md-3 col-sm-6">
					<a href="">Bình Luận</a>
				</div>
				<div class="control-item col-lg-2 col-md-3 col-sm-6">
					<a href="">Sản Phẩm</a>
				</div>
				<div class="control-item col-lg-2 col-md-3 col-sm-6">
					<a href="">Khách Hàng</a>
				</div>
			</div>
			
			<form action="${base }/admin/list" method="get">
			<input type="text" name="keyword"/>
			<button type="submit" value="Search">Search</button>
			
<table class="table col-lg-8 col-md-8 col-sm-8">
  <thead>
    <tr>
      <th scope="col">Số thứ tự</th>
      <th scope="col">Title</th>
      <th scope="col">Price</th>
      <th scope="col">Product</th>
      <th scope="col">Status</th>
      <th scope="col">Avatar</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items ="${products}" var = "product" varStatus="loop">
    <tr>
      <th scope="row">${loop.index + 1 }</th>
      <td>${product.title }</td>
      <td>${product.price }</td>
      <td>${product.categories.name }</td>
      <td>
      <span id="_product_status_${product.id }">
      <c:choose>
		      <c:when test="${product.status }">
		      <span class="badge badge-primary">Active</span>
		      </c:when>
	      <c:otherwise>
	       <span class="badge badge-warning">InActive</span>
	      </c:otherwise>
      </c:choose>
      </span>
      </td>
	     <td>
	     <img alt="" src="${base }/upload/${product.avatar}">
	     </td>
	     <td>
		<td class="ED" ><a href="${base }/admin/edit-products/${product.id }"><i class="fas fa-edit"></i></a></td>
		<td class="ED" ><a href="javascript:confirmDel('${base }/admin/delete/${product.id}'); void(0);" ><i class="fas fa-trash"></i></a></td>
	     </td>
    </tr>
<%--	  <script type="text/javascript">--%>
<%--		  function deleteProduct() {--%>
<%--			  //with upload file--%>
<%--			  // Get form--%>
<%--			  //var form = $('#fileUploadForm')[0];--%>
<%--			  //var data = new FormData(form);--%>

<%--			  // javascript object.--%>
<%--			  // data la du lieu ma day len action cua controller--%>
<%--			  let data = {--%>
<%--				  id: jQuery(${product.id }).val(), // lay theo id--%>

<%--			  };--%>

<%--			  // $ === jQuery--%>
<%--			  // json == javascript object--%>
<%--			  jQuery.ajax({--%>
<%--				  url : "/admin/delete/{productId}",--%>
<%--				  type : "post",--%>
<%--				  contentType : "application/json",--%>
<%--				  data : JSON.stringify(data),--%>

<%--				  dataType : "json", // kieu du lieu tra ve tu controller la json--%>
<%--				  success : function(jsonResult) {--%>
<%--					  alert("Ban Co muon xoa san pham  " + jsonResult.message.id);--%>
<%--				  },--%>
<%--				  error : function(jqXhr, textStatus, errorMessage) { // error callback--%>

<%--				  }--%>
<%--			  });--%>
<%--		  }--%>
<%--	  </script>--%>
    </c:forEach>
  </tbody>
</table>

</form>
<nav aria-label="Page navigation example">
  <ul class="pagination">

    <li class="page-item"><a class="page-link" href="${base }/admin/list?&page=${pagePrevious}">Previous</a></li>
    <li class="page-item"><a class="page-link" href="${base }/admin/list?&page=${pageNext}">Next</a></li>


  </ul>
</nav>
		</div>
		<div class="table2">
				
		</div>
	


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" type="text/javascript"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%--  <script type="text/javascript">--%>
<%--        	function deleteProduct() {--%>
<%--        		//with upload file--%>
<%--        		// Get form--%>
<%--			    //var form = $('#fileUploadForm')[0];--%>
<%--			    //var data = new FormData(form);--%>
<%--        		--%>
<%--        		// javascript object.--%>
<%--        		// data la du lieu ma day len action cua controller--%>
<%--				let data = {--%>
<%--					id: jQuery(${product.id }).val(), // lay theo id--%>
<%--					--%>
<%--        		};--%>
<%--        		--%>
<%--				// $ === jQuery--%>
<%--				// json == javascript object--%>
<%--				jQuery.ajax({--%>
<%--					url : "/admin/delete/{productId}",--%>
<%--					type : "post",--%>
<%--					contentType : "application/json",--%>
<%--					data : JSON.stringify(data),--%>
<%--					--%>
<%--					dataType : "json", // kieu du lieu tra ve tu controller la json--%>
<%--					success : function(jsonResult) {--%>
<%--						alert("Ban Co muon xoa san pham  " + jsonResult.message.id);--%>
<%--					},--%>
<%--					error : function(jqXhr, textStatus, errorMessage) { // error callback --%>
<%--						--%>
<%--					}--%>
<%--				});--%>
<%--        	}--%>
<%--        </script>--%>
		<script type="text/javascript">
			function confirmDel(url) {
				var message = "Bạn có thực sự muốn xóa Sản phẩm này?";
				if (window.confirm(message)) {
					window.location.href = url;
				} else {
					return false;
				}
			}
		</script>
</body>
</html>