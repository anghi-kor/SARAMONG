<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp"%>

<div class="container admin-container mt-5">
	<h3 class="admin-title">商品修正</h3>

	<form action="${pageContext.request.contextPath}/admin/update.do"
		method="post" enctype="multipart/form-data">

		<input type="hidden" name="product_id" value="${product.product_id}">

		<table class="admin-form-table">

			<tr>
				<th>商品名</th>
				<td><input type="text" name="product_name" class="form-control"
					value="${product.product_name}"></td>
			</tr>
			<tr>
				<th>カテゴリー</th>
				<td><select name="category_id" class="form-select">
						<option value="1"
							<c:if test="${product.category_id == 1}">selected</c:if>>OUTER</option>
						<option value="2"
							<c:if test="${product.category_id == 2}">selected</c:if>>TOP</option>
						<option value="3"
							<c:if test="${product.category_id == 3}">selected</c:if>>DRESS</option>
						<option value="4"
							<c:if test="${product.category_id == 4}">selected</c:if>>ACC</option>
				</select></td>
			</tr>

			<tr>
				<th>商品説明</th>
				<td><textarea name="explain" class="form-control" rows="4">${product.description}</textarea></td>
			</tr>

			<tr>
				<th>メイン画像</th>
				<td><input type="file" name="main_image"> <input
					type="hidden" name="old_main_image" value="${product.main_image}"
					multiple>
					<div class="mt-1 text-muted">現在のファイル: ${product.main_image}</div></td>
			</tr>

			<tr>
				<th>サブ画像</th>
				<td><input type="file" name="sub_image"> <input
					type="hidden" name="old_sub_image" value="${product.sub_image}"
					multiple>
					<div class="mt-1 text-muted">現在のファイル: ${product.sub_image}</div></td>
			</tr>
			<tr>
				<th>商品ステータス</th>
				<td class="admin-check"><label> <input type="checkbox"
						name="is_best" value="Y"
						<c:if test="${product.is_best eq 'Y'}">checked</c:if>>
						BEST
				</label> <label class="ms-3"> <input type="checkbox" name="is_new"
						value="Y" <c:if test="${product.is_new eq 'Y'}">checked</c:if>>
						NEW
				</label></td>
			</tr>

			<tr>
				<th>価格</th>
				<td><input type="number" name="price" class="form-control"
					value="${product.price}"></td>
			</tr>

			<tr>
				<th>割引価格</th>
				<td><input type="number" name="discount_price"
					class="form-control" value="${product.discount_price}"></td>
			</tr>

			<!-- 색상 -->
			<tr>
				<th>カラーオプション</th>
				<td>
					<div id="colorArea">
						<c:forEach var="c" items="${product.colorList}">
							<div class="option-box">
								<input type="text" name="color_name[]" class="form-control"
									value="${c.color_name}"> <span class="remove-btn">削除</span>
							</div>
						</c:forEach>
					</div>
					<button type="button" id="addColor"
						class="btn btn-outline-secondary btn-sm mt-2">+ カラー追加</button>
				</td>
			</tr>

			<!-- 사이즈 -->
			<tr>
				<th>サイズオプション</th>
				<td>
					<div id="sizeArea">
						<c:forEach var="s" items="${product.sizeList}">
							<div class="option-box">
								<input type="text" name="size_name[]" class="form-control"
									value="${s.size_name}"> <span class="remove-btn">削除</span>
							</div>
						</c:forEach>
					</div>
					<button type="button" id="addSize"
						class="btn btn-outline-secondary btn-sm mt-2">+ サイズ追加</button>
				</td>
			</tr>

			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-admin-submit">修正完了</button> <a
					href="${pageContext.request.contextPath}/admin/view.do"
					class="btn btn-secondary ms-2">キャンセル</a>
				</td>
			</tr>

		</table>
	</form>
</div>

<%@ include file="../include/adminFooter.jsp"%>
