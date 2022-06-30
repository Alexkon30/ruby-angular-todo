class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def createTodo
    #POST /todos body: {"text": "test3", "projectid": "0", "title": "job"}
    if params[:projectid] != 0
      @project = Project.find(params[:projectid])  
    else
      @project = Project.new(title: params[:title])
      @project.save
    end

    @todo = Todo.new(text: params[:text], isCompleted: false)
    @todo.project_id = @project.id
    @todo.save

    render :json => {:success => true, :project => @project, :todo => @todo}
  end
end
