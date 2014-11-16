Rails.application.routes.draw do
  root 'lesson_modules#index'

  devise_for :users
  resources :lessons, only: [:show] do
    post 'complete', controller: :lesson_progresses, action: :complete
  end

  resources :lesson_modules, path: :modules do
    resources :lessons
  end

  post '/check/ruby', controller: :check, action: :ruby, as: :check_ruby
end
