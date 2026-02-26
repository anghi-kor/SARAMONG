	
$(function() {
		//상단 
		$(".hd-community > li").hover(function() {
			$(this).children(".hdgnb-2depth").stop().slideDown();
		}, function() {
			$(".hdgnb-2depth").stop().slideUp();
		})
		$(".hd-icons > li").hover(function() {
			$(this).children(".hdicons-2depth").stop().slideDown();
		}, function() {
			$(".hdicons-2depth").stop().slideUp();
		})	
		//Top / Bottom 아이콘 버튼
		$("#topIcon").click(function () {
		    $("html, body").animate({ scrollTop: 0 }, 400);
		});
		$("#bottomIcon").click(function () {
		    $("html, body").animate({ scrollTop: $(document).height() }, 400);
		});
		$(window).scroll(function () {
		    if ($(this).scrollTop() > 200) {
		        $("#scrollIconBtn").fadeIn();
		    } else {
		        $("#scrollIconBtn").fadeOut();
		    }
		});	
		
		
})//$(function)

$(window).on("scroll", function () {
    if ($(window).scrollTop() > 50) {
        $("#header").addClass("scrolled");
    } else {
        $("#header").removeClass("scrolled");
    }
});

/* 공통 hidden input 생성 */
function createHidden(name, value) {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = name;
    input.value = value;
    return input;
}





