<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp"%>

<div class="container admin-container mt-5">
	<h3 class="admin-title">オプション在庫管理</h3>

	<form action="${pageContext.request.contextPath}/admin/stockUpdate.do"
		method="post">
		<input type="hidden" name="product_id" value="${product.product_id}">

		<table class="table admin-stock-table">
			<tr>
				<th>カラー</th>
				<th>サイズ</th>
				<th>在庫数</th>
			</tr>

			<c:forEach var="o" items="${optionList}">
				<tr>
					<td><span class="stock-color">${o.color_name}</span></td>
					<td><span class="stock-size">${o.size_name}</span></td>

					<td><input type="number" name="stock_${o.option_id}"
						value="${o.stock}" min="0" class="form-control admin-stock-input"
						style="width: 120px"></td>
				</tr>
			</c:forEach>
		</table>

		<div class="stock-btn-area">
			<button class="btn btn-admin-submit">保存</button>
			<a href="${pageContext.request.contextPath}/admin/view.do"
				class="btn btn-secondary ms-2">一覧へ戻る</a>
		</div>
	</form>
</div>

<%@ include file="../include/adminFooter.jsp"%>
