<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<div class="container order-complete">

	<h2>🎉 ご注文が完了しました 🎉</h2>

	<!-- 주문 정보 -->
	<div class="order-info">
		<p>
			注文番号 : <strong>${order.order_id}</strong>
		</p>
		<p>
			注文日 : <strong>${fn:substring(order.order_date, 0, 10)}</strong>
		</p>
	</div>

	<hr>
	<!-- 주문 상품 목록 추가 -->
	<h3>ご注文商品</h3>
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
					<td><fmt:formatNumber value="${item.subtotal}" pattern="#,###" />円</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr>

	<!-- 배송 정보 -->
	<div class="delivery-info">
		<h3>配送情報</h3>
		<p>お受取人 : ${order.recipient_name}</p>
		<p>連絡先 : ${order.recipient_phone}</p>
		<p>住所 : ${order.zipcode} ${order.address_base}
			${order.address_detail}</p>
		<p>配送時のご要望 : ${order.delivery_request}</p>

	</div>

	<hr>


	<hr>
	<p class="final-price">
		お支払い金額 : <strong> <fmt:formatNumber
				value="${order.total_price}" pattern="#,###" />円
		</strong>
	</p>

	<div class="complete-btns">
		<a href="/" class="btn btn-black">ショッピングを続ける</a> <a
			href="${pageContext.request.contextPath}/order/list.do"
			class="btn btn-white">注文履歴を見る</a>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
