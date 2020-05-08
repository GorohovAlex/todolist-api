Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   'auth',          to: 'users#create'
      post   'auth/sign_in',  to: 'login#create'
      delete 'auth/sign_out', to: 'login#destroy'
    end
  end
end
