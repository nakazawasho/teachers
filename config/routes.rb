Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students

  root "teachers#index"
  resources :teachers do
    collection do
      get 'search'
    end
  end

  resources :students
end
