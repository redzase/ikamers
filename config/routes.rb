Rails.application.routes.draw do
  resources :products
  resources :carts

  resources :orders

  put "order/pay/:id" => "orders#pay"
  post "register" => "users#register"
  post "login" => "authentication#login"
end
