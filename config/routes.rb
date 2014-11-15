Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'

  resources :posts, path: '/blog' do
    resources :comments, :only => [:create]
  end

  resources :pages, path: '', :except => [:index]

  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_error'
  get '/422' => 'errors#unprocessable_entity'

end
