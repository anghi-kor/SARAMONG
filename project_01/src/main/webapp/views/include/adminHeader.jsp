<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SARAMONG | ADMIN</title>

<link rel="icon"
	href="${pageContext.request.contextPath}/images/favicon1.png?v=10">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mystyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" />
</head>

<body>

	<header class="admin-header">
		<div class="container">
			<div class="admin-mainpage">

				<!-- 왼쪽 메뉴 -->
				<nav class="admin-menu">
					<a href="${pageContext.request.contextPath}/admin/main.do"><img src="/images/logo1.png"></a>  <a
						href="${pageContext.request.contextPath}/admin/list.do">会員管理</a> <a
						href="${pageContext.request.contextPath}/admin/view.do">商品管理</a> <a
						href="${pageContext.request.contextPath}/admin/write.do">商品登録</a>
					<a href="${pageContext.request.contextPath}/admin/orderList.do">注文管理</a>
				</nav>


				<!-- 오른쪽 관리자 -->
				<div class="admin-right">
					<span class="admin-name">ADMIN</span> <a
						href="${pageContext.request.contextPath}/admin/logout.do"
						class="logout-btn"> ログアウト </a>
				</div>

			</div>
		</div>
	</header>