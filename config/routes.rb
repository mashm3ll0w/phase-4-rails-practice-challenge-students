Rails.application.routes.draw do
  resources :students
  resources :instructors, only: %i[index show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
