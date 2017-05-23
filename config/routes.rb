Rails.application.routes.draw do
  resources :pages

  get '/help',  to: 'static_pages#help'

  get '/home', to: 'pages#index'

  resources :payments

  get 'payments/new'

  resources :loans

  get '/loans', to: 'loans#index'

  get 'loans/new'

  get 'loans/show'

  get 'loans/edit'

  root "pages#index"
end
