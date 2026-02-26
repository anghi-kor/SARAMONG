<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp"%>


<div class="container mt-5 admin-container">
	<h3 class="admin-title">商品管理</h3>

	<table class="table table-hover text-center admin-table">
		<thead>
			<tr>
				<th>商品番号</th>
				<th>画像</th>
				<th>商品名</th>
				<th>価格</th>
				<th>オプション在庫</th>
				<th>カラー</th>
				<th>サイズ</th>
				<th>BEST</th>
				<th>NEW</th>
				<th>管理</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach var="p" items="${productList}">
				<tr>
					<td>${p.product_id}</td>

					<td><img
						src="${pageContext.request.contextPath}/upload/product/main/${p.main_image}"
						class="admin-thumb"></td>

					<td>${p.product_name}</td>

					<td><c:if test="${p.discount_price != 0}">
							<div class="price-origin">
								<del>
									<fmt:formatNumber value="${p.price}" pattern="#,###" />
								</del>
							</div>
							<div class="price-discount">
								<fmt:formatNumber value="${p.discount_price}" pattern="#,###" />
							</div>
						</c:if> <c:if test="${p.discount_price == 0}">
							<fmt:formatNumber value="${p.price}" pattern="#,###" />
						</c:if></td>

					<td><a
						href="${pageContext.request.contextPath}/admin/stock.do?product_id=${p.product_id}">在庫管理</a>
					</td>
					<!-- 색상 -->
					<td><c:forEach var="c" items="${p.colorList}">
							<span class="badge badge-color">${c.color_name}</span>
						</c:forEach></td>

					<!-- 사이즈 -->
					<td><c:forEach var="s" items="${p.sizeList}">
							<span class="badge badge-size">${s.size_name}</span>
						</c:forEach></td>

					<td><c:if test="${p.is_best eq 'Y'}">
							<span class="check-yes">✔</span>
						</c:if></td>

					<td><c:if test="${p.is_new eq 'Y'}">
							<span class="check-yes">✔</span>
						</c:if></td>

					<td><a
						href="${pageContext.request.contextPath}/admin/edit.do?product_id=${p.product_id}"
						class="btn btn-sm btn-admin-edit">編集</a> <a
						href="${pageContext.request.contextPath}/admin/delete.do?product_id=${p.product_id}"
						class="btn btn-sm btn-admin-delete"
						onclick="return confirm('削除しますか？');"> 削除 </a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>





<%@ include file="../include/adminFooter.jsp"%>