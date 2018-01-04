Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers, controllers: {
    omniauth_callbacks: 'teachers/omniauth_callbacks'
  }

  root "teachers#index"
  resources :teachers, except: [:new, :create, :destroy] do
    collection do
      get 'search'
      post 'search' => 'teachers#start_searching'
    end
  end

  resources :students, only: :show

  resources :chat_groups, only: [:show, :create] do
    resources :messages, only: :create
  end

  resources :subjects, only: [:new, :create]
end
