require(["jquery"], function($) {
  $(function() {
    var redirectWithQueryString = function(destination) {
      window.location.href = destination + window.location.search;
    };

    var redirectWithOrder = function(order) {
      window.location.href = window.location.pathname + "?order_by=" + order;
    };

    $("button.all").on("click", function() {
      redirectWithQueryString("/gists/all");
    });

    $("button.not-done").on("click", function() {
      redirectWithQueryString("/gists");
    });

    $("span.sort select").on("change", function() {
      redirectWithOrder($(this).val());
    });

    $("input.done").on("click", function() {
      var li = $(this).closest("li");
      var done = $(this).attr("checked") !== undefined;

      $.ajax("/gist/" + $(this).val(), {
        type: "PUT",
        data: { gist: { done: done } },
        complete: function() {
          done ? li.addClass("gist-done") : li.removeClass("gist-done");
        }
      });
    });
  });
});
