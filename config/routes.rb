Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/postcodes/check',  to: 'postcodes#check'
  post '/postcodes/check',  to: 'postcodes#submit'
end
