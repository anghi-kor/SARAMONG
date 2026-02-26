$("#buyNowBtn").on("click", function () {

	if (!isLogin) {
		alert("ログイン後にご利用ください。");
		location.href = "/user/login.do";
		return;
	}

	if ($(".option-item").length === 0) {
		alert("オプションを選択してください。");
		return;
	}

	const items = [];
	let imgSrc = $(".detail-img").attr("src");
	let fileName = imgSrc.substring(imgSrc.lastIndexOf("/") + 1);
	
	$(".option-item").each(function () {
		items.push({
			product_id,
			option_id: $(this).data("option-id"),
			product_name: $(".detail-name").text().trim(),
			main_image: fileName,
			color_id: $(this).data("color-id"),
			size_id: $(this).data("size-id"),
			color_name: $(this).data("color-name"),
			size_name: $(this).data("size-name"),
			quantity: $(this).find(".quantity").val(),
			unit_price: unitPrice
		});
	});

	submitDirectOrder(items);
	
});
function submitDirectOrder(items) {

	const form = document.createElement("form");
	form.method = "post";
	form.action = contextPath + "/order/check.do";

	// 주문 타입
	form.appendChild(createHidden("orderType", "direct"));

	items.forEach((item, i) => {
		form.appendChild(createHidden(`items[${i}].product_id`, item.product_id));
		form.appendChild(createHidden(`items[${i}].option_id`, item.option_id));
		form.appendChild(createHidden(`items[${i}].main_image`, item.main_image));
		form.appendChild(createHidden(`items[${i}].product_name`, item.product_name));
		form.appendChild(createHidden(`items[${i}].color_id`, item.color_id));
		form.appendChild(createHidden(`items[${i}].size_id`, item.size_id));
		form.appendChild(createHidden(`items[${i}].color_name`, item.color_name));
		form.appendChild(createHidden(`items[${i}].size_name`, item.size_name));
		form.appendChild(createHidden(`items[${i}].quantity`, item.quantity));
		form.appendChild(createHidden(`items[${i}].unit_price`, item.unit_price));
	});

	document.body.appendChild(form);
	form.submit();
}



