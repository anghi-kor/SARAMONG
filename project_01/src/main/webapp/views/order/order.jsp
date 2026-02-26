<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<c:if test="${loginRequired}">
	<script>
		alert("ログインが必要なサービスです。");
		location.href = "${pageContext.request.contextPath}/user/login.do";
	</script>
</c:if>
<div class="container order-page">

	<h3>Order</h3>

	<!-- 주문 상품 목록 -->
	<table class="order-table">
		<thead>
			<tr>
				<th></th>
				<th>商品名</th>
				<th>オプション</th>
				<th>数量</th>
				<th>価格</th>
				<th>小計</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${orderItems}">
				<tr>
					<td><img
						src="${pageContext.request.contextPath}/upload/product/main/${item.main_image}"
						class="order-thumb"></td>
					<td>${item.product_name}</td>
					<td>${item.color_name}/${item.size_name}</td>
					<td>${item.quantity}</td>
					<td><fmt:formatNumber value="${item.unit_price}"
							pattern="#,###" />円</td>
					<td><fmt:formatNumber value="${item.subtotal}" pattern="#,###" />円
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 총 금액 -->
	<div class="order-total">
		合計金額 : <strong> <fmt:formatNumber value="${totalPrice}"
				pattern="#,###" />円
		</strong>
	</div>


	<!-- 배송 정보 -->
	<h4>배송 정보</h4>
	<form action="${pageContext.request.contextPath}/order/insert.do"
		method="post">
		<table class="order-form">
			<tr>
				<th>お届け先名</th>
				<td><input type="text" name="recipient_name"
					value="${user.user_name}" required></td>
			</tr>
			<tr>
				<th>連絡先</th>
				<td><input type="text" name="recipient_phone"
					value="${user.user_tel}" required></td>
			</tr>
			<tr>
				<th>配送先</th>
				<td>
					<div class="order-adress">
						<input type="text" name="zipcode" id="zipcode" placeholder="郵便番号"
							readonly>
						<button type="button" onclick="execDaumPostcode()">住所検索</button>
					</div> <input type="text" id="address_base" name="address_base"
					placeholder="基本住所" readonly><input type="text"
					id="address_detail" name="address_detail" placeholder="詳細住所を入力してください"
					required>
				</td>
			</tr>
			<tr>
				<th>配送時のご要望</th>
				<td><input type="text" name="delivery_request"
					placeholder="配送時のご要望を入力してください。"></td>
			</tr>
		</table>

		<h4>お支払い方法</h4>
		<div class="order-bottom">
			<div class="payment-method">
				<label class="payment-item"> <input type="radio"
					name="payment_method" value="CARD" required> <span
					class="payment-title">クレジットカード</span>
				</label> <label class="payment-item"> <input type="radio"
					name="payment_method" value="BANK"> <span
					class="payment-title">銀行振込</span>
				</label> <label class="payment-item "> <input type="radio"
					name="payment_method" value="SIMPLE"> <span
					class="payment-title">簡単決済</span>
				</label>
			</div>

			<div class="price-summary">
				<p>
					商品合計金額 <span><fmt:formatNumber value="${totalPrice}"
							pattern="#,###" />円</span>
				</p>
				<p>
					割引金額 <span>0円</span>
				</p>
				<p>
					送料 <span>無料</span>
				</p>
				<hr>
				
				<p class="final-price">
					お支払い金額&nbsp;<strong><fmt:formatNumber
							value="${totalPrice}" pattern="#,###" />円</strong>
				</p>
			</div>
		</div>
		<!-- 주문 버튼 -->
		<div class="order-btn-area">
			<button type="submit" id="orderBtn" class="btn btn-black">注文する</button>
		</div>

		<!-- hidden 값 -->
		<input type="hidden" name="total_price" value="${totalPrice}">
		<input type="hidden" name="orderType" value="${orderType}">
	</form>

</div>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {

				let addr = ""; // 주소
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress; // 도로명
				} else {
					addr = data.jibunAddress; // 지번
				}

				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address_base").value = addr;
				document.getElementById("address_detail").focus();

			}
		}).open();
	}
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="../include/footer.jsp"%>