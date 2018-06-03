$(function(){
  // 差し込むhtmlの関数化
  function buildHTML(todo) {
    var html = $('<li class="todo">').append(todo.content);
    return html;
  }

  $("form").on("submit", function(e) {
    e.preventDefault();
    var textField = $(".form__text-field");
    var todo = textField.val();
    // var todo = $(".form__text-field").val();：変数化した為、コメアウト。
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
    .done(function(data) {
      // ビューにhtmlを差し込む。
      var html = buildHTML(data);
      $(".todos").append(html);
      // 入力フォームに空の値を入れる。
      textField.val("");
    })
    .fail(function() {
      // 通信失敗の表示
      alert("error");
    });

  });
});
