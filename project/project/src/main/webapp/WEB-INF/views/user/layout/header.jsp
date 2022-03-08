<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="header">
	<div class="left">
			<ul>                                                                                                                             
			<li><a href=""><i class="fab fa-facebook-f"></a></i></li>
			<li><a href=""><i class="fab fa-google-plus-g"></a></i></li>
			<li>HOTLINE:0346590614</li>
		</ul>
	</div>
	<div class="right">
		<ul>
			<li><a href="${base }/login">ĐĂNG KÍ</a></li>
			<li><a href="${base }/login">ĐĂNG NHẬP</a></li>
			<button type="button" class="btn btn-b-n d-md-block  mr-1" >
				<c:choose>
				
					<c:when test="${isLogined }">
						<a href="${base }/user-detail">
							<b>${userLogined.username }
							<c:choose>
								<c:when test="${userLogined.avatar != null }">
									<img class="rounded-circle" style="width: 15px; height: 15xp;" alt="..." src="${base }/upload/${userLogined.avatar }">
								</c:when>
								<c:when test="${userLogined.avatar == null }">
									<i class="fas fa-user" ></i>
								</c:when>
							</c:choose>
							
						</a>
					</c:when>
					<c:otherwise>
						<a href="${base }/login">
							<i class="fas fa-user" ></i>
						</a>
					</c:otherwise>
				</c:choose>
				
				</button>
				<c:if test ="${isLogined }">
				<a href="${base }/logout">Logout</a>
				</c:if>
		</ul>
	</div>

	</div>
	<div class="nav">
		<div class="logo">
			<a href=""><img src="${pageContext.servletContext.contextPath}/user/img/logo.png"></a>
		</div>
		<div class="sidebar">
			<ul>
				<li><a href="${base }/user/home">Trang Chủ</a></li>
				<li><a href="">Giới Thiệu</a></li>
				<li><a href="">Khách Hàng Doanh Nghiệp</a></li>
				<li><a href="${base }/user/sanpham">Sản Phẩm</a>
					<div class="sub_menu">
						<ul>
							<li><a href=""><b>Trang Phục Nam</b></a></li>
							<li><a href="">Sơ Mi Nam</a></li>
							<li><a href="">Quần Nam</a></li>
							<li><a href="">Áo Thun Nữ</a></li>
							<li><a href="">Áo Khoác Nam</a></li>
						</ul>

						<ul>
							<li><a href=""><b>Trang Phục Nữ</b></a></li>
							<li><a href="">Sơ Mi Nữ</a></li>
							<li><a href="">Quần Nữ</a></li>
							<li><a href="">Áo Thun Nam</a></li>
							<li><a href="">Áo Khoác Nữ</a></li>
						</ul>
						<ul>
							<li><a href=""><b>Phụ Kiện</b></a></li>
							<li><a href="">Giày</a></li>
							<li><a href="">Tất</a></li>
							<li><a href="">Nịt</a></li>
							<li><a href="">Ví</a></li>
						</ul>

					</div>
				</li>
				<li><a href="">Hệ Thống Cửa Hàng</a></li>
				<li><a href="${base }/user/lienhe">Liên Hệ</a></li>
				<li><i class="fas fa-search"></i> <br>
					<div class="search-bar">
					<ul>
						<li><input type="text" name="" placeholder="TÃ¬m Kiáº¿m ..."><a href=""> <i class="fas fa-search"></i></a></li>
					</ul>
					</div>

				</li>
				<li><a href="${base }/cart/view"><i class="fas fa-shopping-cart"></i><span id ="totalCartItemId">${totalItems }</span></a></li>
			</ul>
		</div>
		
	</div>
</html>