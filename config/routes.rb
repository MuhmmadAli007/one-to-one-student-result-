Rails.application.routes.draw do
  root"students#index"
  resources :students do
    resource :result, only: [:new, :create,:edit, :show,:update,:destroy]
  end
end