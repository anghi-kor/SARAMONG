<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="../include/header.jsp"%>

	<div class="user-page">
		<div class="container-fluid">
			<div class="container">
				<h3>LOGIN</h3>
				<form class="login-form" id="loginForm">
					<input type="text" name="user_id" placeholder="ID" id="user_id" required>
					<input type="password" name="user_pw" placeholder="password" id="user_pw" required>
					<div class="login-button">
						<button type="submit" class="login-btn" style="cursor:pointer">ログイン</button>
						<a href="${pageContext.request.contextPath}/user/join.do" class="login-join">ジョイン</a>
					</div>
					<div class="login-find">
						<a href="">IDを探す</a> <span>|</span> <a href="">PWを探す</a>
					</div>
					<%-- <div class="login-link">
						<a href="${pageContext.request.contextPath}/user/googleLogin.do">
								<img src="${pageContext.request.contextPath}/images/google.png" alt="구글로그">		
						</a>
					</div> --%>
				</form>
			</div>
		</div>
	</div>






	<%@ include file="../include/footer.jsp"%>
