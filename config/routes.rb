Rails.application.routes.draw do
  root "pages#about"

  get '/about', to: 'pages#about'
  get '/tools/firmware-partitions-calculation', to: 'pages#calc'
  get '/socs/legend', to: 'socs#legend'
  get '/sponsor', to: redirect('/support-open-source')
  get '/support-open-source', to: 'pages#support-open-source'
  get '/supported-hardware', to: 'cameras/socs#index'

  namespace :cameras do
    resources :vendors do
      resources :socs
    end
  end

  devise_for :admin
  namespace :admin do
    resources :socs
  end
  as :admin do
    get "/admin", to: "admin/dashboard#show", as: "admin_root"
    get "/admin/sign_out", to: "devise/sessions#destroy"
  end
end
