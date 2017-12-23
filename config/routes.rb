Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root "teachers#index"
  resources :teachers
  resources :students
end
