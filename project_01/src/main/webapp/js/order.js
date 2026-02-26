$("#orderBtn").click(function (e) {
	if ($("input[name='recipient_name']").val() == "") {
		alert("お受取人名を入力してください。");
		e.preventDefault();
		return;
	}
	if ($("input[name='recipient_phone']").val() == "") {
		alert("連絡先を入力してください。");
		e.preventDefault();
		return;
	}
	if ($("#zipcode").val() == "") {
		alert("配送先を入力してください。");
		e.preventDefault();
		return;
	}
	if ($("#address_detail").val() == "") {
			alert("配送先を入力してください。");
			e.preventDefault();
			return;
		}
	if ($("input[name='payment_method']:checked").length == 0) {
		alert("お支払い方法を選択してください。");
		e.preventDefault();
		return;
	}
});
