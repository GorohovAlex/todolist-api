Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   'auth',          to: 'users#create'
      post   'auth/sign_in',  to: 'session#create'
      delete 'auth/sign_out', to: 'session#destroy'
    end
  end
end
