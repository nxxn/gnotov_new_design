Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    root to: "works#index"

    resources :works
    resources :messages
  end

  scope "(:locale)", :locale => /en|ru|lv/ do
    get '/portfolio', to: 'home#works'
    get '/contacts', to: 'home#contacts'
    get '/services', to: 'home#services'

    root to: "home#index"
  end

  post '/new_contact_message', to: 'messages#send_new_contact_form_message'

end
