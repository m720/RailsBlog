Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/users'

  mount_devise_token_auth_for 'Admin', at: 'v1/admins'

  namespace :v1 do
    namespace :admins do
      resources :users
    end

    namespace :users do
      resources :posts
    end
  end
end
