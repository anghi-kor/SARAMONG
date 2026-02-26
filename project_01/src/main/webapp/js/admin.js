


//product_update
$(document).ready(function() {

	// 색상 추가
	$(document).on("click", "#addColor", function() {
		$("#colorArea").append(`
					<div class="option-box">
						<input type="text" name="color_name[]" id="pro_color" class="form-control" placeholder="例: Black">
						<span class="remove-btn">削除</span>
					</div>
				`);
	});

	// 사이즈 추가
	$(document).on("click", "#addSize", function() {
		$("#sizeArea").append(`
					<div class="option-box">
						<input type="text" name="size_name[]" id="pro_size" class="form-control" placeholder="例: M">
						<span class="remove-btn">削除</span>
					</div>
				`);
	});

	// 삭제 (이벤트 위임)
	$(document).on("click", ".remove-btn", function() {
		$(this).closest(".option-box").remove();
	});


	// 상품 등록
	$("#prosave-btn").on("click", function(e) {
		e.preventDefault();

		const productName = $("#product_name").val().trim();
		const price = $("#price").val();

		if (!productName || !price) {
			alert("入力内容を確認してください。");
			return;
		}

		// 색상 검사
		let colorValid = true;
		$("input[name='color_name[]']").each(function() {
			if ($(this).val().trim() === "") {
				colorValid = false;
			}
		});

		// 사이즈 검사
		let sizeValid = true;
		$("input[name='size_name[]']").each(function() {
			if ($(this).val().trim() === "") {
				sizeValid = false;
			}
		});

		if (!colorValid || !sizeValid) {
			alert("カラーとサイズを入力してください。");
			return;
		}

		const form = document.getElementById("product-form");
		const formData = new FormData(form);

		$.ajax({
			type: "post",
			url: "/admin/upload.do",
			processData: false,
			contentType: false,
			data: formData,
			dataType: "json",
			success: function(res) {
				if (res.status === "success") {
					alert(res.msg);
					location.href = "/admin/view.do";
				} else {
					alert(res.msg);
				}
			},
			error: function() {
				alert("サーバーエラーが発生しました。");
			}
		});
	});


})

