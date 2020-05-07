Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :user, only: [:create]
      post 'auth', to: 'auth#sign_up'
    end
  end
end
