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
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,600;1,300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,600;1,300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/manager/css/Dangnhap.css">
	<title>Login</title>
</head>
<body>

	<div>
		<form method="POST" action="/perform_login">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
					<c:choose>
					<c:when test="${not empty param.login_error }">
						<div class="alert alert-danger" role="alert">Tên tài khoản hoặc mật khẩu không chính xác, hãy thử lại</div>
					</c:when>
					<c:otherwise>
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <h3 class="border-bottom text-success">Đăng nhập thành công!</h3>
					      <p>Cảm ơn bạn đã sử dụng dich vụ của chúng tôi.</p>
					    </div>
					  </div>
					</div>
					</c:otherwise>
					
					</c:choose>
  <div class="form-group">
    <label for="exampleInputEmail1">Tên Đăng Nhập</label>
    <input type="text" name="username" id="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="account@example.com">
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Mật Khẩu</label>
    <input type="password" name="password" id="password"  class="form-control" id="exampleInputPassword1" placeholder="">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Ghi Nhớ</label>
  </div>
  <button type="submit" class="btn btn-primary">Đăng Nhập</button>
</form>
	</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" type="text/javascript"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>