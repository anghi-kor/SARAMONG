$(function () {
	initCartCheckbox(); //체크박스
	initQuantity(); //수량
	initCartOrder(); //주문
})


//체크박스
function initCartCheckbox() {
	//cart 들어갈 시 체크박스 모두체크
	$(".cart-check, #checkAll").prop("checked", true);
	updateCheckedTotalPrice();
	//개별체크
	$(document).on("change", ".cart-check", function() {
		syncCheckAll();
		updateCheckedTotalPrice();
	});
	//모두체크
	$("#checkAll").on("change", function() {
		$(".cart-check").prop("checked", this.checked);
		updateCheckedTotalPrice();
	});
	
}

function syncCheckAll(){
	$("#checkAll").prop(
		"checked",
		$(".cart-check").length === $(".cart-check:checked").length
	);
}

function updateCheckedTotalPrice() {
	
	let total = 0;

	$(".cart-check:checked").each(function() {
		const row = $(this).closest("tr");
		total += Number(row.find(".cart-sum").data("price"))
				*Number(row.find(".qty-input").val());
	});

	$(".cart-total strong").text(total.toLocaleString() + "円");
	
} 
//수량
function initQuantity(){
	$(document).on("click", ".qty-btn", function () {
	    const btn = $(this);
	    const row = btn.closest("tr");
	    const qtyInput = row.find(".qty-input");
		const cartId = row.data("cart-id");
	    let qty = Number(qtyInput.val());
	    qty = btn.hasClass("plus") ? qty + 1 : Math.max(1, qty - 1);

		$.ajax({
			url: contextPath + "/cart/updateQuantity.do",
			type: "post",
			data: {
				cart_id: cartId,
				quantity: qty
			},
			success: function (res) {
				if (res === "success") {
					// 👉 성공 시에만 화면 갱신
					qtyInput.val(qty);
					updateRowPrice(row);
					updateCheckedTotalPrice();
				} else {
					alert("数量の変更に失敗しました。");
				}
			},
			error: function () {
				alert("サーバーエラーが発生しました。");
			}
		});
	});
}

function updateRowPrice(row) {
    const price = Number(row.find(".cart-sum").data("price"));
    const qty = Number(row.find(".qty-input").val());
    row.find(".cart-sum").text((price * qty).toLocaleString() + "円");
}
//주문
function initCartOrder(){
	//체크항목만주문
	$("#cartOrderBtn").on("click", function() {

		const checked = $(".cart-check:checked");

		if (checked.length === 0) {
			alert("注文する商品を選択してください。");
			return;
		}
		// form 만들어서 POST 전송
		const form = document.createElement("form");
		form.method = "post";
		form.action = contextPath + "/order/check.do";

		form.appendChild(createHidden("orderType", "cart"));

		checked.each(function() {
			form.appendChild(createHidden("cart_id", this.value)); // ⭐ cart_id만
		});

		document.body.appendChild(form);
		form.submit();
	});
}
