Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show'
  get '/lessons', to: 'lessons#index'
  get '/lessons/:id', to: 'lessons#show'
  get '/courses/:course_id/lessons', to: 'course_lessons#index'
end
