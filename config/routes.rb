Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post   'auth',          to: 'users#create'
      post   'auth/sign_in',  to: 'session#create'
      delete 'auth/sign_out', to: 'session#destroy'
    end
  end
end
