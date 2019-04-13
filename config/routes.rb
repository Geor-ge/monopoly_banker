Rails.application.routes.draw do

  resources :players
  resources :properties



  get '/properties/:id/buy_property', to: 'properties#buy_property'
  get '/properties/:id/pay_rent', to: 'properties#pay_rent'
  get '/properties/:id/build_house', to: 'properties#build_house'
  get '/properties/:id/build_hotel', to: 'properties#build_hotel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
