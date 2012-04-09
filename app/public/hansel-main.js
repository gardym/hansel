require(["jquery"], function($) {
    $(function() {
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
