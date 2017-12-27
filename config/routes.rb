Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students

  root "teachers#index"
  resources :teachers do
    collection do
      get 'search'
      post 'search' => 'teachers#start_searching'
    end
  end

  resources :students
  resources :chat_groups
end
