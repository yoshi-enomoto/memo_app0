class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path, notice: "保存が完了しました"
    else
      flash.now[:alert] = "Todoを入力してください"
      @todos = Todo.all
      render :index
    end
  end

  private
  def todo_params
    # 『form_for』で送っている為、『require(:todo)』が必要
    params.require(:todo).permit(:content)
  end

end
