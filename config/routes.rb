Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/courses', to: 'courses#index'
  get '/courses/new', to: 'courses#new'
  get '/courses/:id', to: 'courses#show'
  get '/courses/:id/edit', to: 'courses#edit'
  post '/courses', to: 'courses#create'
  get '/lessons', to: 'lessons#index'
  get '/lessons/:id', to: 'lessons#show'
  get '/courses/:course_id/lessons', to: 'course_lessons#index'
  patch '/courses/:id', to: 'courses#update'
  get '/courses/:id/lessons/new', to: 'course_lessons#new'
  post '/courses/:course_id/lessons', to: 'course_lessons#create'
end
