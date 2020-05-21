Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post   'auth',          to: 'users#create'
      post   'auth/sign_in',  to: 'session#create'
      delete 'auth/sign_out', to: 'session#destroy'
      
      resources :projects, only: %i[index create update destroy] do
        resources :tasks, only: %i[index create]
      end

      resources :tasks, only: %i[show update destroy] do
        resources :task_comments, only: %i[index create]
      end
      
      resources :task_comments, only: %i[destroy]
    end
  end
end
