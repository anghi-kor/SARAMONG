$(function() {

	// 탭 클릭 → 스크롤 이동
	$(".scroll-tab li").on("click", function() {
		$(".scroll-tab li").removeClass("active");
		$(this).addClass("active");

		const target = "#" + $(this).data("target");
		const top = $(target).offset().top - 100;

		$("html, body").animate({ scrollTop: top }, 300);
	});

	// 스크롤 → 탭 active
	$(window).on("scroll", function() {
		const scrollPos = $(window).scrollTop() + 150;

		$(".detail-section").each(function() {
			const sectionTop = $(this).offset().top;
			const sectionId = $(this).attr("id");

			if (scrollPos >= sectionTop) {
				$(".scroll-tab li").removeClass("active");
				$(`.scroll-tab li[data-target='${sectionId}']`).addClass("active");
			}
		});
	});

});
