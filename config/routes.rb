Rails.application.routes.draw do
  root 'lesson_modules#index'

  devise_for :users
  resources :lessons, only: [:show]

  resources :lesson_modules, path: :modules do
    resources :lessons
  end
end
