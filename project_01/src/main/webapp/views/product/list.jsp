<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div id="list-page">
	<div class="container-fluid">
		<div class="container">
		    <h2 class="list-top">
		    	<c:choose>
		    	<c:when test="${type == 'new'}">
		    		<c:out value="${category_name != null ? category_name : '' }"/> NEW
		    	</c:when>
		    	<c:when test="${type == 'best'}">
		    		<c:out value="${category_name != null ? category_name : '' }"/> BEST
		    	</c:when>
		    	<c:otherwise>
		    		 <c:out value="${fn:toUpperCase(category_name) != null ? fn:toUpperCase(category_name) : ''}"/>
		    	</c:otherwise>
		    	</c:choose>
		    </h2>
			<div class="row">
				<c:forEach var="p" items="${list}">
					<div class="col-md-3">
						<a href="/product/detail.do?product_id=${p.product_id }" class="list-link">
							<div class="list-card">
								<img src="${pageContext.request.contextPath }/upload/product/main/${p.main_image }" class="list-img" alr="${p.product_name }">
								<p class="list-name">${p.product_name }</p>
								<p class="list-price">
									<fmt:formatNumber value="${p.price }" pattern="#,###" ></fmt:formatNumber>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>