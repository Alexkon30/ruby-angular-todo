class AddProjectRefToTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :project, foreign_key: true
  end
end
