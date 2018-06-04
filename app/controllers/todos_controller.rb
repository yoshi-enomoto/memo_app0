class TodosController < ApplicationController
  def index
    # indexでnewも兼ねている為、『@todo』を記載
    # 表示の順番を作成日時が古い順に。
    @todos = Todo.order("created_at ASC")
    # @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      # 下記をそのまま『format.html』内に記述。
      # redirect_to root_path, notice: "保存が完了しました"
      respond_to do |format|
        format.html { redirect_to root_path, notice: "保存が完了しました" }
        format.json { render json: @todo}
      end
    else
      flash.now[:alert] = "Todoを入力してください"
      @todos = Todo.all
      render :index
    end
  end

  private
  def todo_params
    # 『form_for』で送っている為、『require(:todo)』が必要
    # params.require(:todo).permit(:content)
    # テストを通す為に変更1/2
    params.fetch(:todo, {}).permit(:content)
  end

end
