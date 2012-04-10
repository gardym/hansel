require(["jquery"], function($) {
    $(function() {

				$("button.all").on("click", function() {
					window.location.href = "/gists/all" + window.location.search;
				});

				$("button.not-done").on("click", function() {
					window.location.href = "/gists" + window.location.search;
				});

				$("span.sort select").on("change", function() {
					window.location.href = window.location.pathname + "?order_by=" + $(this).val();
				});

        $("input.done").on("click", function() {
					var li = $(this).closest("li");
					var done = $(this).attr("checked") !== undefined;

					$.ajax("/gist/" + $(this).val(), {
						data: { gist: { done: done } },
						type: "PUT",
						complete: function() {
							if(done)
								li.addClass("gist-done");
							else
								li.removeClass("gist-done");
						}
					});
					
        });

    });
});
