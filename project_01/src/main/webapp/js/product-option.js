$(function () {

	let selectedColorId = null;
	let selectedSizeId = null;
	let selectedOptionId = null;
	let selectedColorName = null;
	let selectedSizeName = null;

	let optionList = []; // 중복 방지

	/* ========= 옵션 추가 ========= */
	function addOption() {
		if (!selectedOptionId) return;
		if (optionList.includes(selectedOptionId)) return;

		optionList.push(selectedOptionId);

		const html = `
		<div class="option-item"
			data-option-id="${selectedOptionId}"
			data-color-id="${selectedColorId}"
			data-size-id="${selectedSizeId}"
			data-color-name="${selectedColorName}"
			data-size-name="${selectedSizeName}">
			
			<div class="option-info">
				<p class="product-name">${$(".detail-name").text()}</p>
				<p class="option-name">${selectedColorName} / ${selectedSizeName}</p>
			</div>

			<div class="option-control">
				<div class="qty-box">
					<button type="button" class="qty-btn-p minus">−</button>
					<input type="text" class="quantity" value="1" readonly>
					<button type="button" class="qty-btn-p plus">+</button>
				</div>
				<p class="option-price">
					<span class="price">${unitPrice.toLocaleString()}</span>원
				</p>
				<button type="button" class="option-delete">✕</button>
			</div>
		</div>`;

		$("#selected-option-box")
			.append(html)
			.removeClass("displaynone");

		resetSelect();
		updateTotalPrice();
	}

	/* ========= 컬러 ========= */
	$("#color-options").on("click", "li", function () {
		$("#color-options li").removeClass("active");
		$(this).addClass("active");

		selectedColorId = $(this).data("id");
		selectedColorName = $(this).data("name");

		$("#size-options li").each(function () {
			const sizeId = $(this).data("size-id");
			const enable = optionData.some(o =>
				o.colorId === selectedColorId &&
				o.sizeId === sizeId &&
				o.stock > 0
			);
			$(this).toggleClass("disabled", !enable).removeClass("active");
		});
	});

	/* ========= 사이즈 ========= */
	$("#size-options").on("click", "li", function () {
		if ($(this).hasClass("disabled")) return;

		$("#size-options li").removeClass("active");
		$(this).addClass("active");

		selectedSizeId = $(this).data("size-id");
		selectedSizeName = $(this).data("size-name");

		const option = optionData.find(o =>
			o.colorId === selectedColorId &&
			o.sizeId === selectedSizeId
		);

		if (!option || option.stock <= 0) {
			alert("選択できないオプションです。");
			return;
		}

		selectedOptionId = option.optionId;
		addOption();
	});

	/* ========= 수량 ========= */
	$("#selected-option-box").on("click", ".qty-btn-p", function () {
		const item = $(this).closest(".option-item");
		const qtyInput = item.find(".quantity");
		let qty = Number(qtyInput.val());

		qty = $(this).hasClass("plus") ? qty + 1 : Math.max(1, qty - 1);
		qtyInput.val(qty);

		item.find(".price").text((unitPrice * qty).toLocaleString());
		updateTotalPrice();
	});

	/* ========= 삭제 ========= */
	$("#selected-option-box").on("click", ".option-delete", function () {
		const item = $(this).closest(".option-item");
		const optionId = item.data("option-id");

		optionList = optionList.filter(id => id !== optionId);
		item.remove();

		updateTotalPrice();
		if ($(".option-item").length === 0) {
			$("#selected-option-box").addClass("displaynone");
		}
	});

	function resetSelect() {
		selectedColorId = selectedSizeId = selectedOptionId = null;
		$("#color-options li").removeClass("active");
		$("#size-options li").removeClass("active").addClass("disabled");
	}

	function updateTotalPrice() {
		let total = 0;
		$(".option-item").each(function () {
			total += unitPrice * Number($(this).find(".quantity").val());
		});
		$("#total-price").text(total.toLocaleString());
		$("#total-price-box").toggleClass("displaynone", total === 0);
	}

});
