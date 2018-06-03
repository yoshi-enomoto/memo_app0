$(function(){
  $("form").on("submit", function(e) {
    e.preventDefault();
    var todo = $(".form__text-field").val();
    $.ajax({
      // http通信の種類記述
      type: "post",
      // リクエスト送信先のurl
      url: "/todos.json",
      // サーバーに送信する値を記述
      // 『params.require{:todo).permit(:content)』と重ね合わせられる？
      data: {
        todo: {
          content: todo
        }
      },
      // サーバーから返されるデータの型を指定
      dataType: "json"
    })

  });
});
