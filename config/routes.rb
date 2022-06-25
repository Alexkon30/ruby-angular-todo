Rails.application.routes.draw do
  get '/projects', to: 'project#getAll'
  patch '/projects/:projectid/todos/:todoid', to: 'project#updateTodo'

  post '/todos', to: 'todos#createTodo'

  get '/delete-all', to: 'project#deleteAll'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
