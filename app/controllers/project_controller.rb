class ProjectController < ApplicationController
  skip_before_action :verify_authenticity_token

  def getAll
    #GET
    @projects = Project.all.to_a
    ActiveRecord::Associations::Preloader.new.preload(@projects, :todos)
    @result = []
    @projects.each do |project|
      obj = Hash['title' => project.title, 'id' => project.id, 'todos' => project.todos]
      @result.push(obj)
    end
    render :json => @result
  end

  def updateTodo
    #PATCH
    @todo = Todo.find(params[:todoid])
    @todo.isCompleted = !@todo.isCompleted
    @todo.save
    render :json => {:success => true, :todo => @todo}
  end

  def deleteAll
    @todos = Todo.all
    @todos.each do |todo|
      todo.destroy
    end

    @projects = Project.all
    @projects.each do |project|
      project.destroy
    end

    render :text => 'delete all'
  end
end
