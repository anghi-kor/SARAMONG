//join js 

// =============================
// 정규식
// =============================
const idReg = /^[a-z0-9]{4,16}$/;
const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*]).{10,16}$/;
const phoneReg = /^01[0-9]{8,9}$/;
const emailReg = /^[0-9a-zA-Z._-]+@[0-9a-zA-Z.-]+\\.[a-zA-Z]{2,}$/;

$(function() {

	$("#user_id").blur(function() {
		const user_id = $("#user_id").val().trim();
		if (!$("#user_id").val()) {
			$(".id-msg").html("<span style='color:red'>ユーザーID：必須項目です</span>");
			$(".id-reg").html("<span style='color:#888'>英小文字・数字、4〜16文字</span>");
			return;
		} else {
			$(".id-msg").html("");
			if (!idReg.test(user_id)) {
				$(".id-reg").html("<span style='color:red'>英小文字・数字、4〜16文字</span>");
				return;
			} else {
				$(".id-reg").html("<span style='color:#888'>英小文字・数字、4〜16文字</span>");
				$.ajax({
					url: "/user/idCheck.do",
					type: "post",
					data: { user_id: $("#user_id").val() },
					success: function(result) {
						if (result.trim() == "1") {
							$(".id-msg").html("<span style='color:red'>このIDは使用できません</span>");
						} else {
							$(".id-msg").html("<span style='color:blue'>使用可能なIDです</span>");
						}
					}
				});
			}
		}
	})//아이디 필수정보,유효성검사, 중복체크(완료)

	$("#user_pw").blur(function() {
		const user_pw = $("#user_pw").val().trim();
		if (!$("#user_pw").val()) {
			$(".pw-msg").html("<span style='color:red'>パスワード：必須項目です</span>");
			$(".pw-reg").html("<span style='color:#888'>英字・数字・記号のうち2種類以上、10〜16文字</span>");
			return;
		} else {
			$(".pw-msg").html("");
			if (!pwReg.test(user_pw)) {
				$(".pw-reg").html("<span style='color:red'>英字・数字・記号のうち2種類以上、10〜16文字</span>");
				return;
			} else {
				$(".pw-msg").html("<span style='color:blue'>使用可能なパスワードです</span>");
				$(".pw-reg").html("<span style='color:#888'>英字・数字・記号のうち2種類以上、10〜16文字</span>");
			}
		}
	})//비밀번호 필수정보,유효성 검사

	$("#user_pwok").blur(function() {
		let pw = $("#user_pw").val();
		let pwok = $("#user_pwok").val();
		if (!$("#user_pwok").val()) {
			$(".pwok-msg").html("<span style='color:red'>パスワード確認：必須項目です</span>");
			return;
		} else {
			$(".pwok-msg").html("");
			if (pw != pwok) {
				$(".pwok-msg").html("<span style='color:red'>パスワードが一致しません</span>");
				return;
			} else {
				$(".pwok-msg").html("");

			}
		}
	})//비밀번호 필수요소

	// =============================
	// 폼 전체 검사 (submit)
	// =============================
	$(".join-submit").click(function(e) {

		let isValid = true;

		// 아이디
		const user_id = $("#user_id").val().trim();
		if (!user_id || !idReg.test(user_id)) {
			$(".id-msg").html("<span style='color:red'>ユーザーIDを確認してください</span>");
			isValid = false;
		}

		// 비밀번호
		const user_pw = $("#user_pw").val().trim();
		if (!user_pw || !pwReg.test(user_pw)) {
			$(".pw-msg").html("<span style='color:red'>パスワードを確認してください</span>");
			isValid = false;
		}

		// 비밀번호 확인
		const pw = $("#user_pw").val();
		const pwok = $("#user_pwok").val();
		if (!pwok || pw !== pwok) {
			$(".pwok-msg").html("<span style='color:red'>パスワードが一致しません</span>");
			isValid = false;
		}
		// 이름 확인
		const name = $("#user_name").val().trim();
		if(!name){
			$(".name-msg").html("<span style='color:red'>お名前を入力してください</span>");
			isValid = false;
		}
		// 전화번호
		const tel2 = $("#user_tel2").val().trim();
		const tel3 = $("#user_tel3").val().trim();
		if (!tel2 || !tel3) {
			$(".tel-msg").html("<span style='color:red'>電話番号を入力してください</span>");
			isValid = false;
		}
		// 이메일
		const email = $("#user_email").val().trim();
		if(!email){
			$(".email-msg").html("<span style='color:red'>e-mailを入力してください</span>");
						isValid = false;
		}
		// 하나라도 문제 있으면 submit 막기
		if (!isValid) {
			e.preventDefault();
			alert("入力内容をご確認ください。");
			return;
		}

		$.ajax({
			type: "post",
			url: "/user/joinSubmit.do",
			data: $("#join-form").serialize(),
			success: function(result) {
				if (result === "1") {
					alert("会員登録が完了しました。");
					location.href = "/user/login.do";
				} else {
					alert("エラーが発生しました。");
				}
			}
		})
	});

	//tel 자동포커스
	$("#user_tel1").change(function() {
		$("#user_tel2").focus();
	});
	$("#user_tel2").on("input", function() {
		if ($(this).val().length === 4) {
			$("#user_tel3").focus();
		}
	});
	$(".join-tel").on("input", function() {
		this.value = this.value.replace(/[^0-9]/g, "");
	});

	// login (엔터 가능)
	$("#loginForm").on("submit", function (e) {
		e.preventDefault(); // 기본 submit 막기

		let user_id = $("#user_id").val().trim();
		let user_pw = $("#user_pw").val().trim();

		if (!user_id) {
			alert("ユーザーIDは必須項目です。");
			$("#user_id").focus();
			return;
		}
		if (!user_pw) {
			alert("パスワードは必須項目です。");
			$("#user_pw").focus();
			return;
		}

		$.ajax({
			type: "post",
			url: contextPath + "/user/loginok.do",
			data: { user_id, user_pw },
			success: function (res) {
				res = res.trim();
				console.log("LOGIN RESPONSE =", res);

				if (res === "ADMIN") {
					location.href = contextPath + "/admin/main.do";
				} else if (res === "USER") {
					location.href = contextPath + "/";
				} else {
					alert("ユーザーIDまたはパスワードが正しくありません。");
					$("#user_id").val("");
					$("#user_pw").val("");
					$("#user_id").focus();
				}
			}
		});
	});











})//$(function)