<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="views/include/header.jsp"%>

<div id="main-page">

	<!-- ================= 메인 상단 캐러셀 ================= -->
	<div class="main-carousel mb-5">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/images/main_carousel1.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/images/main_carousel2.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="/images/main_carousel3.jpg" class="d-block w-100">
				</div>
			</div>

			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>

	<!-- ================= NEW PRODUCT ================= -->
	<div class="container my-5 list">
		<h4 class="text-center mb-2">NEW</h4>
		<c:if test="${not empty newList}">

			<!-- ================= 3개 이하 ================= -->
			<c:if test="${newList.size() <= 3}">
				<div class="row">
					<c:forEach var="p" items="${newList}">
						<div class="col-md-4 text-center">
							<a
								href="${pageContext.request.contextPath}/product/detail.do?product_id=${p.product_id}">
								<img
								src="${pageContext.request.contextPath}/upload/product/main/${p.main_image}"
								class="img-fluid mb-3">
								<p class="mb-1">${p.product_name}</p> <strong> <fmt:formatNumber
										value="${p.price}" pattern="#,###" />원
							</strong>
							</a>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<!-- ================= 4개 이상 (캐러셀) ================= -->
			<c:if test="${newList.size() > 3}">
				<div id="newCarousel" class="carousel slide" data-ride="carousel"
					data-interval="false">
					<div class="carousel-inner">

						<c:forEach var="i" begin="0" end="${newList.size()-1}" step="3"
							varStatus="st">
							<div class="carousel-item ${st.first ? 'active' : ''}">
								<div class="row">

									<c:forEach var="j" begin="${i}" end="${i+2}">
										<c:if test="${j < newList.size()}">
											<c:set var="p" value="${newList[j]}" />
											<div class="col-md-4 text-center">
												<a
													href="${pageContext.request.contextPath}/product/detail.do?product_id=${p.product_id}">
													<img
													src="${pageContext.request.contextPath}/upload/product/main/${p.main_image}"
													class="img-fluid mb-3">
													<p class="mb-1">${p.product_name}</p> <strong> <fmt:formatNumber
															value="${p.price}" pattern="#,###" />원
												</strong>
												</a>
											</div>
										</c:if>
									</c:forEach>

								</div>
							</div>
						</c:forEach>

					</div>

					<!-- controls -->
					<a class="carousel-control-prev" href="#newCarousel" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#newCarousel" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</c:if>

		</c:if>
	</div>


	<!-- ================= BEST PRODUCT ================= -->
	<div class="container my-5 list">
		<h4 class="text-center mb-2">BEST</h4>

		<c:if test="${not empty bestList}">

			<!-- ================= 3개 이하 ================= -->
			<c:if test="${bestList.size() <= 3}">
				<div class="row">
					<c:forEach var="p" items="${bestList}">
						<div class="col-md-4 text-center">
							<a
								href="${pageContext.request.contextPath}/product/detail.do?product_id=${p.product_id}">
								<img
								src="${pageContext.request.contextPath}/upload/product/main/${p.main_image}"
								class="img-fluid mb-3">
								<p class="mb-1">${p.product_name}</p> <strong> <fmt:formatNumber
										value="${p.price}" pattern="#,###" />원
							</strong>
							</a>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<!-- ================= 4개 이상 (캐러셀) ================= -->
			<c:if test="${bestList.size() > 3}">
				<div id="bestCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">

						<c:forEach var="i" begin="0" end="${bestList.size()-1}" step="3"
							varStatus="st">
							<div class="carousel-item ${st.first ? 'active' : ''}">
								<div class="row">

									<c:forEach var="j" begin="${i}" end="${i+2}">
										<c:if test="${j < bestList.size()}">
											<c:set var="p" value="${bestList[j]}" />
											<div class="col-md-4 text-center">
												<a
													href="${pageContext.request.contextPath}/product/detail.do?product_id=${p.product_id}">
													<img
													src="${pageContext.request.contextPath}/upload/product/main/${p.main_image}"
													class="img-fluid mb-3">
													<p class="mb-1">${p.product_name}</p> <strong> <fmt:formatNumber
															value="${p.price}" pattern="#,###" />원
												</strong>
												</a>
											</div>
										</c:if>
									</c:forEach>

								</div>
							</div>
						</c:forEach>

					</div>

					<!-- controls -->
					<a class="carousel-control-prev" href="#bestCarousel" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#bestCarousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</c:if>

		</c:if>
	</div>


</div>

<%@ include file="views/include/footer.jsp"%>
