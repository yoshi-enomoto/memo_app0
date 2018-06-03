class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
  end

  private
  def todo_params
    params.require(:todo).permit(:content)
    # require(:todo).permit(:content)：検証用に記載残し
  end

end
