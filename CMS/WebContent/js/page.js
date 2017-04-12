jQuery(function($) {

	function downclick(page) {
		var pages = parseInt(page);// 
		var input = $("#curpage");

		if (input.val() != pages) {
			input.val(pages);
			pagesubmit();
		} else {
		}
	}
	function pagesubmit() {
		$("#form-list").submit();
	}

	$(".search").mouseover(function() {
		$("#curpage").val("1");
	});
	$(".page").click(function() {
		downclick($(this).attr("name"));
	});
});