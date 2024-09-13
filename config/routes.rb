Rails.application.routes.draw do
  root"students#index"
  resources :students do
    resource :result, only: [:new, :create, :show,:update,:destroy]
  end
end