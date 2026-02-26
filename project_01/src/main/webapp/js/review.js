//초기 로드
$(function() {
	if (typeof product_id !== "undefined") {
		loadReviewList(product_id);
	}
});

//모달
function openReviewWrite() {
	if (!isLogin) {
		alert('ログイン後にご利用ください。');
		return;
	}
	$('#reviewModal').modal('show');
}

//리뷰등록
function submitReview() {

	const replyContent = $("textarea[name=reply_content]").val().trim();

	if (!replyContent) {
		alert('レビュー内容を入力してください。');
		return;
	}


	$.ajax({
		url: '/product/replyInsert.do',
		type: 'post',
		data: {
			product_id: $("input[name=product_id]").val(),
			user_id: $("input[name=user_id]").val(),
			reply_content: replyContent
		},
		success: function(res) {
			if (res == "success") {
				$("textarea[name=reply_content]").val("");
				$('#reviewModal').modal('hide');
				loadReviewList(product_id);
			} else {
				alert('レビューの投稿に失敗しました。もう一度お試しください。');
			}
		}
	})
}

//review list update
function loadReviewList(pid) {

	const targetPid = pid || product_id;

	$.ajax({
		url: '/product/replyList.do',
		type: 'post',
		data: {
			product_id: targetPid
		},
		dataType: "json",
		success: function(list) {
			if (list.length === 0) {
				$(".review-list").html(`
			        <div class="text-center text-muted py-5">
			              レビューはまだありません。
			            </div>
			        `);
				return;
			}

			let html = "";
			$.each(list, function(_, r) {
				html += renderReviewItem(r);
			});

			$(".review-list").html(html);
		}
	});
}

function renderReviewItem(r) {
	let btnHtml = "";

	if (loginUserId && loginUserId === r.user_id) {
		btnHtml = `
            <button class="btn btn-sm btn-dark" onclick="openEditReply(${r.reply_id})">編集</button>
            <button class="btn btn-sm btn-secondary" onclick="deleteReply(${r.reply_id})">削除</button>
        `;
	}

	return `
        <div class="review-item p-4 border rounded mb-3">
            <div class="d-flex justify-content-between mb-2">
                <strong>${r.user_id}</strong>
                <span class="text-muted">${r.regdate}</span>
            </div>
            <p id="content-${r.reply_id}">${r.reply_content}</p>
            <div class="review-update">${btnHtml}</div>
        </div>
    `;
}

//review update
function openeditReply(reply_id) {
	const contentEl = $("#content-" + reply_id);
	const oldText = contentEl.text();

	contentEl.html(`
        <textarea class="form-control mb-2" id="edit-${reply_id}">${oldText}</textarea>
        <button class="btn btn-sm btn-dark" onclick="updateReply(${reply_id})">保存</button>
        <button class="btn btn-sm btn-secondary" onclick="loadReviewList()">キャンセル</button>
    `);
}
function updateReply(reply_id) {
	$.ajax({
		url: "/product/replyUpdate.do",
		type: "post",
		data: {
			reply_id: reply_id,
			reply_content: $("#edit-" + reply_id).val(),
			user_id: loginUserId
		},
		success: function(res) {
			if (res.trim() === "success") {
				loadReviewList();
			} else {
				alert("編集に失敗しました。");
			}
		}
	});
}

//review delete	        
function deleteReply(reply_id) {
	if (!confirm("レビューを削除しますか？")) return;

	$.ajax({
		url: "/product/replyDelete.do",
		type: "post",
		data: { reply_id: reply_id },
		success: function(res) {
			if (res === "success") {
				alert("削除しました。");
				loadReviewList();
			} else {
				alert("削除に失敗しました。");
			}
		}
	});
}