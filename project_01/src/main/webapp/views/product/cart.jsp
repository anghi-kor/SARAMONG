<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<c:if test="${loginRequired}">
	<script>
		alert("ログインが必要なサービスです。");
		location.href = "${pageContext.request.contextPath}/user/login.do";
	</script>
</c:if>

<div id="cart-page" class="container-fluid container">

	<h3>Cart</h3>

	<!-- 장바구니 비었을 때 -->
	<c:if test="${empty cartList}">
		<p class="empty-cart">カートに商品が入っていません。</p>
	</c:if>

	<!-- 장바구니 목록 -->
	<c:if test="${not empty cartList}">
		<form id="cartForm"
			action="${pageContext.request.contextPath}/cart/deleteSelected.do"
			method="post">
			<div class="cart-del-btns">
				<button type="submit" class="btn btn-gray">選択削除</button>
				<span>|</span>
				<a href="${pageContext.request.contextPath}/cart/deleteAll.do"
					class="btn btn-gray" onclick="return confirm('カート内の商品をすべて削除しますか？');">
					すべて削除</a>
			</div>
			<table class="cart-table">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll"></th>
						<th>商品</th>
						<th>商品名</th>
						<th>オプション</th>
						<th>価格</th>
						<th>数量</th>
						<th>小計</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalPrice" value="0" />
					<c:forEach var="cart" items="${cartList}">
						<c:set var="itemPrice"
							value="${(cart.discount_price > 0 ? cart.discount_price : cart.price) * cart.quantity}" />

						<c:set var="totalPrice" value="${totalPrice + itemPrice}" />
						
						<tr data-cart-id="${cart.cart_id}">
							<!-- 체크박스 -->
							<td><input type="checkbox" name="cart_id"
								value="${cart.cart_id}" class="cart-check"></td>
							<!-- 이미지 -->
							<td><img
								src="${pageContext.request.contextPath}/upload/product/main/${cart.main_image}"
								class="cart-img"></td>

							<!-- 상품명 -->
							<td>
								<p class="cart-name">${cart.product_name}</p>
							</td>

							<!-- 옵션 -->
							<td><span class="cart-option"> ${cart.color_name} /
									${cart.size_name} </span></td>

							<!-- 가격 -->
							<td><c:choose>
									<c:when test="${cart.discount_price > 0}">
										<span class="price-discount"> <fmt:formatNumber
												value="${cart.discount_price}" pattern="#,###" />円
										</span>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${cart.price}" pattern="#,###" />円
                                    </c:otherwise>
								</c:choose></td>

							<!-- 수량 -->
							<td class="qty-area">
								<button type="button" class="qty-btn minus"
									data-id="${cart.cart_id}">−</button> <input type="text"
								value="${cart.quantity}" class="qty-input" readonly>

								<button type="button" class="qty-btn plus"
									data-id="${cart.cart_id}">+</button>
							</td>


							<!-- 합계 -->
							<td class="cart-sum"
								data-price="${cart.discount_price > 0 ? cart.discount_price : cart.price}">
								<fmt:formatNumber value="${itemPrice}" pattern="#,###" />円
							</td>


							<!-- 삭제 -->
							<td><a
								href="${pageContext.request.contextPath}/cart/delete.do?cart_id=${cart.cart_id}"
								onclick="return confirm('削除しますか？');" class="btn-delete">✕</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
		<!-- 총 금액 -->
		<div class="cart-total">
			ご注文合計金額： <strong> <fmt:formatNumber value="${totalPrice}"
					pattern="#,###" />円
			</strong>
		</div>

		<button type="button" class="btn btn-black" id="cartOrderBtn">注文する</button>

	</c:if>

</div>

<%@ include file="../include/footer.jsp"%>