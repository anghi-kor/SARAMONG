<%@page import="model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SARAMONG</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon1.png?v=10">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mystyle.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BMJUA.woff2">

</head>
<body>
	<header id="header">
		<div class="container-fluid">
			<div class="container">
				<div class="d-flex justify-content-between">
					<div class="hd-logo">
						<a href="/"><img
							src="/images/logo1.png"></a>
					</div>
					<div class="hd-gnb">
						<ul class="hd-category">
							<li><a href="${pageContext.request.contextPath}/" class="hdgnb-font">HOME</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?type=new" class="hdgnb-font" >NEW</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?type=best" class="hdgnb-font">BEST</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?category_id=1" class="hdgnb-font">OUTWEAR</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?category_id=2" class="hdgnb-font">TOP</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?category_id=3" class="hdgnb-font">DRESS</a></li>
							<li><a href="${pageContext.request.contextPath}/product/list.do?category_id=4" class="hdgnb-font">ACC</a></li>
						</ul>
						<ul class="hd-community">
							<li><a class="hdgnb-font">COMMUNITY</a>
								<ul class="hdgnb-2depth shadow p-3  bg-white rounded">
									<li><a href="#" class="hdgnb-fontdepth">NOTICE</a></li>
									<li><a href="#" class="hdgnb-fontdepth">Q&amp;A</a></li>
									<li><a href="#" class="hdgnb-fontdepth">REVIEW</a></li>
									<li><a href="#" class="hdgnb-fontdepth">EVENT</a></li>
								</ul></li>
						</ul>
					</div>
					<div class="hd-sidebar">
						<ul class="hd-icons">
							<li class="hd-login">
								<img src="/images/login.png">
								<ul class="hdicons-2depth shadow p-3 bg-white rounded">
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<li><a href="${pageContext.request.contextPath}/user/login.do" class="hdicons-fontdepth">LOGIN</a></li>
											<li><a href="${pageContext.request.contextPath}/user/join.do" class="hdicons-fontdepth">JOIN</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath}/user/logout.do" class="hdicons-fontdepth">LOGOUT</a></li>
										</c:otherwise>
									</c:choose>
									<li><a href="#" class="hdicons-fontdepth">ORDER</a></li>
									<li><a href="#" class="hdicons-fontdepth">MYPAGE</a></li>
								</ul>
							</li>
							<li class="hd-cart"><a href="${pageContext.request.contextPath}/cart/cart.do"><img src="/images/cart.png"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Top / Bottom 아이콘 버튼 -->
	<div id="scrollIconBtn">
		<div id="topIcon" class="icon-circle">▲</div>
		<div id="bottomIcon" class="icon-circle">▼</div>
	</div>