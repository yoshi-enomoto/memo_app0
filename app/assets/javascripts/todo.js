$(function(){
  $("form").on("submit", function(e) {
    e.preventDefault();
    var todo = $(".form__text-field").val()
    console.log(todo);
  });
});
