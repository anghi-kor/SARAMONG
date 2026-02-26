$("#addCartBtn").on("click", function () {

	if (!isLogin) {
		alert("ログイン後にご利用ください。");
		return;
	}

	if ($(".option-item").length === 0) {
		alert("オプションを選択してください。");
		return;
	}

	let optionArr = [];
	let qtyArr = [];

	$(".option-item").each(function () {
		optionArr.push($(this).data("option-id"));
		qtyArr.push($(this).find(".quantity").val());
	});

	$.ajax({
		url: "/product/cartAdd.do",
		type: "post",
		traditional: true,
		data: { option_id: optionArr, quantity: qtyArr },
		success: function (res) {
			if (res === "success" &&
				confirm("カートに追加しました。カートへ移動しますか？")) {
				location.href = "/cart/cart.do";
			}
		}
	});
});
