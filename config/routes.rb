Rails.application.routes.draw do

  resources :players
  resources :properties



  get '/properties/:id/buy_property', to: 'properties#buy_property'
  post '/properties/:id/buy_property', to: 'properties#update'
  get '/properties/:id/sell_property', to: 'properties#sell_property'
  get '/properties/:id/mortgage', to: 'properties#mortgage'
  get '/properties/:id/pay_mortgage', to: 'properties#pay_mortgage'
  get '/properties/:id/pay_rent', to: 'properties#pay_rent'
  get '/properties/:id/pay_utility', to: 'properties#pay_utility'
  get '/properties/:id/build_house', to: 'properties#build_house'
  get '/properties/:id/sell_house', to: 'properties#sell_house'
  get '/properties/:id/build_hotel', to: 'properties#build_hotel'
  get '/properties/:id/sell_hotel', to: 'properties#sell_hotel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
