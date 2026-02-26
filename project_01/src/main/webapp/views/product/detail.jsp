<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div id="detail-page">
	<div class="container-fluid container">
		<!-- 상품 상단 정보 -->
		<div class="row detail-top">
			<div class="col-md-6 detail-left">
				<img
					src="${pageContext.request.contextPath}/upload/product/main/${product.main_image}"
					class="detail-img">
			</div>

			<div class="col-md-6 detail-right">
				<p class="detail-name">${product.product_name}</p>

				<p class="detail-price">
					<fmt:formatNumber value="${product.price}" pattern="#,###" />
					円
				</p>
				<c:set var="newline" value=" " />
				<div class="detail-desc">
					<c:choose>
						<c:when test="${not empty product.description}">
						${fn:replace(product.description, newline, '<br/>')}
						</c:when>
						<c:otherwise>
							商品説明がありません。
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 옵션 선택 -->
				<div class="prdOption">
					<!-- COLOR -->
					<div class="option-row">
						<p class="option-title">COLOR</p>
						<ul id="color-options">
							<c:forEach var="c" items="${colorList}">
								<li class="color-chip color-${fn:toLowerCase(c.color_name)}"
									data-id="${c.color_id}" data-name="${c.color_name}"
									title="${c.color_name}"></li>

							</c:forEach>
						</ul>
					</div>

					<!-- SIZE -->
					<div class="option-row">
						<p class="option-title">SIZE</p>
						<ul id="size-options" class="size-button">
							<c:forEach var="s" items="${sizeList}">
								<li class="size-chip disabled" data-size-id="${s.size_id}"
									data-size-name="${s.size_name}">${s.size_name}</li>
							</c:forEach>

						</ul>
					</div>


					<input type="hidden" id="selectedColor"> <input
						type="hidden" id="selectedSize">
				</div>

				<!-- 옵션 결과 박스 -->
				<div id="selected-option-box" class="option-result displaynone">
					<div id="total-price-box" class="total-price displaynone">
						<span>商品合計金額</span> <strong> <span id="total-price">0</span>円
						</strong>
					</div>
				</div>


				<div class="detail-btns">
					<button type="button" id="buyNowBtn" class="detail-buy">BUY
						IT NOW</button>
					<button type="button" id="addCartBtn" class="detail-cart">ADD
						TO CART</button>
				</div>
			</div>
		</div>

		<!-- 탭 메뉴 -->
		<ul class="scroll-tab">
			<li data-target="section-info" class="active">商品詳細</li>
			<li data-target="section-guide">購入案内</li>
			<li data-target="section-review">レビュー</li>
			<li data-target="section-qna">Q&amp;A</li>
		</ul>

		<!-- 전체 내용이 아래에 계속 이어짐 -->

		<!-- 상세정보 -->
		<section id="section-info" class="detail-section">
			<c:forEach var="i" items="${product.subImageList }">
				<img
					src="${pageContext.request.contextPath }/upload/product/sub/${i}"
					class="w-100 mb-4">
			</c:forEach>
		</section>

		<!-- 구매 안내 -->
		<section id="section-guide" class="detail-section">
			<div class="purchase-info">

				<div class="info-row">
					<div class="info-box">
						<h4>PAYMENT INFO</h4>
						<p>
							安全な決済のため、カード会社より確認のお電話を差し上げる場合があります。<br>
							不正利用の疑いがある場合、注文を保留またはキャンセルすることがあります。<br><br>
							銀行振込は、インターネットバンキング・ATM・窓口よりお支払いください。<br>
							ご注文者名と振込名義が一致しない場合、確認が遅れることがあります。<br>
							7日以内にご入金が確認できない場合、注文は自動キャンセルとなります。
						</p>
					</div>

					<div class="info-box">
						<h4>DELIVERY INFO</h4>
						<p>
							配送方法：宅配便<br>
							配送地域：全国<br>
							送料：3,000円<br>
							配送期間：3～7営業日<br>
							13時までのご入金確認で、当日より順次発送いたします。<br>
							離島・一部地域は追加送料がかかる場合があります。
						</p>
					</div>
				</div>

				<div class="info-row">
					<div class="info-box">
						<h4>EXCHANGE INFO</h4>
						<p>
							<strong>交換・返品先</strong><br>
							カスタマーセンター受付後、自動回収となります。<br><br>

							<strong>対応可能な場合</strong><br>
							商品到着後7日以内<br>
							初期不良・誤配送の場合<br><br>

							<strong>対応不可の場合</strong><br>
							お客様都合による破損<br>
							着用済み・洗濯済みの商品
						</p>
					</div>

					<div class="info-box">
						<h4>SERVICE INFO</h4>
						<p>
							カスタマーセンター：1800-0000<br>
							受付時間：平日 10:00～17:00<br>
							昼休み：12:00～13:00<br>
							土日祝日は休業
						</p>
					</div>
				</div>

			</div>
		</section>


		<!-- 리뷰 -->
		<section id="section-review" class="detail-section">
			<div
				class="review-header d-flex justify-content-between align-items-center mb-4">
				<h3>Review</h3>
				<button class="btn btn-dark" onclick="openReviewWrite()">レビューを書く</button>
			</div>
			<!-- 리뷰 리스트 -->
			<div class="review-list">

				<c:choose>
					<c:when test="${empty replyList}">
						<div class="text-center text-muted py-5">レビューはまだありません。</div>
					</c:when>

					<c:otherwise>
						<c:forEach var="r" items="${replyList}">
							<div class="review-item p-4 border rounded mb-3">
								<div class="d-flex justify-content-between mb-2">
									<strong>${r.user_id}</strong> <span class="text-muted">${r.regdate}</span>
								</div>

								<p id="content-${r.reply_id}">${r.reply_content}</p>

								<c:if
									test="${not empty sessionScope.loginUser 
					             and sessionScope.loginUser.user_id eq r.user_id}">
									<div class="review-update">
										<button class="btn btn-dark"
											onclick="openeditReply(${r.reply_id})">編集</button>
										<button class="btn btn-dark"
											onclick="deleteReply(${r.reply_id})">削除</button>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>



			<!-- 페이징 -->
			<!-- 		<nav class="mt-4">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link">이전</a></li>
					<li class="page-item active"><a class="page-link">1</a></li>
					<li class="page-item"><a class="page-link">2</a></li>
					<li class="page-item"><a class="page-link">3</a></li>
					<li class="page-item"><a class="page-link">다음</a></li>
				</ul>
			</nav> !-->
		</section>

		<!-- 리뷰 작성 모달 -->
		<c:if test="${not empty sessionScope.loginUser }">
			<div class="modal fade" id="reviewModal">
				<div class="modal-dialog">
					<div class="modal-content p-3">
						<h4 class="mb-3">レビュー作成</h4>
						<form id="reviewForm">
							<!-- 상품번호 -->
							<input type="hidden" name="product_id"
								value="${product.product_id}">
							<!-- 작성자 -->
							<input type="hidden" name="user_id"
								value="${sessionScope.loginUser.user_id}"> <label>投稿者</label>
							<input type="text" id="user_reply"
								value="${sessionScope.loginUser.user_id }"
								class="form-control mb-3" readonly>
							<!-- 내용 -->
							<label>レビュー内容</label>
							<textarea name="reply_content" class="form-control mb-3"
								id="reviewContent" rows="4"></textarea>
							<button type="button" class="btn btn-dark w-100"
								onclick="submitReview()">投稿する</button>
						</form>
					</div>
				</div>
			</div>
		</c:if>


		<!-- Q&A -->
		<section id="section-qna" class="detail-section">
			<h3>Q&amp;A</h3>
			<p>商品に関するご質問はこちらへ。</p>
		</section>


	</div>
</div>
<script>
    var isLogin = ${not empty sessionScope.loginUser};
    const product_id = ${product.product_id};
    const product_name ="${product.product_name}";
    const loginUserId = '${sessionScope.loginUser.user_id}';
    const unitPrice = Number(
            '${product.discount_price > 0 ? product.discount_price : product.price}'
        );
    const optionData = [
        	<c:forEach var="o" items="${optionList}">
        	{
        	  optionId: ${o.option_id},
        	  colorId: ${o.color_id},
        	  colorName: '${o.color_name}',
        	  sizeId: ${o.size_id},
        	  sizeName: '${o.size_name}',
        	  stock: ${o.stock}
        	},
        	</c:forEach>
        	];
</script>


<%@ include file="../include/footer.jsp"%>