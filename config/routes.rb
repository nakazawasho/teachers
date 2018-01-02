Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students

  root "teachers#index"
  resources :teachers, without: [:new, :create, :destroy] do
    collection do
      get 'search'
      post 'search' => 'teachers#start_searching'
    end
  end

  resources :students, only: :show
  resources :chat_groups, only: [:show, :create] do
    resources :messages, only: :create
  end
end
