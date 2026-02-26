<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp"%>

<div class="container admin-container mt-5">
	<h3 class="admin-title">商品登録</h3>

	<form id="product-form" enctype="multipart/form-data">
		<table class="admin-form-table">
			<tr>
				<th>商品名</th>
				<td><input type="text" name="product_name" id="product_name"
					class="form-control" placeholder="商品名を入力してください"></td>
			</tr>

			<tr>
				<th>カテゴリー</th>
				<td><select name="category_id" id="category_id"
					class="form-select">
						<option value="1">OUTER</option>
						<option value="2">TOP</option>
						<option value="3">DRESS</option>
						<option value="4">ACC</option>
				</select></td>
			</tr>
			<tr>
				<th>商品説明</th>
				<td><textarea name="description" id="description" class="form-control"
						rows="3" placeholder="商品の簡単な説明を入力してください（管理者用／詳細要約）"></textarea>
				</td>
			</tr>
			<tr>
				<th>価格</th>
				<td><input type="number" name="price" id="price"
					class="form-control" placeholder="定価"></td>
			</tr>

			<tr>
				<th>割引価格</th>
				<td><input type="number" name="discount_price"
					id="discount_price" class="form-control" placeholder="割引価格（ない場合は0">
				</td>
			</tr>

			<tr>
				<th>メイン画像</th>
				<td><input type="file" name="main_image" id="main_image"
					class="form-control"></td>
			</tr>

			<tr>
				<th>サブ画像</th>
				<td><input type="file" name="sub_image" id="sub_image"
					class="form-control" multiple></td>
			</tr>

			<tr>
				<th>商品ステータス</th>
				<td class="admin-check"><label> <input type="checkbox"
						name="is_best" value="Y"> BEST
				</label> <label> <input type="checkbox" name="is_new" value="Y">
						NEW
				</label></td>
			</tr>

			<tr>
				<th>カラーオプション</th>
				<td>
					<div id="colorArea">
						<div class="option-box">
							<input type="text" name="color_name[]" id="pro_color"
								class="form-control"> <span class="remove-btn">削除</span>
						</div>
					</div>

					<button type="button" id="addColor"
						class="btn btn-outline-secondary btn-sm">＋ カラー追加</button>
				</td>
			</tr>

			<tr>
				<th>サイズオプション</th>
				<td>
					<div id="sizeArea">
						<div class="option-box">
							<input type="text" name="size_name[]" id="pro_size"
								class="form-control"> <span class="remove-btn">削除</span>
						</div>
					</div>

					<button type="button" id="addSize"
						class="btn btn-outline-secondary btn-sm">＋ サイズ追加</button>
				</td>

			</tr>

			<tr>
				<td colspan="2" class="text-center">
					<button type="button" id="prosave-btn" class="btn btn-admin-submit">
						商品登録</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../include/adminFooter.jsp"%>
